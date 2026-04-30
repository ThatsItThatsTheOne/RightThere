# RightThere Projector (Factorio 2.0 mod template)

This mod provides a simple projector screen that plays frame sequences in-game.
It is designed for personal use and quick iteration.

---

## 1) What this mod can and cannot do

### Can do
- Display frame-by-frame pseudo-video on a projector entity.
- Play/pause and frame-step using hotkeys.
- Use frame sequences generated from your own MP4 files.

### Cannot do (Factorio engine constraints)
- Read arbitrary folders from your computer at runtime.
- Decode/play MP4 directly inside Factorio.
- Stream external media dynamically.

Because of those constraints, the workflow is:
1. Convert MP4 -> PNG frames outside the game.
2. Bundle those frames inside the mod folder.
3. Reference the frames in `control.lua`.

---

## 2) Files in this mod

- `info.json` - mod metadata / Factorio compatibility
- `data.lua` - loads prototypes
- `prototypes/projector.lua` - item, recipe, entity, hotkeys
- `control.lua` - runtime playback logic
- `scripts/convert_video.sh` - MP4 -> PNG converter (ffmpeg)
- `scripts/generate_clip_lua.py` - generates Lua `CLIPS` entry from frame folder

---

## 3) Install prerequisites (personal machine)

- Factorio 2.0
- `ffmpeg`
- Python 3 (for helper script)

Quick checks:
```bash
ffmpeg -version
python3 --version
```

---

## 4) Package and install the mod

From this repo root:
```bash
cd factorio_mod
zip -r ../rightthere-projector_0.1.0.zip rightthere-projector
```

Copy zip into Factorio mods folder:
- Windows: `%AppData%\Factorio\mods\`
- Linux: `~/.factorio/mods/`
- macOS: `~/Library/Application Support/factorio/mods/`

Then launch Factorio, enable the mod in **Mods**, and restart.

---

## 5) In-game usage

1. Craft/place `rt-projector-screen`.
2. Select projector.
3. Controls:
   - `Ctrl+P` -> play/pause
   - `Ctrl+Right` -> next frame

Default demo clip uses base-game icons (binary-free repo).

---

## 6) Add your own MP4 clip (easy path)

Run from mod root (`factorio_mod/rightthere-projector`):

```bash
./scripts/convert_video.sh /path/to/input.mp4 media/myclip 8 128
```

Arguments:
- arg1: input mp4 path
- arg2: output frame directory
- arg3: fps (default `8`)
- arg4: width (default `128`, keeps aspect ratio)

Recommended settings for stable performance:
- 64x64 to 128x72
- 6-10 fps
- short loops (3-10 seconds)

---

## 7) Generate CLIPS Lua block automatically

After frames are generated:

```bash
./scripts/generate_clip_lua.py media/myclip myclip 8
```

This prints a Lua block like:
```lua
myclip = {
  fps = 8,
  loop = true,
  frames = {
    "__rightthere-projector__/media/myclip/frame_0001.png",
    ...
  }
}
```

Copy this into `CLIPS` inside `control.lua`.

To make new projectors use this clip by default, change:
```lua
clip = "sample_clip"
```
to:
```lua
clip = "myclip"
```

---

## 8) Troubleshooting

### Mod not visible in game
- Ensure zip structure is `rightthere-projector/info.json` at root.
- Ensure `factorio_version` in `info.json` matches your game major version.

### Black/blank projector output
- Verify all frame paths in `CLIPS` are correct.
- Ensure PNG filenames match exactly.

### UPS/memory problems
- Lower FPS.
- Reduce frame resolution.
- Shorten clips and/or reduce simultaneous projectors.

### Script errors
- Validate shell script:
```bash
bash -n scripts/convert_video.sh
```
- Check metadata JSON:
```bash
python3 -m json.tool info.json >/dev/null
```

---

## 9) Suggested personal workflow

1. Keep a source folder with original MP4s.
2. Convert one short clip at low resolution first.
3. Generate Lua block with `generate_clip_lua.py`.
4. Paste into `control.lua` and test in Factorio.
5. Iterate resolution/fps upward only if performance allows.
