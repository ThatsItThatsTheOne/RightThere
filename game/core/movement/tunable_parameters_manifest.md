# Movement Tunable Parameters Manifest

Engine-specific bindings to be defined later. This manifest documents tunable control variables and expected ranges.

| Parameter ID | Description | Suggested Range | Default (placeholder) | Notes |
|---|---|---|---|---|
| movement.acceleration | Rate of speed gain from rest/input | 4.0 - 20.0 | 10.0 | Higher values improve snap but can reduce precision |
| movement.deceleration | Rate of speed loss when input is released/opposed | 4.0 - 24.0 | 12.0 | Balance with acceleration for stop control |
| movement.turning_inertia | Resistance to rapid heading change | 0.0 - 1.0 | 0.35 | Lower = more immediate turning |

## Tuning notes
- Evaluate accel/decel as paired changes.
- Re-test slalom after any turning inertia adjustment.
- Record all changes in `CONTROL_TUNING_LOG.md`.
