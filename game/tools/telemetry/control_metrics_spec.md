# Control Metrics Telemetry Spec

## Scope
Defines control/usability metrics to track during tuning and smoke validation sessions.

## Required session metadata
- `session_id`
- `build_id`
- `commit_hash`
- `map_id`
- `tester_id` (or anonymized `subject_id`)
- `input_device` (`keyboard_mouse`, `gamepad`, `other`)
- `started_at_utc`
- `ended_at_utc`

## Required tracked metrics

### 1) Slalom completion time
- **Metric key:** `slalom_completion_time_ms`
- **Type:** Numeric (milliseconds)
- **Definition:** Time from crossing slalom start gate to crossing finish gate.
- **Capture point:** End of slalom run.
- **Goal direction:** Lower is better (without increasing frustration).

### 2) Collision frustration count
- **Metric key:** `collision_frustration_count`
- **Type:** Integer count per run
- **Definition:** Number of collisions marked frustrating during slalom + station traversal.
- **Capture point:** Increment on each qualifying collision event.
- **Goal direction:** Lower is better.

### 3) Missed interaction attempts
- **Metric key:** `missed_interaction_attempts`
- **Type:** Integer count (per station and total)
- **Definition:** Interaction input that does not trigger intended valid action (inspect, pickup/place, reactivation).
- **Capture point:** Increment on interaction failure result.
- **Goal direction:** Lower is better.

### 4) Subjective ratings (1-5)
Capture once at end of session:
- `subjective_responsiveness_rating`
- `subjective_readability_rating`
- `subjective_comfort_rating`

**Type:** Integer Likert (1-5)
- 1 = very poor
- 3 = acceptable
- 5 = excellent

## Required aggregations
- By `build_id` + `input_device`: mean, median, p90 for timing and counts.
- Histogram distribution for each subjective rating.

## Data quality checks
- Reject session if start/finish timestamps are missing for slalom.
- Reject durations `< 0`.
- Reject subjective rating samples outside `1..5` (do not clamp).
- Reject interaction metrics if station identifier is missing.
