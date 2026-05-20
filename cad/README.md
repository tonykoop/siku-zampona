# Siku (Zampoña) — CAD

**Refs:** https://github.com/tonykoop/siku-zampona/issues/1
Generated: 2026-05-19

This folder is a placeholder. No native CAD model lives here yet.

## Current Dimensional Authority

Until reviewed native CAD lands in this folder, the authoritative dimensional
sources for the siku family — in priority order — are:

1. **`siku-zampona-design-table.xlsx`** — the parametric design table
   extracted from the master Musical Instruments workbook. Source of every
   tube length, bore, frame width, and family-member row.
2. **`wolfram/instrument-model.wl`** + **`wolfram-starter.wl`** — Manipulate
   model implementing the stopped-pipe formula
   `L_calc = 13552 / (4·f) − 0.82·bore_ID`. Source of truth for sensitivity
   sweeps and end-correction reasoning.
3. **`drawings/siku-{toyo,zanka,malta,chili}-{elevation,frame}.svg`,
   `siku-family-overview.svg`, `siku-tube-section.svg`** — dimensioned SVG
   drawings for each family member, plus the cross-section and the
   family-overview comparison sheet.
4. **`cut-list.csv`** — concrete numeric envelope per tube, derived from
   items 1–3.

## What Belongs Here Later

This folder is reserved for native CAD that an outside builder can open
and re-mesh:

- A SolidWorks design-table workbook driven from the canonical template
  documented at the instrument-maker-v4 SolidWorks reference for siku
  (`assets/solidworks/family-templates/siku-zampona-design-table.csv`).
- STEP exports of each family member's frame and tube layout.
- Optionally, F3D or Fusion 360 native, OnShape JSON exports, or
  parametric OpenSCAD source if a CAD pivot away from SolidWorks happens.

Any binary CAD file landed here must be paired with a sibling text export
(STEP, IGES, STL, or OpenSCAD source) so that the geometry is reviewable
without the proprietary tool.

## Honesty Rules

The following rules bind every future PR that adds files to this folder:

- A `.glb`, render, or screenshot is **not** CAD; it belongs in
  `images/`.
- A DXF marked "review scaffold" is not L3 CAD; mark it explicitly and
  note the residual in `build-packet-status.md`.
- A "SolidWorks model" claim requires the actual `.sldprt`/`.sldasm` file
  *and* a STEP or IGES sibling. Otherwise the row in
  `build-packet-status.md` stays `partial` or `open`.
- A generated visual (Wolfram render, AI image, or marketing illustration)
  must not be filed here. It belongs in `images/` with concept-only
  framing per `visual-bom-brief.md`.

## Cross-References

- `build-packet-status.md` — overall packet readiness; CAD row tracked
  there.
- `drawing-brief.md` — the Strat-quality drawing requirements that any
  future CAD must satisfy.
- `visual-bom-brief.md` — separates fabrication geometry from concept
  visuals.
