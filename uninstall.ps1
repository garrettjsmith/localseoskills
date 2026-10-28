# Local SEO Skills uninstaller for Windows (PowerShell).
#
# Removes $HOME\.claude\skills\localseoskills. By default, any briefs\ directory
# (client data) is backed up to $HOME\.claude\lss-briefs-backup-<timestamp>
# before removal. Pass -NoBackup to skip the backup step.
#
# Compatible with PowerShell 5.1 and PowerShell 7+.
#
# Usage:
#   powershell -ExecutionPolicy Bypass -File uninstall.ps1
#   powershell -ExecutionPolicy Bypass -File uninstall.ps1 -Force
#   powershell -ExecutionPolicy Bypass -File uninstall.ps1 -NoBackup

[CmdletBinding()]
param(
    [switch]$Force,
    [switch]$NoBackup
)

$ErrorActionPreference = "Stop"

try { [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new() } catch {}

# If LSS_INSTALL_DIR is set, it must be non-empty. An empty-but-set env var
# is almost always an accident (wrapper script typo, expansion-to-nothing)
# and silently falling through to the default would mask a real bug. Prefer
# failing loudly so the caller can fix it. If the env var is not set at all,
# use the default install location.
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

function Remove-Path {
    param([string]$Path)
    # Walk descendants FIRST and refuse if any is a reparse point. Remove-Item
    # -Recurse under the \\?\ namespace on PS 5.1 crosses into junction
    # targets, which could delete files outside the install tree. Top-level
    # reparse is checked by Test-SafePath; this catches attacker-planted
    # junctions inside the install dir between check and rm.
    Get-ChildItem -LiteralPath $Path -Recurse -Force -ErrorAction SilentlyContinue |
        ForEach-Object {
            if ($_.Attributes -band [IO.FileAttributes]::ReparsePoint) {
                Fail "Refusing to remove: reparse point found at $($_.FullName). Remove it manually and rerun."
            }
            # Strip only the ReadOnly bit on files that Windows won't let
            # Remove-Item delete. Setting Attributes = 'Normal' would also
            # clear the Directory bit, which throws on directories.
            try {
                $_.Attributes = $_.Attributes -band (-bnot [System.IO.FileAttributes]::ReadOnly)
            } catch {}
        }
    # PS 5.1 Remove-Item doesn't auto-opt into Windows long-path APIs, so paths
    # over MAX_PATH (260 chars) fail on files inside .git/objects/pack/.
    # Prefix local drive-letter paths with \\?\ so the Unicode long-path
    # entrypoints are used. The uninstall safety guards already refuse
    # non-drive-letter targets on Windows, so scoping to drive letters is safe.
    $nativePath = if ($Path -match '^[A-Za-z]:\\' -and -not $Path.StartsWith('\\?\')) {
        "\\?\$Path"
    } else {
        $Path
    }
    Remove-Item -LiteralPath $nativePath -Recurse -Force
}

function Backup-Briefs {
    param([string]$Dir)
    $briefs = Join-Path $Dir "briefs"
    if (-not (Test-Path $briefs)) { return }
    # Refuse to copy if briefs is a reparse point. Copy-Item -Recurse follows
    # top-level junctions and symlinks, which would silently back up whatever
    # they target (e.g., an attacker-planted junction pointing at the user's
    # Documents). Mirrors the bash `cp -a` symlink guard.
    try {
        $briefsItem = Get-Item -LiteralPath $briefs -Force -ErrorAction Stop
        if ($briefsItem.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            Fail "Refusing to back up briefs: $briefs is a reparse point (symlink or junction)."
        }
    } catch {
        # briefs exists per Test-Path above; if Get-Item fails here the FS is
        # in a state we don't want to copy from. Bail loudly.
        Fail "Could not stat $briefs before backup: $_"
    }
    $parent = Join-Path $HOME ".claude"
    if (-not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    $ts  = Get-Date -Format "yyyyMMdd-HHmmss"
    $dst = Join-Path $parent "lss-briefs-backup-$ts"
    $n = 1
    while (Test-Path $dst) {
        $dst = Join-Path $parent "lss-briefs-backup-$ts-$n"
        $n++
    }
    Say "Backing up briefs to $dst"
    Copy-Item -Recurse -Force $briefs $dst
}

function Test-SafePath {
    param([string]$Path)
    # Refuse catastrophic targets: empty, too short, root drives, $HOME,
    # or common system roots. Protects against LSS_INSTALL_DIR=/ or =$HOME
    # followed by -Force, plus traversal attacks like $HOME\..\..\Windows
    # that normalize to a system root. Parallels uninstall.sh guards.
    if ([string]::IsNullOrWhiteSpace($Path)) {
        Fail "Refusing to operate on empty path."
    }
    if ($Path.Length -lt 10) {
        Fail "Refusing to operate on suspiciously short path: $Path"
    }

    # Refuse outright if the path contains any `..` segment. Path traversal
    # makes the final target ambiguous and can defeat Resolve-Path when
    # intermediate segments don't exist.
    $forward = $Path -replace '\\','/'
    if ($forward -match '(^|/)\.\.(/|$)') {
        Fail "Refusing to operate on path with .. traversal: $Path"
    }

    # Refuse any 8.3 short-name segment (e.g. PROGRA~1, WINDOW~1). These
    # alias into system paths but string-compare unequal to the long form:
    # C:\PROGRA~1 would bypass a blocklist containing C:\Program Files.
    # Match true Windows 8.3 short-name aliases only: 1-6 base chars +
    # tilde + digits, optionally followed by a 1-3 char extension.
    # Anchored to path-segment boundaries so regular filenames like
    # `draft~1-notes.md` or `backup~2` don't trigger. Case-insensitive
    # because 8.3 is uppercase by convention but NTFS is case-insensitive.
    if ($forward -match '(?i)(^|/)[A-Z0-9]{1,6}~[0-9]+(\.[A-Z0-9]{1,3})?(/|$)') {
        Fail "Refusing to operate on 8.3 short-name path: $Path (use the long form)"
    }

    # Reject UNC, device-namespace, and extended-length paths outright.
    # These syntactic forms bypass drive-letter blocklist comparisons and
    # can route Remove-Item through namespaces that ignore junction
    # safeguards.
    #
    # IMPORTANT: match any leading backslash, not just `\\`. A real-Windows
    # regression showed that \\?\ / \\.\ / \\host\share inputs sometimes
    # arrive here with one leading `\` stripped (PowerShell normalizes the
    # form at the env-var / process boundary on 5.1). The classic `^\\\\`
    # regex missed those. No legitimate install path on Windows starts
    # with a backslash, so refuse `^\` broadly.
    if ($Path -match '^\\') {
        Fail "Refusing to operate on UNC, device-namespace, or backslash-rooted path: $Path"
    }

    # Build the dangerous list dynamically from environment variables so
    # corporate Windows installs (OneDrive-redirected home, non-C: system
    # drive, localized Program Files) are covered without hardcoding. Then
    # union with every local + network drive root and static Windows +
    # POSIX top-level paths any LSS user could plausibly pass through
    # cross-platform PS Core.
    $envDangerous = @(
        $env:USERPROFILE,
        $env:PUBLIC,
        $env:SystemDrive,
        $env:SystemRoot,
        $env:ProgramFiles,
        ${env:ProgramFiles(x86)},
        $env:ProgramData,
        $env:LOCALAPPDATA,
        $env:APPDATA,
        $env:OneDrive,
        $env:OneDriveCommercial,
        $env:OneDriveConsumer
    )
    # Enumerate every local + network drive root. If GetDrives throws (can
    # happen in locked-down JEA / Constrained Language remoting), fall back
    # to a hardcoded A..Z list so we never leave drive roots unprotected.
    $driveRoots = @()
    try {
        $driveRoots = [System.IO.DriveInfo]::GetDrives() |
            ForEach-Object { $_.Name.TrimEnd('\','/') + '\' }
    } catch {}
    if (-not $driveRoots -or $driveRoots.Count -eq 0) {
        $driveRoots = 65..90 | ForEach-Object { [char]$_ + ':\' }
    }

    $staticDangerous = @(
        "C:\", "C:\Windows", "C:\Windows\System32", "C:\Windows\SysWOW64",
        "C:\Users", "C:\Users\Public",
        "C:\Program Files", "C:\Program Files (x86)", "C:\ProgramData",
        # POSIX (cross-platform PS Core + WSL scenarios)
        "/", "/root", "/home", "/Users",
        "/usr", "/etc", "/var", "/tmp",
        "/bin", "/sbin", "/opt", "/boot",
        "/dev", "/proc", "/sys", "/lib",
        "/mnt", "/srv", "/run", "/media", "/snap",
        # macOS
        "/Library", "/System", "/Applications", "/private",
        "/cores", "/Volumes", "/Network", "/.vol"
    )

    $dangerous = @($envDangerous + $driveRoots + $staticDangerous) | Where-Object { $_ }

    # Trusted home for the fast-allow shortcut below. [Environment]::GetFolderPath
    # uses the Win32 SHGetFolderPath API (not the USERPROFILE env var), so an
    # attacker running `$env:USERPROFILE='C:\Windows'` before the script cannot
    # redirect "inside home" to a system path. The bash side uses the same
    # pattern via `id -un` + dscl/getent. If resolution throws (extremely rare),
    # the fast-allow is disabled and every candidate path must pass the
    # blocklist on its own merits.
    $trustedHome = $null
    try {
        $trustedHome = [Environment]::GetFolderPath([Environment+SpecialFolder]::UserProfile)
    } catch {}
    if ($trustedHome) { $trustedHome = $trustedHome.TrimEnd('\','/') }

    # Reject a path that is itself a reparse point (symlink or junction).
    # Remove-Item -Recurse on a junction can cross into the target on older
    # PowerShell; refusing up front is safer than relying on Remove-Item's
    # behavior across versions. Remove-Path walks descendants for the same
    # reason.
    try {
        $item = Get-Item -LiteralPath $Path -Force -ErrorAction Stop
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) {
            Fail "Refusing to operate on a reparse point (symlink or junction): $Path"
        }
    } catch {
        # Path doesn't exist yet; skip the reparse check, rely on blocklist.
    }

    # Check both the raw input and the Resolve-Path result. Resolve-Path
    # canonicalizes .. segments and symlinks; without this, an attacker can
    # bypass the blocklist with input like $HOME\..\..\Windows.
    $candidates = @($Path)
    try {
        $canonical = (Resolve-Path -LiteralPath $Path -ErrorAction Stop).Path
        if ($canonical -and $canonical -ne $Path) { $candidates += $canonical }
    } catch {
        # Path doesn't exist yet; raw check is enough.
    }

    # Compare with [String]::Equals using OrdinalIgnoreCase so cultural
    # variants (Turkish dotted/dotless I, etc.) cannot cause a case-aware
    # comparison to split `I` and `ı` and let `C:\wINDOWS` slip past. Match
    # BOTH equality and path-prefix so nested targets (C:\Windows\System32
    # under blocklisted C:\Windows) are also refused. Skip the prefix check
    # for candidates strictly inside the trusted home, otherwise the default
    # `C:\Users\<user>\.claude\...` would false-match the `C:\Users` entry.
    foreach ($candidate in $candidates) {
        $normalized = $candidate.TrimEnd('\','/')

        $insideHome = $false
        if ($trustedHome -and $normalized.Length -gt $trustedHome.Length) {
            $homePrefix = $normalized.Substring(0, $trustedHome.Length + 1)
            if ([string]::Equals($homePrefix, $trustedHome + '\', [StringComparison]::OrdinalIgnoreCase) -or
                [string]::Equals($homePrefix, $trustedHome + '/', [StringComparison]::OrdinalIgnoreCase)) {
                $insideHome = $true
            }
        }

        foreach ($d in $dangerous) {
            $blocked = $d.TrimEnd('\','/')
            if ([string]::Equals($normalized, $blocked, [StringComparison]::OrdinalIgnoreCase)) {
                Fail "Refusing to operate on dangerous path: $Path (resolves to $candidate, equals blocklisted $blocked)"
            }
            if (-not $insideHome -and $blocked.Length -gt 0 -and $normalized.Length -gt $blocked.Length) {
                $prefix = $normalized.Substring(0, $blocked.Length + 1)
                if ([string]::Equals($prefix, $blocked + '\', [StringComparison]::OrdinalIgnoreCase) -or
                    [string]::Equals($prefix, $blocked + '/', [StringComparison]::OrdinalIgnoreCase)) {
                    Fail "Refusing to operate on dangerous path: $Path (resolves to $candidate, nested under blocklisted $blocked)"
                }
            }
        }
    }
}

function Main {
    Test-SafePath $InstallDir

    if (-not (Test-Path $InstallDir)) {
        Say "Nothing to uninstall at $InstallDir"
        exit 0
    }

    if (-not $Force) {
        $answer = Read-Host "This will delete $InstallDir. Type 'yes' to continue"
        if ($answer -ne "yes") {
            Fail "Aborted."
        }
    }

    if (-not $NoBackup) {
        Backup-Briefs $InstallDir
    }

    # Remove the per-skill junctions install.ps1 created (ones into this install only).
    $skillsDir = if ($env:LSS_SKILLS_DIR) { $env:LSS_SKILLS_DIR } else { Join-Path $HOME ".claude\skills" }
    if (Test-Path $skillsDir) {
        Get-ChildItem -LiteralPath $skillsDir -Directory -Force | Where-Object {
            ($_.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -and
                "$($_.Target)".StartsWith((Join-Path $InstallDir "skills") + "\", [System.StringComparison]::OrdinalIgnoreCase)
        } | ForEach-Object { [System.IO.Directory]::Delete($_.FullName) }
    }

    Remove-Path $InstallDir
    Say "Removed $InstallDir"
}

Main
