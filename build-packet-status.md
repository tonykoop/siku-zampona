# Siku (Zampoña) — Build-Packet Status

**Refs:** https://github.com/tonykoop/siku-zampona/issues/1
Generated: 2026-05-19

This file maps every deliverable from issue #1 to a file path in this repo
and records honest readiness. It is the single source of truth for which
issue-#1 boxes are closed, partial, or open. If `README.md`, `design.md`,
`capstone-manifest.json`, or any other file disagrees, fix the other file —
not this one.

`review-evidence.md` is the round-by-round review log; this file is the
deliverable-by-deliverable status ledger.

## Readiness

Stated level: **L2 root-mode packet (instrument-maker-v4 v4.3, 2026-05-08)**.

No L3 or L4 claims. No built instrument, no measured tube frequencies, no
measured trim deltas, no measured cents error. See **Open Gates** below for
what would have to change for L3 promotion.

## Engineering Documents

| Issue deliverable | Status | File | Note |
| --- | --- | --- | --- |
| `design.md` | closed | `design.md` | Stopped-pipe model, governing equation, end-correction convention, four-member family rationale |
| `assembly-manual.md` | closed | `assembly-manual.md` | Build sequence for tubes, plug seating, frame, wrap |
| `bom.csv` | closed | `bom.csv` | Bamboo and PVC paths, frame stock, beeswax, cord, finishing |
| `cut-list.csv` | closed | `cut-list.csv` | Tube lengths per family member with trim allowance |
| `sourcing.csv` | closed | `sourcing.csv` | Suppliers, lead time, MOQ, substitutes |
| `validation.csv` | partial | `validation.csv` | Measurement protocol present; **measured rows empty** until a build runs |
| `visual-bom-brief.md` | closed | `visual-bom-brief.md` | Image-per-row layout brief |
| `drawing-brief.md` | closed | `drawing-brief.md` | Strat-quality drawing requirements |
| `supplier-rfq.md` | closed | `supplier-rfq.md` | RFQ template |

## Wolfram and Interactive

| Issue deliverable | Status | File | Note |
| --- | --- | --- | --- |
| `wolfram-starter.wl` | closed | `wolfram-starter.wl` + `wolfram/instrument-model.wl` | Manipulate notebook source for tuning / geometry sweep; not executed in CI |

Per repo policy, `.wl` source is committed but `wolframscript -activate` is
not run from agent panes; verification belongs to the manager-queued
Wolfram pass.

## Capstone and Print Packet

| Issue deliverable | Status | File | Note |
| --- | --- | --- | --- |
| `capstone-deck.md` | closed | `capstone-deck.md` | Review-deck outline |
| `capstone-deck.pptx` | closed | `capstone-deck.pptx` | Cowork-mode deck binary |
| `capstone-manifest.json` | closed | `capstone-manifest.json` | Machine-readable artifact map |
| `print-packet.md` | closed | `print-packet.md` | Printable packet index |
| `print-packet.html` | closed | `print-packet.html` | HTML rendering |
| `print-packet.pdf` | closed | `print-packet.pdf` | PDF rendering |

## Folders and Assets

| Issue deliverable | Status | File | Note |
| --- | --- | --- | --- |
| `cad/` | partial | `cad/README.md` (this PR) | No native SolidWorks/STEP yet; dimensional authority is `siku-zampona-design-table.xlsx` + `wolfram/instrument-model.wl` + `drawings/*.svg`. See `cad/README.md` for the authority chain and what would have to land for L3 CAD |
| `cnc/` | closed | `cnc/operations.csv`, `cnc/setup-sheet.md` | Operations and setup sheet present |
| `drawings/` | closed | `drawings/siku-{toyo,zanka,malta,chili}-{elevation,frame}.svg`, `siku-family-overview.svg`, `siku-tube-section.svg` | 10 SVGs covering all four family members |
| `images/` | partial | `images/README.md` (this PR) | No hero photo, no concept render, no build photo yet. Photo plan lives in `photo-shotlist.md` and is the source of truth for what belongs here |
| `data/` | open | n/a | Deferred in the issue itself: "added once builds begin". No build has run, so no data row exists |

## README Polish

| Issue deliverable | Status | File | Note |
| --- | --- | --- | --- |
| Polished `README.md` | closed | `README.md` | Family overview table, arka/ira split, tube-length formula, cross-references; not a skeleton |

A hero-image swap is deferred until a real build photo or owned concept
render lands in `images/`.

## Open Gates

The following gates remain open and would have to close before any L3 or
"build-ready" claim is permitted:

- **Built Zanka member** — at least one full Zanka build, with every tube
  cut, trimmed, and plug-seated.
- **Measured tube frequencies** — every Zanka tube recorded in
  `validation.csv` with measured Hz, cents error, and trim history.
- **Measured breath response** — recorded for at least the Arka and Ira
  ranks of the Zanka.
- **Native CAD or STEP** — see `cad/README.md` for the authority chain and
  what counts as L3 CAD.
- **Owned hero image** — at least one shot from `photo-shotlist.md` filed
  under `images/` with attribution and licence status recorded.
- **Cultural/provenance human review** — already named as a close gate in
  `review-evidence.md`; the existing `resources.md` cites
  Turino, Baumann, and Gérard and is honest about being read-not-reviewed.

## Polish-Claim Block List

Until the gates above close, the following claims must not appear in
`README.md`, marketing copy, build-log site, capstone deck text, image
captions, or any sibling repo:

- "Measured", "tuned to ±N cents", "validated against build" — blocked
  until measured rows fill in `validation.csv`.
- "Build-ready", "L3", "release", "production-ready", "shop-tested" —
  blocked until a built Zanka exists.
- "SolidWorks model", "STEP file", "native CAD" — blocked until `cad/`
  contains real native CAD files; see `cad/README.md`.
- "Hero photo of the finished instrument" — blocked until a real photo
  lives in `images/`.
- "Authentic", "traditional Aymara reconstruction", "heritage panpipe" —
  blocked until cultural review closes per `review-evidence.md` and
  `resources.md`.

## Why Issue #1 Remains Open After This PR

This PR scaffolds status tracking and adds honest placeholders for the two
literal folder gaps (`cad/` and `images/`). It does not close issue #1.
The issue closes when at least the **Built Zanka member** + **Measured tube
frequencies** + **Owned hero image** rows above close — at which point the
packet has L3-empirical evidence rather than L2 design-only authority.
