# Camera Tunable Parameters Manifest

Engine-specific bindings will be added later. This manifest defines canonical parameter names and tuning intent.

| Parameter ID | Type | Suggested Range | Default (placeholder) | Description |
|---|---|---|---|---|
| camera.isometric_angle_deg | float | 25 - 60 | 40 | Downward isometric pitch angle in degrees |
| camera.smoothing_time_sec | float | 0.00 - 0.50 | 0.12 | Follow smoothing/interpolation time |
| camera.rotate_enabled | bool | false/true | false | Optional user-driven camera rotate toggle |
| camera.rotate_speed_deg_per_sec | float | 30 - 240 | 120 | Rotation speed when rotate is enabled |

## Tuning notes
- Validate readability impacts after angle changes.
- If `camera.rotate_enabled=true`, verify interaction target clarity at multiple headings.
- Record every change in `CONTROL_TUNING_LOG.md`.
