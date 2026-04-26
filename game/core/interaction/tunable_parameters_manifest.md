# Interaction Tunable Parameters Manifest

Engine-specific bindings to be defined later. This manifest documents tunable interaction assist and affordance controls.

| Parameter ID | Description | Suggested Range | Default (placeholder) | Notes |
|---|---|---|---|---|
| interaction.snap_to_enabled | Enables aim/reticle snap-to valid target | false/true | true | Helps reduce missed attempts |
| interaction.assist_strength | Strength of snap/aim assistance | 0.0 - 1.0 | 0.60 | Higher values favor accessibility |
| interaction.highlight_mode | Target affordance style | none/outline/fill/both | outline | Visual readability setting |
| interaction.highlight_intensity | Visual highlight strength | 0.0 - 1.0 | 0.70 | Tune for clarity without clutter |
| interaction.highlight_fade_ms | Highlight transition duration | 0 - 500 | 120 | Lower values feel more immediate |

## Affordance behavior checklist
- Highlight appears on nearest valid target in interaction range.
- Outline/affordance clears within fade window after target loss.
- Snap/assist never selects invalid or occluded targets.

## Tuning notes
- Re-run interaction benchmark stations after any assist or highlight change.
- Record changes and metric deltas in `CONTROL_TUNING_LOG.md`.
