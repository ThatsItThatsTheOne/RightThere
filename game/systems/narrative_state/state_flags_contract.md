# State Flags Contract

## Purpose
This contract defines how narrative state flags are named and how gameplay/event triggers transition those flags through valid states.

## 1) Flag Naming Conventions

### 1.1 Canonical format
Use lowercase snake_case with a namespaced prefix:

`<domain>_<subject>_<qualifier?>_<state>`

Examples:
- `obj_find_key_active`
- `obj_find_key_complete`
- `door_library_unlocked`
- `npc_guard_dialogue_intro_seen`
- `story_family_photo_revealed`

### 1.2 Allowed domain prefixes
- `obj_` for objective lifecycle flags.
- `area_` for area access/discovery flags.
- `door_` for door/openable world gating flags.
- `npc_` for NPC conversation/progression flags.
- `int_` for interaction-local state flags.
- `story_` for story reveal and lore comprehension flags.
- `sys_` for system/global non-story runtime flags.

### 1.3 State suffixes (recommended controlled vocabulary)
Prefer the following terminal states:
- `locked` / `unlocked`
- `inactive` / `active`
- `seen`
- `started` / `complete`
- `hidden` / `revealed`
- `false` / `true` (only for purely boolean technical flags)

### 1.4 Naming rules
- Do not use whitespace, punctuation, or camelCase.
- Do not encode timestamps in names.
- Do not duplicate semantics (`obj_key_found_complete` is invalid).
- One semantic concept per flag.
- If a concept has multiple stages, use separate stage flags or a dedicated enum field in serialized narrative state.

## 2) Trigger-to-State Transition Rules

### 2.1 Trigger event shape
Each trigger should resolve to an immutable event payload with:
- `trigger_id` (stable identifier, e.g., `ch01_library_note_pickup`)
- `source` (system/emitter)
- `target` (optional entity or area)
- `timestamp`
- `context` (optional metadata)

### 2.2 Transition model
- Transitions are deterministic and table-driven.
- A trigger may update one or more flags.
- Each update must validate preconditions before mutation.
- Mutations are atomic per trigger (all succeed or none).

### 2.3 Rule format
Represent rules conceptually as:

`when <trigger_id> and <preconditions> then set <flag mutations> emit <follow-up events>`

Example:
- **when** `ch01_intro_note_examined`
- **and** `area_attic_discovered = true`
- **then set** `story_intro_note_revealed = true`, `obj_find_source_active = true`
- **emit** `objective_updated`

### 2.4 Preconditions
A transition must fail safely (no write) when:
- Required prerequisite flags are absent.
- Trigger is from the wrong chapter or content slice.
- Target entity is invalid or not interactable in current state.

### 2.5 Idempotency
- Re-firing the same trigger should not corrupt progression.
- Repeated triggers must be no-op where appropriate (`seen`, `revealed`, `complete` states).
- Side effects (audio/UI popups) must be gated so they do not replay unless explicitly intended.

### 2.6 Conflict handling
When multiple transitions could write the same flag:
1. Chapter-scoped rule precedence.
2. Priority value in rule table.
3. Last-resort deterministic tie-breaker by rule ID.

Never allow nondeterministic state outcomes.

### 2.7 Objective integrity
- `obj_*_complete` may only be set if corresponding `obj_*_active` was true at least once in session history or persisted history.
- Activating a new primary objective should deactivate prior mutually exclusive objective flags.

### 2.8 Persistence boundary
Any flag used to gate chapter progression, story reveal, or unlockable world state must be persisted through save/load.

### 2.9 Debug requirements
Every applied transition must write a debug trace entry containing:
- trigger id
- old/new value per mutated flag
- rule id
- success/failure reason
