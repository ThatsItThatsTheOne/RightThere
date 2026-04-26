# Content Schema

This project uses a **data-driven content model** so gameplay and narrative behavior can be authored without hardcoding logic per chapter.

## 1) Data-Driven Definitions

Use one canonical concept regardless of engine implementation:

- **Definition asset**: a serialized data object that declares entity behavior and metadata.
  - Unity equivalent: `ScriptableObject`
  - Unreal equivalent: `DataAsset`
  - Generic equivalent: JSON/JSON5/YAML records loaded into runtime structs

### Required definition fields

Every content definition should include:

- `id` (string, globally unique, stable forever)
- `display_name` (localized key or source string)
- `description` (localized key or source string)
- `tags` (array of taxonomy tags)
- `chapter_availability` (chapter IDs or ranges)
- `version` (schema/content version integer)
- `dependencies` (IDs of prerequisite content or systems)

### Authoring conventions

- IDs are lowercase snake case: `memory_echo_harbor_01`
- Never repurpose an existing ID for a different meaning.
- Additive changes are preferred; destructive changes require migration notes.
- Data validation must run in CI/editor preflight before content can ship.

## 2) Tag Taxonomy

Tags are normalized capability markers used by systems (interaction, narrative, simulation, QA checks).

### Core interaction tags

- `PowerNode`: Participates in power-routing puzzles and can source/sink power.
- `MemoryEcho`: Can emit collectible/triggerable memory playback.
- `Liftable`: Supports pickup/carry/drop interaction loops.
- `Inspectable`: Supports close-look interaction and detail panel/VO.
- `Readable`: Provides codex/log text content.

### Narrative and progression tags

- `StoryCritical`: Required for chapter completion logic.
- `OptionalLore`: Optional worldbuilding content.
- `GateKey`: Unlocks a gated beat/state transition.
- `CheckpointAnchor`: Eligible save/checkpoint anchor.

### System and safety tags

- `Experimental`: Feature-flag gated content path.
- `Deprecated`: Kept for compatibility only; no new references.
- `NoAutosave`: Excluded from autosave trigger surfaces.

### Tag governance rules

- Tags are **composable**, not mutually exclusive unless explicitly documented.
- New tags require:
  1. Owner system declaration.
  2. Validation rule update.
  3. Chapter smoke test update.
- Unknown tags must fail validation in strict mode.

## 3) Validation and Compatibility

- Validate schema shape and tag allowlist at load time.
- Record `version` in save payload references.
- For renamed/removed definitions, provide migration map: `old_id -> new_id`.
- Never remove a tag that save/load logic depends on without migration coverage.
