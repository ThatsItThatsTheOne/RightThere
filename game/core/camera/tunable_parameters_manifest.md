# Camera Tunable Parameters Manifest

Engine-specific bindings to be defined later. This manifest documents tunable camera control variables.

| Parameter ID | Description | Suggested Range | Default (placeholder) | Notes |
|---|---|---|---|---|
| camera.isometric_angle_deg | Downward isometric pitch angle in degrees | 25 - 60 | 40 | Lower values improve horizon visibility |
| camera.smoothing_time_sec | Follow smoothing/interpolation time | 0.00 - 0.50 | 0.12 | Higher values reduce jitter but may feel laggy |
| camera.rotate_enabled | Optional user-driven camera rotate toggle | false/true | false | Keep optional to preserve readability |
| camera.rotate_speed_deg_per_sec | Rotation speed when rotate is enabled | 30 - 240 | 120 | Ignored when rotate is disabled |

## Tuning notes
- Validate readability impacts when changing angle.
- If enabling rotation, test interaction target clarity at all headings.
- Log all changes in `CONTROL_TUNING_LOG.md`.
