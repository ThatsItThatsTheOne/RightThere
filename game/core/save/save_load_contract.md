# Save/Load Contract

## Purpose
Defines the minimum persisted data required to restore narrative progression and interaction continuity across sessions.

## 1) Minimum Persisted Fields

### 1.1 Metadata
- `save_version` (semantic or integer schema version)
- `created_at` (UTC timestamp)
- `updated_at` (UTC timestamp)
- `game_build` (optional but recommended for compatibility diagnostics)

### 1.2 Chapter Progress (required)
Persist at least:
- `current_chapter_id` (e.g., `chapter_01`)
- `current_objective_id` (active objective token)
- `chapter_state_flags` (chapter-scoped progression flags)
- `completed_objectives` (set/list)
- `checkpoint_id` (last stable respawn/continue point)

### 1.3 Interaction States (required)
Persist at least:
- `interaction_flags` (per interactable state, e.g., used/opened/consumed)
- `interacted_entities` (set/list of entity IDs already interacted with)
- `one_shot_triggers_fired` (set/list to preserve idempotency)
- `area_discovery_flags` (explored/visited state where content gating depends on it)

### 1.4 Story Reveal State (required)
Persist at least:
- `revealed_story_ids` (all discovered lore/reveal tokens)
- `story_flags` (boolean or staged reveal flags)
- `last_story_reveal_id` (for resume context and UI recap)

## 2) Behavioral Requirements

### 2.1 Load integrity
- Loading must fully reconstruct objective and reveal gating before player input resumes.
- If any required section is missing, load must fail with a user-safe error or invoke deterministic migration defaults.

### 2.2 Backward compatibility
- Save schema must be versioned.
- Older versions require explicit migration functions.
- Migration must not silently advance story progression.

### 2.3 Determinism
- Save -> Load round-trip must preserve all required fields without loss.
- One-shot events remain one-shot after load.

### 2.4 Atomic write
- Save operations should be atomic (temp write + replace) to prevent corrupted partial saves.

### 2.5 Validation
On write and read, validate:
- known chapter IDs
- objective ID validity for current chapter
- flags are known keys and valid value types
- no impossible combinations (e.g., reveal marked complete while prerequisite chapter not started)
