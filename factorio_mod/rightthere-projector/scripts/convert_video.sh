#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <input.mp4> <output_dir> [fps] [width]"
  exit 1
fi

INPUT="$1"
OUTDIR="$2"
FPS="${3:-8}"
WIDTH="${4:-128}"

mkdir -p "$OUTDIR"

ffmpeg -i "$INPUT" \
  -vf "fps=${FPS},scale=${WIDTH}:-1:flags=lanczos" \
  -pix_fmt rgba \
  "${OUTDIR}/frame_%04d.png"

echo "Done. Frames written to ${OUTDIR}"
echo "Copy them into media/<clip_name>/ and add frame paths in control.lua"
