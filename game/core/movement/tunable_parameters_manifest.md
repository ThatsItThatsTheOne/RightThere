# Movement Tunable Parameters Manifest

Engine-specific bindings will be added later. This manifest defines canonical parameter names and tuning intent.

| Parameter ID | Type | Suggested Range | Default (placeholder) | Description |
|---|---|---|---|---|
| movement.acceleration | float | 4.0 - 20.0 | 10.0 | Rate of speed gain from rest/input |
| movement.deceleration | float | 4.0 - 24.0 | 12.0 | Rate of speed loss when input is released/opposed |
| movement.turning_inertia | float | 0.0 - 1.0 | 0.35 | Resistance to rapid heading change |

## Tuning notes
- Tune `movement.acceleration` and `movement.deceleration` together.
- Re-run slalom smoke after any `movement.turning_inertia` change.
- Record every change in `CONTROL_TUNING_LOG.md`.
