# Siku (Zampoña) — Visual BOM Brief

**Purpose:** Art direction for a visual bill-of-materials plate suitable for the capstone deck, print packet, and build-log site.  
**Reference style:** Tony's Ashiko BOM (`ashiko-drum-workshop/images/figure-bom-v2.png`)

---

## Layout Spec

**Page size:** 11 × 8.5" landscape (letter, for print packet), or 1920 × 1080 px (for deck/site)  
**Header:**
- Assembly name: "Siku (Zampoña) — Zanka Tenor, Key C4"  
- Quote date: 2026-05-08  
- Estimated cost: ~$35–55 per instrument (prototype; bamboo material; does not include shop tooling)

**Hero image:** Full-color photograph or rendering of a complete assembled Zanka arka rank showing the stepped tube array, frame rails, and cord lashing. If no photo is available, use a clean SVG elevation (see `drawings/siku-zanka-arka.svg` — substitute placeholder note in brackets).

---

## Table Structure

Columns: **Part No. · Part Name · Description · Qty · Unit · Image · Cost Ea. · Total · Source**

| Part No. | Part Name | Description | Qty | Unit | Image status | Cost ea. | Total |
|---|---|---|---|---|---|---|---|
| SKZ-Z-01 | Arka Tube | Bamboo or PVC, bore 0.625", 7 unique lengths | 7 | pc | _[Supplier photo or bamboo cross-section photo]_ | $0.40 | $2.80 |
| SKZ-Z-02 | Ira Tube | Same bore, 6 unique lengths | 6 | pc | _[Same image as Z-01]_ | $0.40 | $2.40 |
| SKZ-Z-03 | Bottom Plug | Beeswax or 5/8" wood dowel | 13 | pc | _[Photo: beeswax block + dowel]_ | $0.08 | $1.04 |
| SKZ-Z-04 | Frame Rail — Top | Cherry, 3/8" × 1.5" × 12.4", CNC-pocketed | 1 | pc | _[Photo: routed cherry rail, tube pockets visible]_ | TBD | TBD |
| SKZ-Z-05 | Frame Rail — Bottom | Cherry, same dimensions | 1 | pc | _[Same as Z-04]_ | TBD | TBD |
| SKZ-Z-06 | Binding Cord | Waxed linen, 1/16" dia | 1 | set | _[Photo: cord spool]_ | $0.20 | $0.20 |
| SKZ-SHARED-01 | Chromatic Tuner | Korg CA-1 | 1 | pc | _[Product photo]_ | amortized | — |
| SKZ-SHARED-02 | Beeswax Block | 2 oz block | 1 | pc | _[Photo: beeswax block]_ | $3.00 | $3.00 |
| SKZ-SHARED-04 | Danish Oil | Watco, for frame rails | 1 | can | _[Product photo]_ | amortized | — |

**Bottom notes on plate:**
- "Tube lengths per `family-spec.csv` — Zanka bore 0.625 in, stopped-pipe formula c=13552 in/s"
- "Frame rail species: cherry (walnut acceptable). Tube material: bamboo cañahueca (PVC Sch40 acceptable for prototype)"
- "Cost estimate reflects single prototype. Bamboo bulk pricing reduces tube cost significantly at 10+ instruments."

---

## Image sourcing priority

1. **Real photos from this build** — replace all placeholders after shop session
2. **Supplier product photos** — acceptable for hardware items (beeswax, cord, tuner)
3. **Generated placeholder renders** — SVG elevations from `drawings/` folder acceptable for deck use; mark "(CAD render — replace with build photo)"
4. **Never** use unrelated instrument photos or generic "bamboo" stock art without a caption explaining it's illustrative

---

## For Deck Use

The visual BOM slide in the capstone deck should show the hero image and the table. Use a two-column layout: hero image left (60% width), table right (40%). Caption: "Component count: 24 parts per Zanka instrument (13 tubes + 2 rails + 13 plugs + consumables)."
