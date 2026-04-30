# RightThere Projector (Factorio mod template)

This mod demonstrates a projector-screen entity for Factorio 2.0 that can display sprite frames like a slideshow/pseudo-video.

## Why this design
Factorio mods cannot read arbitrary folders on your disk or decode MP4 directly at runtime.
So video support is done via offline conversion: MP4 -> PNG frames -> bundled mod assets.

## Quick start
1. Zip the `rightthere-projector` folder and place it in your Factorio `mods` directory.
2. Start game, craft/place `rt-projector-screen` (the default demo clip uses base-game icon sprites so no binary assets are required in this repo).
3. Select the screen and use:
   - `Ctrl+P` to play/pause
   - `Ctrl+Right` to advance one frame

## Add your own clip
1. Convert your mp4 into small PNG frames:
   ```bash
   ./scripts/convert_video.sh myclip.mp4 media/myclip 8 128
   ```
2. In `control.lua`, add a clip entry in `CLIPS` with your frame list (sprite paths can point at your mod assets or other valid sprite resources).

## Recommended limits
- 64x64 to 128x72
- 6-10 fps
- short loops (3-10 seconds)

These limits help keep UPS and memory usage reasonable.
