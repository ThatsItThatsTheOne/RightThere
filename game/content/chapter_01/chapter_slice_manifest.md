# Chapter 01 Slice Manifest

## Purpose
Defines minimum playable slice content required for Chapter 01 implementation sign-off.

## Required Content

### 1) Explore Area (required)
- Exactly one primary explore area is present in the slice.
- Area has:
  - spawn/entry point
  - traversal loop or bounded exploration route
  - at least one navigational landmark used by objective text

### 2) Environmental Interactions (required)
Provide **2–3** environmental interactions total.

Each interaction must include:
- stable interaction ID
- prompt text
- success state change (flag/event)
- repeat behavior definition (repeatable or one-shot)

Suggested mix:
- 1 inspect interaction (lore/context)
- 1 manipulate interaction (open/move/activate)
- optional 1 auxiliary flavor interaction

### 3) Story Reveal (required)
Provide **1** story reveal in this chapter slice.

Reveal must include:
- `story_reveal_id`
- trigger condition (interaction or location trigger)
- resulting narrative state flag mutation
- UI/feedback cue (subtitle, journal line, or objective update)

### 4) Audio Mood Pass Checklist (required)
All items below must be reviewed and marked complete before slice approval:
- Ambient bed authored and hooked to explore area.
- Reverb/zone profile set for the area.
- Interaction SFX assigned for each environmental interaction.
- Story reveal stinger/cue assigned and ducking behavior verified.
- Loudness balance pass completed against dialogue/UI priorities.
- Loop transitions checked for seams or abrupt cutoffs.
- Fallback behavior verified when audio asset load fails.

## Exit Criteria
Chapter 01 slice is considered content-complete only when sections 1–4 are all satisfied.
