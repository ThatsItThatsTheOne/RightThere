# Systems

**Ownership:** Gameplay systems team.

## Dependency Direction
- Systems depend on Core interfaces, events, and stable APIs.
- Systems should not depend directly on Content implementation logic.
- Upstream dependencies should flow downward into Core only.

Systems orchestrate cross-feature behavior (state, objectives, reactivity) over Core primitives.
