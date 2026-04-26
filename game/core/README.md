# Core Systems

## Feature-Flag Policy

Experimental systems must be introduced behind explicit feature flags to protect shipping stability and allow safe rollback.

### Policy Requirements

- Every experimental capability must have a unique flag key.
- Default state for new experimental flags is `OFF` in production configs.
- Flags must support runtime and boot-time evaluation (as applicable).
- Code paths must define a safe fallback behavior when flag is disabled.
- Any content/data relying on an experimental system must be marked with `Experimental` tag.

### Rollback Safety Rules

- Disabling a flag must not corrupt save data.
- Save payloads must persist enough metadata to restore non-experimental fallback paths.
- Migrations must be provided when flag-controlled data schema changes.
- Critical path progression cannot depend exclusively on an enabled experimental flag.

### Release Controls

- Promote flags through environments: local -> test -> staging -> production.
- Require smoke test pass for both flag `ON` and `OFF` before release.
- Document owner, rollout plan, and rollback plan for each flag.
- Remove obsolete flags only after one full release cycle with telemetry validation.
