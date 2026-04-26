# Tests

**Ownership:** QA + feature owners.

## Dependency Direction
- Tests may depend on Core, Systems, Content, and test utilities.
- Production modules must not depend on Tests.
- Prefer black-box boundaries that reflect runtime dependency direction.

Tests validate smoke flows and system-level behavior.
