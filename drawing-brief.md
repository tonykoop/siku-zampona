# Siku (Zampoña) — Drawing Brief

**Purpose:** Spec for technical drawings in `drawings/` — one SVG per family member per view.  
**Quality bar:** Fender Stratocaster blueprint standard (title block, datums, all critical dimensions, section views).

---

## Drawing List

| File | Member | View | Priority |
|---|---|---|---|
| `drawings/siku-toyo-elevation.svg` | Toyo (Bass) | Front elevation — full tube array, stepped profile | P1 |
| `drawings/siku-toyo-frame.svg` | Toyo (Bass) | Frame rail plan — tube pocket layout, rail dimensions | P1 |
| `drawings/siku-zanka-elevation.svg` | Zanka (Tenor) | Front elevation | P1 |
| `drawings/siku-zanka-frame.svg` | Zanka (Tenor) | Frame rail plan | P1 |
| `drawings/siku-malta-elevation.svg` | Malta (Alto) | Front elevation | P1 |
| `drawings/siku-malta-frame.svg` | Malta (Alto) | Frame rail plan | P2 |
| `drawings/siku-chili-elevation.svg` | Chili (Soprano) | Front elevation | P2 |
| `drawings/siku-tube-section.svg` | All | Tube cross-section detail | P1 |
| `drawings/siku-family-overview.svg` | All 4 | Side-by-side family comparison | P2 |

---

## Per-Drawing Content Requirements

### Front Elevation (per member)

- Full-scale (or 1:2 for Toyo) front view of the complete rank
- Tubes drawn as vertical rectangles, left=longest, right=shortest
- Each tube labeled with: note name, semitone offset from root, and L_cut length
- Overall frame width dimension
- Longest and shortest tube heights dimensioned
- Blow-end datum line (top, flush with rail)
- Title block: instrument + member name + siku key + bore ID + date + revision

### Frame Rail Plan (per member)

- Top view of one rail
- All 13 tube pockets shown with centerline spacing (OD + 1/16" gap)
- Pocket depth noted
- Rail overall dimensions
- 2× cord-lash hole positions near rail ends
- Title block

### Tube Cross-Section Detail

- Single tube cross-section: bore ID, wall thickness, OD
- Beeswax plug depth shown (3/8" for Toyo, 1/4" for small sizes)
- End correction ΔL annotation: "ΔL = 0.82 × bore ID"
- Label: "Closed end (bottom) · Open end (top)"

### Family Overview

- 4 ranks shown side by side at true relative scale
- Labels: Toyo / Zanka / Malta / Chili
- Toyo Arka 1 (22.6") and Chili Arka 7 (2.2") highlighted as range extremes
- Frame width dimension for each

---

## Title Block Template

```
+─────────────────────────────────────────────────────────────+
│ SIKU (ZAMPOÑA)  ·  [MEMBER NAME]  ·  KEY [SIKU KEY]        │
│ Part: [view name]    Scale: [1:1 or 1:2]   Units: inches   │
│ Date: 2026-05-08     Rev: A      Workbook: siku-zampona-    │
│                                   design-table.xlsx          │
│ tonykoop/siku-zampona  ·  CC BY 4.0                         │
+─────────────────────────────────────────────────────────────+
```

---

## Datum Convention

- **Y=0:** Top (blow) end of longest tube = primary datum
- **X=0:** Centerline of longest tube (Arka 1)
- Tube positions numbered left to right: Arka 1 through Arka 7, then Ira 1 through Ira 6

---

## Tolerance Callout Guide

| Feature | Tolerance | Note |
|---|---|---|
| Tube cut length | ±1/32" (0.031") | Trim to pitch; this is pre-trim tolerance |
| Bore ID | ±0.030" for bamboo | Verify with caliper; recalculate if outside tolerance |
| Pocket depth | ±0.010" | Pocket too shallow → tube proud; too deep → tube sunk |
| Pocket spacing | ±0.005" | CNC accuracy; feeds frame width |
| Rail thickness | ±0.005" | Planer accuracy |
| Cord hole dia | 1/8" ± 0.010" | Clearance for lashing needle |
