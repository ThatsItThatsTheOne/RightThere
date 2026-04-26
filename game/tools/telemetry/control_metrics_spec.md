# Control Metrics Telemetry Spec

## Scope
Defines control/usability metrics to track during control tuning and smoke validation sessions.

## Event/session metadata
- session_id
- build_id / commit_hash
- map_id
- tester_id (or anonymized subject_id)
- input_device (keyboard+mouse / gamepad / other)
- timestamp_utc

## Required tracked metrics

### 1) Slalom completion time
- **Metric key:** `slalom_completion_time_ms`
- **Type:** Numeric (milliseconds)
- **Definition:** Time elapsed from crossing slalom start gate to crossing finish gate.
- **Aggregation:** mean, median, p90 by build and device.
- **Goal direction:** Lower is better (within acceptable control/readability constraints).

### 2) Collision frustration count
- **Metric key:** `collision_frustration_count`
- **Type:** Integer count per run
- **Definition:** Number of collisions categorized as frustrating (cone, wall, obstacle) during slalom and benchmark traversal.
- **Classification note:** Should align with manual frustration rubric where possible.
- **Aggregation:** total and average per session/build.
- **Goal direction:** Lower is better.

### 3) Missed interaction attempts
- **Metric key:** `missed_interaction_attempts`
- **Type:** Integer count per station and per run
- **Definition:** Interaction inputs that do not produce intended valid target action (inspect, pickup/place, reactivation).
- **Aggregation:** total, per-station average, p90.
- **Goal direction:** Lower is better.

### 4) Subjective ratings (1-5)
Collect once at end of session:

- **Responsiveness**
  - `subjective_responsiveness_rating`
- **Readability**
  - `subjective_readability_rating`
- **Comfort**
  - `subjective_comfort_rating`

**Type:** Integer (1-5 Likert)
- 1 = very poor
- 3 = acceptable
- 5 = excellent

**Aggregation:** mean and distribution histogram by build/device.

## Suggested derived KPI bundle
- `control_quality_index` (optional composite): weighted blend of normalized completion time, missed attempts, and subjective ratings.

## Data quality checks
- Reject sessions missing start or finish timestamps for slalom.
- Clamp subjective ratings outside 1-5 as invalid.
- Flag runs with impossible negative durations.
