# Control Lab Smoke Test Spec

## 1) Slalom route definition

### Purpose
Provide a repeatable traversal path for validating movement and camera tuning changes.

### Route layout
- **Start lead-in:** 8.0m straight from spawn marker to first cone.
- **Cone count:** 10 cones minimum.
- **Spacing:** 3.0m between cones along route centerline.
- **Offset pattern:** Alternate left/right cone offset of 1.5m from centerline.
- **Finish extension:** 5.0m straight extension after final cone.
- **Total route length target:** 40-50m (minimum layout = 8m lead-in + 27m cone span + 5m finish = 40m).

### Pass/fail conditions
- **Pass:** Complete route from start gate to finish gate while remaining in bounds.
- **Fail:** Leave route bounds for more than 1 second, or skip required gates.

### Captured outputs
- Slalom completion time.
- Collision count during slalom.

---

## 2) Interaction benchmark stations

Run in sequence immediately after slalom completion.

### Station A: Inspect
- Place one inspectable object on pedestal at chest height.
- Objective: target object and trigger inspect action.
- Record:
  - Time to successful inspect.
  - Missed interaction attempts before success.

### Station B: Pickup / Place
- Place two pickup objects and one placement surface.
- Objective: pick up object 1 and place it; repeat for object 2.
- Record:
  - Time to first successful pickup.
  - Time to each successful place.
  - Missed attempts before each success.

### Station C: Reactivation
- Place one disabled/reactivatable interactable (switch, terminal, or node).
- Objective: reactivate using standard interaction flow.
- Record:
  - Time to successful reactivation.
  - Missed attempts before success.

---

## 3) Manual frustration log template

Complete once per tester after full smoke pass.

| Date | Build/Branch | Tester | Session # | Frustration event | Trigger/context | Severity (1-5) | Duration (sec) | Recovery method | Notes |
|---|---|---|---|---|---|---|---|---|---|
| YYYY-MM-DD | branch@commit | initials | 1 |  |  |  |  |  |  |

### Severity guide
- **1:** Minor annoyance, no flow interruption.
- **2:** Noticeable friction, quick self-correction.
- **3:** Breaks flow, requires deliberate correction.
- **4:** Repeated failure or strong annoyance.
- **5:** Session-impacting frustration; candidate blocker.
