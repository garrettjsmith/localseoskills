# Local SEO Skills installer for Windows (PowerShell).
#
# Installs the skills into $HOME\.claude\skills\localseoskills so Claude Code
# and any agent that reads the Agent Skills spec can discover them. If a
# previous install exists, fetches latest and resets cleanly, preserving any
# briefs/ directory (client data) by backing it up first.
#
# Compatible with PowerShell 5.1 (built in to Windows 10/11) and PowerShell 7+.
#
# Usage (one-liner):
#   irm https://raw.githubusercontent.com/garrettjsmith/localseoskills/main/install.ps1 | iex
#
# Or after cloning:
#   powershell -ExecutionPolicy Bypass -File localseoskills\install.ps1
#
# Custom install location:
#   $env:LSS_INSTALL_DIR = "C:\custom\path"
#   powershell -ExecutionPolicy Bypass -File localseoskills\install.ps1

$ErrorActionPreference = "Stop"

# Ensure our own Write-Host output renders UTF-8 correctly on Windows PS 5.1.
try { [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new() } catch {}

$RepoUrl    = "https://github.com/garrettjsmith/localseoskills.git"
# If LSS_INSTALL_DIR is set, it must be non-empty. An empty-but-set env var
# is almost always an accident (wrapper script typo, expansion-to-nothing)
# and silently falling through to the default would mask a real bug.
$InstallDir = if (Test-Path Env:LSS_INSTALL_DIR) {
    if ([string]::IsNullOrWhiteSpace($env:LSS_INSTALL_DIR)) {
        Write-Host "x LSS_INSTALL_DIR is set but empty. Unset it to use the default install location." -ForegroundColor Red
        exit 1
    }
    $env:LSS_INSTALL_DIR
} else {
    Join-Path $HOME ".claude\skills\localseoskills"
}

function Say($msg)  { Write-Host "> $msg" -ForegroundColor Green }
function Fail($msg) { Write-Host "x $msg" -ForegroundColor Red; exit 1 }

function Test-SafeInstallPath {
    # Pre-install sanity guard. Install is not destructive like uninstall, but
    # an admin running `install.ps1` with $env:LSS_INSTALL_DIR pointing at a
    # system location would happily create a skills directory in
    # C:\Windows\System32 or similar. Mirror the key refusals from
    # uninstall.ps1's Test-SafePath so those locations get rejected here too.
    param([string]$Path)
    if ([string]::IsNullOrWhiteSpace($Path)) { Fail "Refusing to install to empty path." }
    if ($Path.Length -lt 10) { Fail "Refusing to install to suspiciously short path: $Path" }

    $forward = $Path -replace '\\','/'
    if ($forward -match '(^|/)\.\.(/|$)') {
        Fail "Refusing to install to path with .. traversal: $Path"
    }
    # True 8.3 short-name alias only: 1-6 base chars + tilde + digits,
    # optional 1-3 char extension. Anchored to segment boundaries so
    # legit filenames with tilde suffix (e.g. draft~1-notes.md) pass.
    if ($forward -match '(?i)(^|/)[A-Z0-9]{1,6}~[0-9]+(\.[A-Z0-9]{1,3})?(/|$)') {
        Fail "Refusing to install to 8.3 short-name path: $Path (use the long form)"
    }
    # Match any leading backslash, not just `\\`. Real-Windows regression
    # showed PowerShell 5.1 normalizes `\\?\` to `\?\` at env-var / process
    # boundaries, so `^\\\\` missed UNC / device / admin-share inputs. No
    # legitimate install path on Windows starts with a backslash.
    if ($Path -match '^\\') {
        Fail "Refusing to install to UNC, device-namespace, or backslash-rooted path: $Path"
    }

    $blocked = @(
        $env:SystemRoot,
        $env:SystemDrive,
        $env:ProgramFiles,
        ${env:ProgramFiles(x86)},
        $env:ProgramData,
        "C:\", "C:\Windows", "C:\Windows\System32", "C:\Windows\SysWOW64",
        "C:\Program Files", "C:\Program Files (x86)", "C:\ProgramData",
        "/", "/usr", "/etc", "/var", "/bin", "/sbin", "/boot", "/dev",
        "/proc", "/sys", "/Library", "/System", "/Applications", "/private"
    ) | Where-Object { $_ }

    $normalized = $Path.TrimEnd('\','/')
    foreach ($b in $blocked) {
        $bt = $b.TrimEnd('\','/')
        if ([string]::Equals($normalized, $bt, [StringComparison]::OrdinalIgnoreCase)) {
            Fail "Refusing to install to dangerous path: $Path (equals blocklisted $bt)"
        }
        if ($bt.Length -gt 0 -and $normalized.Length -gt $bt.Length) {
            $prefix = $normalized.Substring(0, $bt.Length + 1)
            if ([string]::Equals($prefix, $bt + '\', [StringComparison]::OrdinalIgnoreCase) -or
                [string]::Equals($prefix, $bt + '/', [StringComparison]::OrdinalIgnoreCase)) {
                # Allow the default /Users/<user> or C:\Users\<user> subtree by
                # deferring to the trusted-home fast-allow used by uninstall.
                $trustedHome = $null
                try { $trustedHome = [Environment]::GetFolderPath([Environment+SpecialFolder]::UserProfile) } catch {}
                if ($trustedHome) {
                    $tht = $trustedHome.TrimEnd('\','/')
                    if ($normalized.Length -gt $tht.Length) {
                        $homePrefix = $normalized.Substring(0, $tht.Length + 1)
                        if ([string]::Equals($homePrefix, $tht + '\', [StringComparison]::OrdinalIgnoreCase) -or
                            [string]::Equals($homePrefix, $tht + '/', [StringComparison]::OrdinalIgnoreCase)) {
                            continue
                        }
                    }
                }
                Fail "Refusing to install to dangerous path: $Path (nested under blocklisted $bt)"
            }
        }
    }
}

function Invoke-Git {
    # $Args is a PowerShell reserved automatic variable. Using $GitArgs avoids
    # shadowing and the subtle misbehavior that causes in PS 5.1.
    param([string[]]$GitArgs)
    # Under $ErrorActionPreference=Stop, PS 5.1 can treat git's progress
    # output on stderr as a terminating error even when the command
    # succeeds. Localize EAP for the duration of the call and cast each
    # record to a plain string so Write-Host never sees an ErrorRecord.
    $prev = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        & git @GitArgs 2>&1 | ForEach-Object { Write-Host ([string]$_) }
    } finally {
        $ErrorActionPreference = $prev
    }
    if ($LASTEXITCODE -ne 0) {
        Fail ("git " + ($GitArgs -join ' ') + " failed with exit code $LASTEXITCODE")
    }
}

function Backup-Briefs {
    param([string]$Dir)
    $briefs = Join-Path $Dir "briefs"
    if (-not (Test-Path $briefs)) { return }

    $backupRoot = Join-Path $HOME ".claude"
    if (-not (Test-Path $backupRoot)) {
        New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
    }
    $ts  = Get-Date -Format "yyyyMMdd-HHmmss"
    $dst = Join-Path $backupRoot "lss-briefs-backup-$ts"
    # Collision-safe: append a counter if the target already exists.
    $n = 1
    while (Test-Path $dst) {
        $dst = Join-Path $backupRoot "lss-briefs-backup-$ts-$n"
        $n++
    }
    Say "Backing up briefs to $dst"
    Copy-Item -Recurse -Force $briefs $dst
}

function Install-Fresh {
    # Build the staging directory next to $InstallDir (same volume) so
    # Move-Item doesn't hit cross-drive failures when %TEMP% is on C: and
    # $InstallDir is on D:.
    $parent = Split-Path $InstallDir -Parent
    if (-not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    $tmp = Join-Path $parent (".lss-install-" + [System.Guid]::NewGuid().ToString("N").Substring(0,8))
    New-Item -ItemType Directory -Path $tmp -Force | Out-Null
    try {
        Say "Cloning Local SEO Skills"
        # core.longpaths=true lets git clone succeed on Windows even when the
        # resolved path exceeds the legacy 260-character MAX_PATH limit.
        Invoke-Git @("-c", "core.longpaths=true", "clone", "--depth", "1", $RepoUrl, (Join-Path $tmp "localseoskills"))
        # Defense in depth: re-check before the move. The lock should already
        # prevent a concurrent process from creating $InstallDir, but verify.
        if (Test-Path $InstallDir) {
            Fail "$InstallDir appeared mid-install. Remove it and rerun."
        }
        Move-Item -Path (Join-Path $tmp "localseoskills") -Destination $InstallDir
    } finally {
        # Reset read-only bits on any .git objects that Windows would refuse
        # to delete, then clean up staging.
        if (Test-Path $tmp) {
            Get-ChildItem -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue |
                ForEach-Object {
                    try {
                        $_.Attributes = $_.Attributes -band (-bnot [System.IO.FileAttributes]::ReadOnly)
                    } catch {}
                }
            Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue
        }
    }
}

function Update-Existing {
    Say "Existing install detected at $InstallDir, updating"

    # Localize $ErrorActionPreference around the bare `git` probes below.
    # Under the script-wide `Stop` preference, PS 5.1 can treat git's stderr
    # output (progress, info messages) as a terminating error even when the
    # command succeeds. Each probe is followed by a check of $LASTEXITCODE
    # or captured output, so we don't need Stop semantics during probing.
    $prevEAP = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        # Sanity check: the existing checkout's origin must actually be this
        # repo. Without this, a misconfigured $env:LSS_INSTALL_DIR pointing
        # at an unrelated git checkout would get `git reset --hard` against
        # the WRONG origin's branch, silently destroying the user's work.
        $originUrl = (& git -C "$InstallDir" remote get-url origin 2>$null)
        $expected = @(
            $RepoUrl,
            ($RepoUrl -replace '\.git$',''),
            (($RepoUrl -replace '\.git$','') + '.git'),
            'git@github.com:garrettjsmith/localseoskills',
            'git@github.com:garrettjsmith/localseoskills.git',
            'ssh://git@github.com/garrettjsmith/localseoskills',
            'ssh://git@github.com/garrettjsmith/localseoskills.git'
        )
        if (-not $originUrl -or -not ($expected -contains $originUrl)) {
            Fail "Refusing to update: $InstallDir exists but its origin ($originUrl) is not $RepoUrl. Remove $InstallDir manually and rerun, or unset LSS_INSTALL_DIR."
        }

        # Refuse to clobber uncommitted local changes inside the install dir.
        # Covers tracked-modified (diff), staged (diff --cached), AND
        # untracked files not gitignored. Without the untracked check, a
        # user's personal note or experimental file dropped into the install
        # dir would be silently wiped by `git reset --hard`.
        # `--exclude-standard` respects .gitignore, so briefs/<client>/ and
        # .env remain invisible here.
        & git -C "$InstallDir" diff --quiet *> $null
        $dirty = ($LASTEXITCODE -ne 0)
        & git -C "$InstallDir" diff --cached --quiet *> $null
        $staged = ($LASTEXITCODE -ne 0)
        $untracked = (& git -C "$InstallDir" ls-files --others --exclude-standard 2>$null)
        if ($dirty -or $staged -or $untracked) {
            Fail "Refusing to update: $InstallDir has uncommitted or untracked files. Commit, stash, or remove them (or remove $InstallDir and rerun for a clean install)."
        }

        # Refuse to switch branches silently on a detached HEAD.
        $branch = (& git -C "$InstallDir" symbolic-ref --short HEAD 2>$null)
        if (-not $branch) {
            Fail "Refusing to update: $InstallDir is on a detached HEAD. Check out a branch first, or remove $InstallDir and rerun."
        }
    } finally {
        $ErrorActionPreference = $prevEAP
    }

    Backup-Briefs $InstallDir
    Invoke-Git @("-C", $InstallDir, "fetch", "--depth", "1", "origin", $branch)
    Invoke-Git @("-C", $InstallDir, "reset", "--hard", "origin/$branch")
}

function Configure-Mcp {
    # Non-interactive contexts (CI, remoting) skip MCP setup silently.
    if (-not [Environment]::UserInteractive) { return }

    Write-Host ""
    $answer = Read-Host "Connect LocalSEOData (free API key at localseodata.com/signup)? [Y/n]"
    if ($answer -match '^[Nn]') { return }

    $secure = Read-Host "API key" -AsSecureString
    $bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
    try {
        $apiKey = [Runtime.InteropServices.Marshal]::PtrToStringAuto($bstr)
    } finally {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)
    }
    if ([string]::IsNullOrWhiteSpace($apiKey)) {
        Say "Skipped. Configure MCP later per the README."
        return
    }

    $mcpUrl = "https://mcp.localseodata.com/mcp?key=$apiKey"
    $configured = $false

    # Claude Code CLI — check if already configured, then add with correct flags.
    if (Get-Command claude -ErrorAction SilentlyContinue) {
        $prevEAP = $ErrorActionPreference
        try {
            $ErrorActionPreference = 'Continue'
            $existing = & claude mcp list 2>$null
            if ($existing -match 'localseodata') {
                Say "LocalSEOData already configured in Claude Code, skipping."
                $configured = $true
            } else {
                & claude mcp add --transport http --scope user localseodata "$mcpUrl" 2>$null
                if ($LASTEXITCODE -eq 0) {
                    Say "LocalSEOData added to Claude Code (all projects)."
                    $configured = $true
                }
            }
        } catch {} finally {
            $ErrorActionPreference = $prevEAP
        }
    }

    # Claude Desktop (Windows) — edit the global config JSON directly.
    # PS 5.1 compatible: avoid -AsHashtable (PS 6+ only). Parse to PSObject,
    # convert manually to hashtable for safe key manipulation.
    $desktopConfig = Join-Path $env:APPDATA "Claude\claude_desktop_config.json"
    if (Test-Path $desktopConfig) {
        try {
            $config = @{}
            $raw = Get-Content -Raw $desktopConfig -ErrorAction SilentlyContinue
            if ($raw) {
                try {
                    $parsed = $raw | ConvertFrom-Json
                    $parsed.PSObject.Properties | ForEach-Object {
                        if ($_.Name -eq 'mcpServers' -and $_.Value) {
                            $servers = @{}
                            $_.Value.PSObject.Properties | ForEach-Object { $servers[$_.Name] = $_.Value }
                            $config[$_.Name] = $servers
                        } else {
                            $config[$_.Name] = $_.Value
                        }
                    }
                }
                catch {
                    $bak = "$desktopConfig.bak"
                    Copy-Item $desktopConfig $bak -Force
                    Say "Existing config was unparseable; backed up to $bak"
                    $config = @{}
                }
            }
            if (-not $config.ContainsKey('mcpServers')) {
                $config['mcpServers'] = @{}
            }
            if ($config['mcpServers'].ContainsKey('localseodata')) {
                Say "localseodata already in Claude Desktop config, updating."
            }
            $config['mcpServers']['localseodata'] = @{ url = $mcpUrl }
            # Atomic write: temp file then rename, so a kill mid-write can't corrupt.
            $tmpFile = "$desktopConfig.$([System.Guid]::NewGuid().ToString('N').Substring(0,8)).tmp"
            $json = $config | ConvertTo-Json -Depth 10
            [System.IO.File]::WriteAllText($tmpFile, $json, [System.Text.UTF8Encoding]::new($false))
            Move-Item -Path $tmpFile -Destination $desktopConfig -Force
            Say "LocalSEOData added to Claude Desktop."
            $configured = $true
        } catch {
            if (Test-Path $tmpFile -ErrorAction SilentlyContinue) {
                Remove-Item $tmpFile -Force -ErrorAction SilentlyContinue
            }
            # Swallow — fall through to manual instructions.
        }
    }

    if (-not $configured) {
        Say "Add LocalSEOData to your MCP config manually:"
        Write-Host ""
        Write-Host "  `"localseodata`": { `"url`": `"$mcpUrl`" }"
        Write-Host ""
    }
}

function Main {
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Fail "git is required but not found. Install git for Windows and try again."
    }

    # Refuse system paths, UNC/device forms, 8.3 short names, and paths with
    # .. traversal BEFORE doing any filesystem work. Protects an admin-level
    # install from mistakenly creating a skills directory under Windows,
    # System32, Program Files, or other shared roots.
    Test-SafeInstallPath $InstallDir

    # Pre-flight writability check. Catches custom LSS_INSTALL_DIR pointing
    # somewhere the user can't write before git or Move-Item give cryptic
    # errors.
    $parent = Split-Path $InstallDir -Parent
    try {
        if (-not (Test-Path $parent)) {
            New-Item -ItemType Directory -Path $parent -Force -ErrorAction Stop | Out-Null
        }
        $probe = Join-Path $parent (".lss-writable-probe-" + [System.Guid]::NewGuid().ToString("N").Substring(0,8))
        # No -Force: if the 8-char GUID-suffixed probe path collides with an
        # existing file (astronomically unlikely but possible), we want the
        # collision to fail the probe rather than silently clobber. The
        # -ErrorAction Stop makes collision throw into the catch.
        New-Item -ItemType File -Path $probe -ErrorAction Stop | Out-Null
        Remove-Item -Path $probe -Force -ErrorAction SilentlyContinue
    } catch {
        Fail "$parent is not writable by this user. Set `$env:LSS_INSTALL_DIR to a user-writable path, or rerun with appropriate permissions."
    }

    # Serialize concurrent installs. New-Item -ItemType Directory fails
    # atomically when the directory exists, which gives us a POSIX-style
    # lock. Set the lock after the writability check and before any work.
    $lockPath = "$InstallDir.lock"
    $lockOwned = $false
    try {
        New-Item -ItemType Directory -Path $lockPath -ErrorAction Stop | Out-Null
        $lockOwned = $true
    } catch {
        Fail "Another install is in progress (lock at $lockPath). If stale, remove it and retry."
    }

    try {
        $gitDir = Join-Path $InstallDir ".git"
        $isGitCheckout = $false
        if (Test-Path $gitDir) {
            # Wrap in try/catch because $ErrorActionPreference=Stop turns git's
            # stderr from a corrupt-repo check into a terminating error on
            # PS 5.1. Swallow it; $isGitCheckout stays false and the next
            # branch Fails cleanly with our intended message.
            try {
                & git -C "$InstallDir" rev-parse --git-dir *> $null
                if ($LASTEXITCODE -eq 0) { $isGitCheckout = $true }
            } catch {
                # intentional: keep $isGitCheckout = $false
            }
        }

        if ($isGitCheckout) {
            Update-Existing
        } elseif (Test-Path $InstallDir) {
            Fail "$InstallDir exists and is not a clean git checkout. Remove it and rerun."
        } else {
            Install-Fresh
        }

        Say "Local SEO Skills installed."

        Configure-Mcp

        Write-Host ""
        Write-Host "Next steps:"
        Write-Host "  1. Open Claude Code or your preferred AI agent."
        Write-Host "  2. Mention any local business to get started. For example:"
        Write-Host "       'Audit Mike's Plumbing in Buffalo'"
        Write-Host "     The agent will ask 5 questions, run an audit, and set up a"
        Write-Host "     persistent brief for ongoing work."
        Write-Host ""
        Write-Host "Docs:      https://github.com/garrettjsmith/localseoskills"
        Write-Host "Community: https://discord.gg/dBtF26Ga2a"
    } finally {
        # Only release the lock if THIS process acquired it.
        if ($lockOwned -and (Test-Path $lockPath)) {
            Remove-Item -Path $lockPath -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

Main
