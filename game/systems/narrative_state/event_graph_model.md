# Event Graph Model

This document defines conventions for the chapter story-beat event graph and runtime narrative state machine.

## 1) Model Overview

Narrative progression is represented as a directed graph:

- **Nodes** = story beats (stateful milestones).
- **Edges** = transitions triggered by validated events/conditions.
- **Guards** = boolean predicates that must pass before traversal.
- **Actions** = side effects executed on node enter/exit.

At runtime, the active narrative state machine evaluates incoming events against the current node's outgoing transitions.

## 2) Node Conventions

Each beat node should declare:

- `beat_id` (stable unique ID)
- `chapter_id`
- `type` (`critical`, `optional`, `ambient`, `fallback`)
- `entry_actions`
- `exit_actions`
- `required_tags` (content tags expected in the scene)
- `save_checkpoint` (bool)

### Naming

Use chapter-prefixed IDs:

- `ch01_arrival_intro`
- `ch01_restore_power`
- `ch01_memory_reveal`

## 3) Transition Conventions

Each edge should declare:

- `from_beat`
- `to_beat`
- `trigger_event`
- `guards[]`
- `priority` (deterministic conflict resolution)
- `idempotent` (whether re-firing has no additional effect)

### Trigger event style

Use domain-oriented event names:

- `OnPowerNodeActivated`
- `OnMemoryEchoResolved`
- `OnItemLifted`
- `OnDialogueChoiceCommitted`

## 4) State Machine Rules

- Single active **critical path** beat per chapter.
- Optional/ambient beats may run in parallel as sub-state tracks.
- If multiple transitions are valid, evaluate by:
  1. Highest `priority`
  2. Most specific guard set
  3. Stable lexical edge ID tie-breaker
- Transition evaluation must be deterministic across platforms.

## 5) Persistence and Recovery

Save payload must include:

- Active beat IDs (critical + optional tracks)
- Completed beat IDs
- Pending one-shot events
- Graph/schema version

On load:

1. Validate graph version compatibility.
2. Apply migration map if graph IDs changed.
3. Rehydrate active states.
4. Replay only idempotent deferred actions.

## 6) Authoring Guardrails

- No orphan nodes (except designated chapter entry root).
- No transition cycles on critical path unless explicitly marked loop-safe.
- Every `critical` beat must have at least one reachable completion path.
- Story-critical triggers must be covered by smoke tests.
