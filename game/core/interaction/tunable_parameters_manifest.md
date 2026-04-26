# Interaction Tunable Parameters Manifest

Engine-specific bindings will be added later. This manifest defines canonical parameter names and tuning intent.

| Parameter ID | Type | Suggested Range | Default (placeholder) | Description |
|---|---|---|---|---|
| interaction.snap_to_enabled | bool | false/true | true | Enables snap-to on valid targets |
| interaction.assist_strength | float | 0.0 - 1.0 | 0.60 | Strength of snap/aim assistance |
| interaction.highlight_mode | enum | none/outline/fill/both | outline | Target affordance style |
| interaction.highlight_intensity | float | 0.0 - 1.0 | 0.70 | Visual highlight strength |
| interaction.highlight_fade_ms | int | 0 - 500 | 120 | Highlight transition duration |

## Affordance behavior requirements
- Highlight appears on nearest valid target in interaction range.
- Affordance clears within fade window after target loss.
- Snap/assist never selects invalid or occluded targets.

## Tuning notes
- Re-run interaction benchmark stations after assist/highlight changes.
- Record every change in `CONTROL_TUNING_LOG.md`.
