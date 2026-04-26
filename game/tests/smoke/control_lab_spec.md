# Control Lab Smoke Test Spec

## 1) Slalom route definition

### Purpose
Provide a repeatable traversal path for validating movement and camera tuning changes.

### Layout
- **Start gate:** Stationary spawn marker on flat, unobstructed surface.
- **Cone count:** 10 cones minimum.
- **Spacing:** 3.0m between cones along route centerline.
- **Offset pattern:** Alternate left/right cone offset of 1.5m from centerline.
- **Finish gate:** 5.0m straight extension after final cone.
- **Total route length:** ~40-50m.

### Pass conditions
- Complete route start-to-finish without leaving test bounds.
- Record completion time.
- Record total collisions with cones or boundaries.

---

## 2) Interaction benchmark stations

Run in sequence immediately after slalom completion.

### Station A: Inspect
- Place one inspectable object on pedestal at chest height.
- Player objective: target object and trigger inspect action.
- Record:
  - Time to successful inspect.
  - Number of missed interaction attempts.

### Station B: Pickup / Place
- Place two pickup objects and one placement surface.
- Player objective: pick up object 1, place it; repeat for object 2.
- Record:
  - Time to first successful pickup.
  - Time to each successful place.
  - Missed interaction attempts before each success.

### Station C: Reactivation
- Place one disabled/reactivatable interactable (switch, terminal, or node).
- Player objective: reactivate using standard interaction flow.
- Record:
  - Time to reactivation.
  - Missed attempts prior to successful reactivation.

---

## 3) Manual frustration log template

Complete once per tester after full smoke pass.

| Date | Build/Branch | Tester | Session # | Frustration event | Trigger/context | Severity (1-5) | Duration (sec) | Recovery method | Notes |
|---|---|---|---|---|---|---|---|---|---|
| YYYY-MM-DD | main@commit | initials | 1 | Example: missed pickup | near station B | 3 | 12 | reposition + retry | reticle felt ambiguous |

### Severity guide
- **1:** Minor annoyance, no flow interruption.
- **2:** Noticeable friction, quick self-correction.
- **3:** Breaks flow, requires deliberate correction.
- **4:** Repeated failure or strong annoyance.
- **5:** Session-impacting frustration; candidate blocker.
