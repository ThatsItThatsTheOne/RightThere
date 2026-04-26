# Add New Chapter Checklist

Use this checklist before merging any new chapter content.

## 1) Required Files/Folders

- [ ] `game/content/chapters/<chapter_id>/` exists.
- [ ] Chapter content definition file(s) created (data assets/JSON).
- [ ] Narrative graph file(s) created under chapter narrative path.
- [ ] Chapter-specific localization strings added.
- [ ] Chapter config references registered in global content index.
- [ ] Save/load migration notes added if IDs were changed or removed.

## 2) Required Tags and Triggers

- [ ] All interactive objects include required taxonomy tags (`PowerNode`, `MemoryEcho`, `Liftable`, etc. as applicable).
- [ ] `StoryCritical` applied to mandatory progression entities.
- [ ] `GateKey` tags present for gated transitions.
- [ ] All critical event triggers are mapped in narrative event graph.
- [ ] Experimental chapter content is protected by feature flags.

## 3) Required Smoke Tests

- [ ] Chapter boot test: loads from fresh profile.
- [ ] Golden path test: chapter can be completed end-to-end.
- [ ] Failure path test: soft-lock scenarios recover safely.
- [ ] Interaction test: tagged objects fire expected triggers.
- [ ] Narrative state test: required beats transition deterministically.

## 4) Save/Load Compatibility Validation

- [ ] Save at each critical beat and reload successfully.
- [ ] Mid-objective save reload resumes objective state correctly.
- [ ] Old-version save migration verified against current chapter data.
- [ ] Removed/renamed IDs covered by migration map.
- [ ] Rollback scenario tested with feature flags disabled.
