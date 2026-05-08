# Siku (Zampoña) — Design Document

**Instrument:** Siku / Zampoña (Andean Panpipe)  
**Family:** 4-member (Toyo bass · Zanka tenor · Malta alto · Chili soprano)  
**Play style:** 2-rank interlocking duet (arka ♀ + ira ♂) or single-player alternating  
**Packet version:** v4.3 root-mode  
**Date:** 2026-05-08  
**Workbook:** `siku-zampona-design-table.xlsx`

---

## 1. Cultural Provenance

The siku (Aymara: *siku'*; Spanish: *zampoña*) is the pre-Columbian panpipe of the Andean altiplano, with archaeological examples dating to at least 1500 BCE from Tiwanaku-culture sites in present-day Bolivia and Peru. The instrument is central to the Aymara philosophical concept of **yanantin** — complementarity or paired wholeness — expressed musically through the interlocking duet technique in which two players each hold one rank and together produce a continuous melody.

Traditional materials: *cañahueca* bamboo (giant Andean cane, *Guadua chacoensis*) or *suri* bamboo. Tubes sealed at the lower end with a natural node or with beeswax. Rows bound with cord (traditionally alpaca or llama fiber) and sometimes framed between two parallel wooden rails.

Contemporary builders use PVC, hardwood, or aluminium tubing where bamboo is not available. This packet covers all three substrate options, with bamboo as the default.

### Traditions and ensemble contexts

| Tradition | Region | Tuning | Notes |
|---|---|---|---|
| Siku de Pares | Bolivian altiplano | Diatonic major, slight sharp tendency | Paired arka+ira, played outdoors |
| Siku de la Costa | Peruvian coast | Pentatonic variants | Smaller size, indoor context |
| Sikuri conjunto | Bolivia, Peru | 4–6 instrument sizes | Full ensemble from Toyo to Chili |
| Contemporary workshop | Global | Equal temperament | CNC/lathe bore, reproducible |

---

## 2. Governing Physics Model

### 2.1 Stopped Pipe

Each siku tube is a **cylindrical closed pipe** — closed at one end (bottom node or wax plug), open at the other (blow end). The fundamental frequency:

```
f = c / (4 × L_eff)
```

where `L_eff` is the **effective acoustic length** = physical tube length + open-end correction:

```
L_eff = L_physical + ΔL_end
ΔL_end ≈ 0.82 × bore_diameter   (Tony's empirical convention, ≈ 0.41 × r open-end correction)
```

Solving for the physical tube length to cut:

```
L_physical = c / (4 × f) - 0.82 × bore_ID
```

**Speed of sound:** `c = 13,552 in/s` at 68°F / 20°C (Tony's shop standard).  
Temperature sensitivity: ±5°F shifts pitch by approximately ±0.9 cents. Validate in the shop at build temperature.

**Overtone series:** Stopped pipe produces only **odd harmonics** (1f, 3f, 5f, 7f…), giving the characteristic hollow, breathy tone color. This is the acoustic signature of the siku vs. open-pipe flutes that produce all harmonics.

### 2.2 Tuning Trim Allowance

All physical tube lengths in this packet include a **+3/16" (0.1875") trim allowance**. Final tuning is achieved by trimming from the open (blow) end. Tubes should never be lengthened after cutting — seal first, measure against a chromatic tuner, then trim in ≤1/32" increments.

### 2.3 Arka / Ira Split

The 13 tubes of a standard siku are divided into two ranks:

| Rank | Role | Tubes | Semitone offsets from root |
|---|---|---|---|
| **Arka** | leader (♀) | 7 tubes | 0, 4, 7, 10, 14, 17, 21 |
| **Ira** | follower (♂) | 6 tubes | 2, 5, 9, 12, 16, 19 |

Combined and sorted: `0, 2, 4, 5, 7, 9, 10, 12, 14, 16, 17, 19, 21`  
This gives **Mixolydian mode** (major scale with ♭7), spanning nearly 2 octaves. The "siku key" convention: the key letter names the **5th semitone above the root** (the 4th tube of the combined scale, which is the perfect fourth).

> Example: Root = D3 → siku key = G3 (D3 + 5 semitones).

### 2.4 Siku Key Naming Convention

```
siku_key_midi = root_midi + 5
```

| Size Class | Root Note | MIDI | Siku Key |
|---|---|---|---|
| Toyo (bass) | D3 | 38 | G3 |
| Zanka (tenor) | G3 | 43 | C4 |
| Malta (alto) | D4 | 50 | G4 |
| Chili (soprano) | A4 | 57 | D5 |

---

## 3. Family Specification

Four size classes cover the full Andean sikuri ensemble range. See `family-spec.csv` for complete per-member data.

### 3.1 Physical Dimensions

| Member | Size Class | Bore ID (in) | Wall (in) | OD (in) | Root Note | Siku Key |
|---|---|---|---|---|---|---|
| Toyo | Bass | 0.750 | 0.125 | 1.000 | D3 | G3 |
| Zanka | Tenor | 0.625 | 0.098 | 0.821 | G3 | C4 |
| Malta | Alto | 0.500 | 0.079 | 0.658 | D4 | G4 |
| Chili | Soprano | 0.375 | 0.059 | 0.493 | A4 | D5 |

### 3.2 Tube Length Tables

All lengths in inches. `L_calc` = formula result. `L_cut` = L_calc + 3/16" trim allowance.

#### Toyo (Bass) — Root D3 / Siku Key G3 / Bore 0.750"

| Tube | Note | Freq (Hz) | L_calc (in) | L_cut (in) |
|---|---|---|---|---|
| Arka 1 | D3 | 146.83 | 22.459 | 22.646 |
| Arka 2 | F#3 | 185.00 | 17.699 | 17.886 |
| Arka 3 | A3 | 220.00 | 14.785 | 14.973 |
| Arka 4 | C4 | 261.63 | 12.335 | 12.522 |
| Arka 5 | E4 | 329.63 | 9.663 | 9.851 |
| Arka 6 | G4 | 392.00 | 8.028 | 8.215 |
| Arka 7 | B4 | 493.88 | 6.245 | 6.432 |
| Ira 1 | E3 | 164.81 | 19.942 | 20.129 |
| Ira 2 | G3 | 196.00 | 16.671 | 16.858 |
| Ira 3 | B3 | 246.94 | 13.105 | 13.292 |
| Ira 4 | D4 | 293.66 | 10.922 | 11.109 |
| Ira 5 | F#4 | 369.99 | 8.542 | 8.729 |
| Ira 6 | A4 | 440.00 | 7.085 | 7.272 |

**Longest:** 22.459" (Arka 1) · **Shortest:** 6.245" (Arka 7) · **Frame width:** 13.750"

#### Zanka (Tenor) — Root G3 / Siku Key C4 / Bore 0.625"

| Tube | Note | Freq (Hz) | L_calc (in) | L_cut (in) |
|---|---|---|---|---|
| Arka 1 | G3 | 196.00 | 16.773 | 16.961 |
| Arka 2 | B3 | 246.94 | 13.207 | 13.395 |
| Arka 3 | D4 | 293.66 | 11.024 | 11.212 |
| Arka 4 | F4 | 349.23 | 9.189 | 9.376 |
| Arka 5 | A4 | 440.00 | 7.188 | 7.375 |
| Arka 6 | C5 | 523.25 | 5.962 | 6.150 |
| Arka 7 | E5 | 659.26 | 4.627 | 4.814 |
| Ira 1 | A3 | 220.00 | 14.888 | 15.075 |
| Ira 2 | C4 | 261.63 | 12.437 | 12.625 |
| Ira 3 | E4 | 329.63 | 9.766 | 9.953 |
| Ira 4 | G4 | 392.00 | 8.130 | 8.318 |
| Ira 5 | B4 | 493.88 | 6.347 | 6.535 |
| Ira 6 | D5 | 587.33 | 5.256 | 5.443 |

**Longest:** 16.773" (Arka 1) · **Shortest:** 4.627" (Arka 7) · **Frame width:** 11.423"

#### Malta (Alto) — Root D4 / Siku Key G4 / Bore 0.500"

| Tube | Note | Freq (Hz) | L_calc (in) | L_cut (in) |
|---|---|---|---|---|
| Arka 1 | D4 | 293.66 | 11.127 | 11.314 |
| Arka 2 | F#4 | 369.99 | 8.747 | 8.934 |
| Arka 3 | A4 | 440.00 | 7.290 | 7.478 |
| Arka 4 | C5 | 523.25 | 6.065 | 6.252 |
| Arka 5 | E5 | 659.26 | 4.729 | 4.917 |
| Arka 6 | G5 | 783.99 | 3.911 | 4.099 |
| Arka 7 | B5 | 987.77 | 3.020 | 3.207 |
| Ira 1 | E4 | 329.63 | 9.868 | 10.056 |
| Ira 2 | G4 | 392.00 | 8.233 | 8.420 |
| Ira 3 | B4 | 493.88 | 6.450 | 6.637 |
| Ira 4 | D5 | 587.33 | 5.358 | 5.546 |
| Ira 5 | F#5 | 739.99 | 4.168 | 4.356 |
| Ira 6 | A5 | 880.00 | 3.440 | 3.627 |

**Longest:** 11.127" (Arka 1) · **Shortest:** 3.020" (Arka 7) · **Frame width:** 9.304"

#### Chili (Soprano) — Root A4 / Siku Key D5 / Bore 0.375"

| Tube | Note | Freq (Hz) | L_calc (in) | L_cut (in) |
|---|---|---|---|---|
| Arka 1 | A4 | 440.00 | 7.393 | 7.580 |
| Arka 2 | C#5 | 554.37 | 5.804 | 5.991 |
| Arka 3 | E5 | 659.26 | 4.832 | 5.019 |
| Arka 4 | G5 | 783.99 | 4.014 | 4.201 |
| Arka 5 | B5 | 987.77 | 3.122 | 3.310 |
| Arka 6 | D6 | 1174.66 | 2.577 | 2.764 |
| Arka 7 | F#6 | 1479.98 | 1.982 | 2.169 |
| Ira 1 | B4 | 493.88 | 6.552 | 6.740 |
| Ira 2 | D5 | 587.33 | 5.461 | 5.648 |
| Ira 3 | F#5 | 739.99 | 4.271 | 4.458 |
| Ira 4 | A5 | 880.00 | 3.542 | 3.730 |
| Ira 5 | C#6 | 1108.73 | 2.748 | 2.936 |
| Ira 6 | E6 | 1318.51 | 2.262 | 2.450 |

**Longest:** 7.393" (Arka 1) · **Shortest:** 1.982" (Arka 7) · **Frame width:** 7.159"

> ⚠️ **Chili Arka 7 (F#6 = 1.982"):** This 50 mm tube is at the practical lower limit for panpipe embouchure control. Traditional ensembles often omit the highest 1–2 tubes of the Chili. Confirm playability before including in a build. See `risks.md` #AC-04.

---

## 4. Binding and Frame Layout

### 4.1 Tube Array Geometry

Tubes are arranged in descending-length order, longest at left (bass), shortest at right (treble). The two ranks (arka and ira) are bound as separate instruments; in duet play, the players hold one rank each side by side.

**Standard tube spacing:** OD + 1/16" (0.0625") gap between tube centerlines.  
Tubes align flush at the blow end (top). A stepped profile descends to the right.

**Frame cross-section:**

```
[Top rail] ────────────────────────────────────
  ○  ○  ○  ○  ○  ○  ○  ○  ○  ○  ○  ○  ○    ← 13 tubes (arka 7 + ira 6)
[Bottom rail] — stepped or cut to tube profile
```

### 4.2 Binding Methods

| Method | Description | Traditional? | Durability |
|---|---|---|---|
| Cord wrap | Waxed cotton or alpaca cord, 2–4 bands | Yes | Good |
| Frame lash | Tubes between two thin wooden rails, cord lashed | Semi-traditional | Better |
| CNC frame notch | Rails with individual tube pockets routed in | Contemporary | Best alignment |
| Epoxy + frame | Rails glued to tubes | Workshop/contemporary | Best (non-reversible) |

**Recommended for CNC build:** CNC-notched frame. Route tube pockets ≈ 1/3 OD depth into the face of each rail. Rail thickness: 3/8" to 1/2". Rail width: 1" to 1.5". Species: cherry, walnut, or maple.

### 4.3 Frame Dimensions Summary

| Member | # Tubes | OD (in) | Gap (in) | Frame Width (in) | Rail Length (in) |
|---|---|---|---|---|---|
| Toyo | 13 | 1.000 | 0.063 | 13.750 | 13.750 + 0.5 overhang each end |
| Zanka | 13 | 0.821 | 0.063 | 11.423 | 11.423 + 0.5 overhang |
| Malta | 13 | 0.658 | 0.063 | 9.304 | 9.304 + 0.5 overhang |
| Chili | 13 | 0.493 | 0.063 | 7.159 | 7.159 + 0.5 overhang |

### 4.4 Tube Sealing

Closed end (bottom): options in order of traditionality and performance:

1. **Natural bamboo node** — bamboo blank cut so a node falls at the correct closed-end position. Best tone, traditional. Requires careful blank selection.
2. **Beeswax plug** — melt beeswax into tube bottom, let harden. Used for tuning adjustment. Also used to close PVC or bamboo without a node.
3. **Wood dowel plug** — turned to press fit, glued. Good for hardwood or PVC tubes.
4. **Cork plug** — easy, reversible. Slight tone dampening at the closed end (adds small effective length → slight pitch-flat tendency). Correct by trimming 1/16" from open end if using cork.

**Wax plug acoustic note:** Beeswax has high acoustic impedance at this scale; the reflection at the wax-air boundary is nearly ideal for a stopped pipe. Cork is slightly less reflective. Cork-plugged tubes may run ~5–10 cents flat vs. wax/node — account for this in final trim.

---

## 5. CNC and Lathe Notes

See `cnc/setup-sheet.md` for the full operation plan.

### 5.1 Bamboo Blanks

- Select blanks with consistent internal bore (cañahueca splits most predictably with 3–4 mm wall thickness in the Andean species).
- Bore diameter should match the design table. Natural bamboo bore varies ±1–2 mm; oversized bore raises pitch (shorter effective length correction), undersized lowers it.
- Use headstock-driven deep-bore drilling (see `references/techniques/headstock-driven-deep-bore-drilling.md`) when boring hardwood or PVC blanks to the target bore ID from solid stock.

### 5.2 Hardwood or PVC Tubes

For a CNC-shop build without cane:

- **PVC Schedule 40 pipe:** widely available; bore IDs match close enough for Zanka (3/4" nominal ≈ 0.824" ID, use for Toyo; 1/2" nominal ≈ 0.622" ID for Zanka). Verify actual ID with calipers before computing cut lengths.
- **Hardwood bore:** bore blanks on the lathe or with headstock-driven drill; cherry, walnut, or maple all work. Seal with shellac or wax inside bore before final assembly.

### 5.3 Frame CNC Operations

1. Mill tube-pocket profile in each rail blank (1 op per rail, router table or CNC).
2. Sand pocket bottoms flat for consistent tube seating depth.
3. Pre-drill cord holes through rail ends.
4. Finish rail: 3 coats shellac or danish oil.

---

## 6. Tuning Validation

See `validation.csv` for per-tube rows.

### 6.1 Prediction Accuracy

The stopped-pipe formula is accurate to within 5–10 cents for bamboo at nominal bore diameter. Known sources of variation:

- **Bore taper:** Natural bamboo tapers slightly. A narrowing bore raises pitch slightly.
- **Temperature:** ±5°F ≈ ±0.9 cents.
- **Closed-end plug type:** Cork +5–10 cents flat vs. wax/node.
- **Embouchure gap:** Air-column effective length depends on blow angle and lip position. A trained player adjusts to ±10 cents. This is not a manufacturing defect.

### 6.2 Trim Protocol

1. Cut all tubes to L_cut (formula + 3/16" trim allowance).
2. Seal closed ends with wax or fit plugs.
3. Measure with chromatic tuner (Korg CA-1 or equivalent) at 68°F, 40–50% RH.
4. Record measured frequency and cents error in `validation.csv`.
5. Trim open end in ≤1/32" increments. Re-measure. Repeat until ≤±5 cents.

---

## 7. Open Items and Assumptions

| # | Item | Status |
|---|---|---|
| DES-01 | Bore tolerances for bamboo: actual vs. nominal | TBD — measure blanks |
| DES-02 | Cork plug acoustic correction factor | TBD — empirical, add ±1/16" to open-end trim |
| DES-03 | Rail species and thickness (CNC frame) | Assumed cherry 3/8" — confirm available stock |
| DES-04 | Arka 7 Chili (F#6, 1.98") playability | TBD — prototype test |
| DES-05 | Toyo Arka1 length 22.6" — exceeds typical hand reach | TBD — confirm acceptable for bass register |
| DES-06 | Measured K2 corrections for bamboo bore | None available; marked first-order estimates |
| DES-07 | Speed of sound at shop temperature during build | Measure shop temp; correction = c×√(T_K/293.15) |
