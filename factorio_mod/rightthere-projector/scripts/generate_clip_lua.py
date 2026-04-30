#!/usr/bin/env python3
"""Generate a Lua CLIPS entry from frame files.

Usage:
  ./scripts/generate_clip_lua.py media/myclip myclip 8
"""
from pathlib import Path
import sys

if len(sys.argv) < 3:
    print("Usage: generate_clip_lua.py <frame_dir> <clip_name> [fps]")
    sys.exit(1)

frame_dir = Path(sys.argv[1])
clip_name = sys.argv[2]
fps = int(sys.argv[3]) if len(sys.argv) > 3 else 8

if not frame_dir.exists() or not frame_dir.is_dir():
    print(f"Error: frame dir not found: {frame_dir}")
    sys.exit(2)

frames = sorted([p for p in frame_dir.iterdir() if p.suffix.lower() == ".png"])
if not frames:
    print(f"Error: no PNG frames found in {frame_dir}")
    sys.exit(3)

# Expect to run from mod root; normalize to __rightthere-projector__/...
parts = frame_dir.as_posix().strip("/").split("/")
try:
    media_idx = parts.index("media")
except ValueError:
    print("Error: frame dir must be inside media/<clip_name>")
    sys.exit(4)

base = "/".join(parts[media_idx:])

print(f"{clip_name} = {{")
print(f"  fps = {fps},")
print("  loop = true,")
print("  frames = {")
for f in frames:
    print(f'    "__rightthere-projector__/{base}/{f.name}",')
print("  }")
print("}")
