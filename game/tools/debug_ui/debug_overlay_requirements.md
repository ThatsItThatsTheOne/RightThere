# Debug Overlay Requirements

## Purpose
Defines runtime debug overlay requirements for tracking narrative and interaction state while testing.

## Required Overlay Panels

### 1) Current Objective
Display:
- active objective ID
- objective short text
- objective state (`inactive`/`active`/`complete`)
- last objective update timestamp

Behavior:
- updates in real time on objective change events
- highlights when objective transitions occur

### 2) Active Flags
Display:
- list/table of all active true/enabled flags relevant to current chapter
- optional filter by prefix (`obj_`, `story_`, `int_`, etc.)
- changed-this-frame indicator

Behavior:
- supports sorting by last changed time
- supports quick text filter

### 3) Interactable Focus Target
Display:
- focused interactable entity ID
- interaction type
- availability state (available/blocked/out-of-range)
- block reason when unavailable

Behavior:
- refreshes every frame or focus-change event
- clears instantly when focus is lost

### 4) Last 20 Event Triggers
Display a rolling log containing the **20 most recent** trigger events:
- sequence index
- trigger ID
- source system
- timestamp
- result (`applied`, `ignored`, `failed`)

Behavior:
- newest entry appears at top
- preserves order deterministically
- exposes clear-log action for local testing

## Non-Functional Requirements
- Overlay must be toggleable at runtime via debug input.
- Overlay must be non-blocking to gameplay input unless explicitly focused.
- Data shown should be read-only from UI layer.
- Feature must be excluded or disabled in shipping/non-debug builds by configuration.
