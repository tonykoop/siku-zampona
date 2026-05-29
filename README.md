# Siku (Zampoña)

**Status: L2 V5 build-packet candidate** · Heifer Zephyr · instrument-maker-v4 · packet v4.3 · 2026-05-08

Engineering documentation for the *siku* (Aymara: *siku'*, Spanish: *zampoña*) — the Andean panpipe, built as a four-member family in a complete v4.3 root-mode packet.

The siku is played in interlocking arka/ira pairs. Neither rank alone contains the full scale — two players weave a melody together, embodying *yanantin*, the Aymara philosophy of complementary pairing.

---

## Family Overview

| Member | Key | Bore ID | OD | Tubes | Longest | Shortest | Frame Width |
|---|---|---|---|---|---|---|---|
| Toyo (bass) | G3 | 0.750" | 1.000" | 13 | 22.646" | 7.064" | 13.750" |
| **Zanka (tenor)** | **C4** | **0.625"** | **0.821"** | **13** | **16.961"** | **4.814"** | **11.423"** |
| Malta (alto) | G4 | 0.500" | 0.658" | 13 | 11.315" | 3.261" | 9.304" |
| Chili (soprano) | A4 | 0.375" | 0.493" | 13 | 7.565" | 1.982"⚠ | 7.159" |

**Primary build target: Zanka.** The Zanka is the main melodic voice in traditional Andean ensembles and the best starting point for a first build.

⚠ Chili Arka-7 (F#6, 1.982" / 50mm) is at the practical playability limit — see `risks.md` AC-04. Consider building the Chili as an 11-tube instrument.

---

## Arka / Ira Split (Zanka example)

| Rank | Tubes | Notes | Semitone offsets |
|---|---|---|---|
| Arka (leader ♀) | 7 | G3 B3 D4 F4 A4 C5 E5 | 0 4 7 10 14 17 21 |
| Ira (follower ♂) | 6 | A3 C4 E4 G4 B4 D5 | 2 5 9 12 16 19 |

Combined: G Mixolydian scale (G A B C D E F♮ G A B C D E)

---

## Tube Length Formula

```
L_calc  = 13552 / (4 × f_hz) − 0.82 × bore_ID
L_cut   = L_calc + 3/16"    (trim allowance)
```

- Speed of sound: 13,552 in/s at 68°F
- End correction: 0.82 × bore_ID (empirical; bundles embouchure effects)
- Stopped pipe: odd harmonics only (1f, 3f, 5f …)
- Tuning: A4 = 440 Hz, equal temperament

Sanity check: `L_calc(A4, bore=0.625") = 13552/(4×440) − 0.82×0.625 = 7.188"`

---

## Packet Contents

| File | Description |
|---|---|
| `design.md` | Governing model, provenance, tube length tables, arka/ira split |
| `family-spec.csv` | All 4 members with bore, wall, tube lengths, Hz values |
| `bom.csv` | Full bill of materials |
| `sourcing.csv` | Suppliers with substitute risk ratings |
| `cut-list.csv` | 52 tube cuts + 4 frame rail cuts |
| `validation.csv` | Per-tube validation targets (Hz, cents tolerance) |
| `assembly-manual.md` | 8-phase build manual |
| `risks.md` | 11 structured risks with verification tests |
| `jig-decision.md` | Fixture selection for each manufacturing operation |
| `cnc/setup-sheet.md` | Machine datums, tooling, release checks for all operations |
| `cnc/operations.csv` | Machine-readable operation list |
| `wolfram/instrument-model.wl` | Interactive tube-length explorer (Wolfram Mathematica) |
| `drawings/` | 10 dimensioned SVG drawings |
| `site/index.html` | Build-log site — open in browser |
| `resources.md` | Acoustic and ethnomusicological references |
| `photo-shotlist.md` | 36-shot photo list |
| `supplier-rfq.md` | RFQ templates for materials |
| `siku-zampona-design-table.xlsx` | Master design table (all 4 members) |

---

## Build in Brief

1. **Verify stock** — measure bore ID and OD of all incoming bamboo or PVC; record in `validation.csv`
2. **Cut tubes** — story stick method (bamboo) or digital stop (PVC); 52 tubes total across 4 members
3. **Seal ends** — pour beeswax plug to 3/8" depth; stand in plywood sealing fixture while curing
4. **First-pass tuning** — measure all tubes with chromatic tuner; record deviation in cents
5. **Mill frame rails** — CNC-route 13 tube pockets in cherry/walnut rail; pocket width = OD − 0.005"
6. **Bind** — seat tubes in rail pockets; wrap with waxed cord; square-knot at ends
7. **Trim-tune** — file/saw open ends to ±5 cents; update `validation.csv`
8. **Finish** — Danish oil on rails; tung oil wipe on bamboo; photograph

---

## Related Repos

- [tonykoop/instrument-maker](https://github.com/tonykoop/instrument-maker) — parent catalog and skill
- [tonykoop/transverse-flute](https://github.com/tonykoop/transverse-flute) — stopped-pipe family baseline
- [tonykoop/gemshorn](https://github.com/tonykoop/gemshorn) — vessel-flute family; reference for `family-spec.csv` format

---

## Cultural Provenance

The siku is a living cultural artifact of the Aymara and Quechua peoples of Bolivia and Peru, with a documented history extending to at least 1500 BCE (Tiwanaku, Nazca archaeological sites).

This repository documents a **contemporary workshop interpretation** built using modern CNC and PVC/bamboo materials. It makes no claim of cultural authenticity.

Before writing public-facing documentation, captions, or README text for forks, please read:
- Thomas Turino — *Moving Away from Silence* (Chicago, 1993): essential ethnography of siku in Aymara culture
- `resources.md §Provenance` — five-point guidance checklist in this packet
- Describe the instrument as "Andean Aymara/Quechua in origin" (not "Incan" or generically "South American")
- Acknowledge *yanantin* — the interlocking duet design is not decorative; it embodies a cultural philosophy

---

## License

[CC BY 4.0](LICENSE) — engineering documentation only. Attribution: Tony Koop / Heifer Zephyr.  
This license covers the build packet. It is not a claim of ownership over the siku tradition.
