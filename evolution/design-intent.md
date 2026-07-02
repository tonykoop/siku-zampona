# Design Intent — siku-zampona rev A

- Master CAD: `cad/siku-zampona.scad` (sha256: 2a5465974eeee7d500f8a04d56a068248ebea6229cdf85e638d22fdd83c4d857), driven by `siku-zampona-design-table.xlsx` (sha256: abeaa760751735b362ce462226c74f201f4b278d29879b2581cf043e53429e08) and `family-spec.csv`.
- Function: The *siku* (Aymara: *siku'*, Spanish: *zampoña*) is an Andean panpipe — a set of closed/stopped cylindrical tubes, each open at the blow end and sealed at the bottom (beeswax, bamboo node, or plug), sounding its fundamental as air is directed across the open rim. The 13-tube scale is split across two interlocking ranks — **arka** (leader, 7 tubes) and **ira** (follower, 6 tubes) — that together produce a Mixolydian scale spanning nearly two octaves; no single rank alone carries the full melody. Two players (or one player alternating) weave the tune together, embodying *yanantin*, the Aymara philosophy of complementary pairing — a "Heifer Zephyr" branding identity retained from the packet's cultural-provenance framing. Built as a 4-member family (Toyo bass, Zanka tenor — primary build target, Malta alto, Chili soprano).
- Environment: hand-held/breath-driven acoustic instrument; outdoor/altiplano use historically, indoor/workshop use for this packet. Bamboo bore and length are temperature/humidity sensitive (risks.md AC-02).
- Target qty: 1 (prototype — Zanka). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal (Zanka) | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Bore ID | 0.625 in | measure actual bore before cutting | sets end correction, hence pitch | family-spec.csv bore_id_in; risks.md AC-01 |
| OD | 0.821 in | — | frame-pocket fit | family-spec.csv od_in (= bore + 2×wall) |
| Arka 1 (root, G3) tube length | 16.961 in (L_cut) | trim in <=1/32" increments to +/-5 cents | lowest arka pitch, sets rank scale anchor | family-spec.csv arka1_L_cut; design.md sec 2.1-2.2 |
| Arka 7 (E5) tube length | 4.814 in (L_cut) | same trim protocol | highest arka pitch | family-spec.csv arka7_L_cut |
| Ira 1 (A3) tube length | 15.075 in (L_cut) | same trim protocol | lowest ira pitch | family-spec.csv ira1_L_cut |
| Ira 6 (D5) tube length | 5.443 in (L_cut) | same trim protocol | highest ira pitch | family-spec.csv ira6_L_cut |
| Combined 13-tube frame width | 11.423 in | — | rail/pocket layout if bound as one frame | family-spec.csv frame_width_in; cad/siku-zampona.scad computed cross-check (exact match) |
| End-correction coefficient | 0.82 x bore_ID | measurement_required — see AC-05 | governs every tube length in the family | design.md sec 2.1; risks.md AC-05 (unvalidated empirical convention, ~2x physics unflanged value) |

## Incidental (free for DFM)

- Tube array visual spacing between the arka/ira rows in the CAD envelope (this master uses a 1.5 in visualization gap; not a lashing spec).
- Frame rail species/finish choice within bom.csv options (cherry/walnut, Danish oil vs. shellac).
- Binding cord color/material within bom.csv Buy options.

## Must-nots (DFM may never violate)

- Tube lengths stay equation-driven (`L = c/(4f) - 0.82*bore_ID`, design.md sec 2.1); never hand-placed or scaled from a lossy mesh export.
- Do not omit the +3/16" trim allowance — final tuning is only ever removed from the open end, never added back (design.md sec 2.2; tubes "should never be lengthened after cutting").
- Do not substitute a different end-correction coefficient without re-validating against a built/measured prototype and logging the delta (risks.md AC-05).
- Do not commit to a full Chili (soprano) build without first prototyping Arka 7 (F#6, 1.982" calc length) in isolation — it is at the practical embouchure-length limit (risks.md AC-04).
- Do not assume bamboo bore matches the nominal design-table value; measure actual bore at the blow end of each tube before finalizing cut length (risks.md AC-01).

## Material intent

- Preferred: bamboo cañahueca (traditional) per member — Toyo 1-in nominal, Zanka 3/4-in nominal, Malta 1/2-in nominal, Chili 3/8-in — per bom.csv part rows (SKZ-*-01/02).
- Acceptable subs: PVC Schedule 40 (bore+bore drilled) or hardwood bored on lathe, per design.md sec 5.2 and bom.csv make/buy notes.
- Frame rails: cherry or walnut S4S, per bom.csv (SKZ-*-04/05).
- Bottom seal: beeswax pour plug (food-grade/filtered) per bom.csv (SKZ-*-03); bamboo node preferred where available, especially for Chili.
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
