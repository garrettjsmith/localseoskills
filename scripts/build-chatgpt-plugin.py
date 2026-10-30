#!/usr/bin/env python3
"""Build the ChatGPT / Codex plugin directory ZIP.

    python3 scripts/build-chatgpt-plugin.py [out_dir]   # default: dist/

Packages skills/ as-is, converts each tasks/*/TASK.md into a skill that sets up a
scheduled task, and copies the shared docs a skill cites (docs/, specs/, briefs/)
into that skill's folder, since packaged skills can't read outside their own folder.
Upload the resulting ZIP at platform.openai.com/plugins.
"""
import json
import re
import shutil
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else ROOT / "dist"
MANIFEST = ROOT / ".codex-plugin/plugin.json"

SHARED = ["docs", "specs", "briefs/_templates", "briefs/README.md", "meta/lessons.md"]
SHARED_REF = re.compile(r"\b(docs|specs|briefs|meta)/")
TASK_KEYS = ("schedule", "tier", "skills", "mcps")

# Listing limits from the OpenAI plugin submission reference.
LIMITS = {"displayName": 30, "shortDescription": 30, "longDescription": 4000, "developerName": 80}


def check_manifest(m):
    ui = m["interface"]
    for key, limit in LIMITS.items():
        if len(ui[key]) > limit:
            sys.exit(f"interface.{key} is {len(ui[key])} chars (max {limit})")
    if len(ui.get("defaultPrompt", [])) > 3 or any(len(p) > 128 for p in ui.get("defaultPrompt", [])):
        sys.exit("interface.defaultPrompt: at most 3 prompts of 128 chars")
    if len(ui.get("capabilities", [])) > 20:
        sys.exit("interface.capabilities: at most 20 entries")
    if json.loads((ROOT / ".claude-plugin/plugin.json").read_text())["version"] != m["version"]:
        sys.exit("version differs between .codex-plugin and .claude-plugin plugin.json")


def bundle_shared(skill_dir, text):
    if not SHARED_REF.search(text):
        return
    for rel in SHARED:
        src, dst = ROOT / rel, skill_dir / rel
        dst.parent.mkdir(parents=True, exist_ok=True)
        if src.is_dir():
            shutil.copytree(src, dst, dirs_exist_ok=True)
        elif src.exists():
            shutil.copy2(src, dst)


def task_to_skill(text):
    _, fm, body = text.split("---", 2)
    fields = dict(re.findall(r"^([a-z]+):\s*(.*)$", fm, re.M))
    meta = "\n".join(f"  {k}: {json.dumps(fields[k], ensure_ascii=False)}" for k in TASK_KEYS if k in fields)
    header = (
        f"---\nname: {fields['name']}\ndescription: {fields['description']}\n"
        f"metadata:\n  type: scheduled-task\n{meta}\n---\n"
    )
    setup = (
        "\n> **Scheduling.** When the user asks to set this up, confirm the business, "
        "location, and any keywords, then create a scheduled task on this cadence "
        f"({fields.get('schedule', 'as requested')}) whose prompt runs this skill for that "
        "location. When it runs from a schedule, execute the steps below.\n"
    )
    return header + setup + body


def main():
    manifest = json.loads(MANIFEST.read_text())
    check_manifest(manifest)
    name, version = manifest["name"], manifest["version"]

    pkg = OUT / name
    if pkg.exists():
        shutil.rmtree(pkg)
    (pkg / "skills").mkdir(parents=True)

    for src in sorted((ROOT / "skills").glob("*/SKILL.md")):
        dst = pkg / "skills" / src.parent.name
        shutil.copytree(src.parent, dst)
        bundle_shared(dst, src.read_text())

    for src in sorted((ROOT / "tasks").glob("*/TASK.md")):
        dst = pkg / "skills" / src.parent.name
        if dst.exists():
            sys.exit(f"task {src.parent.name} collides with a skill of the same name")
        dst.mkdir()
        text = src.read_text()
        (dst / "SKILL.md").write_text(task_to_skill(text))
        bundle_shared(dst, text)

    (pkg / ".codex-plugin").mkdir()
    shutil.copy2(MANIFEST, pkg / ".codex-plugin/plugin.json")
    for key in ("composerIcon", "logo"):
        rel = manifest["interface"][key]
        (pkg / rel).parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(ROOT / rel, pkg / rel)
    shutil.copy2(ROOT / "LICENSE", pkg / "LICENSE")

    zpath = OUT / f"{name}-chatgpt-{version}.zip"
    zpath.unlink(missing_ok=True)
    with zipfile.ZipFile(zpath, "w", zipfile.ZIP_DEFLATED) as z:
        for p in sorted(pkg.rglob("*")):
            if p.is_file():
                z.write(p, p.relative_to(pkg))
    count = len(list((pkg / "skills").iterdir()))
    print(f"{zpath} ({count} skills)")


if __name__ == "__main__":
    main()
