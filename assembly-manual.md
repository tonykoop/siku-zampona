# Siku (Zampoña) — Assembly Manual

**Instrument:** Siku / Zampoña (Andean Panpipe Family)  
**Packet:** v4.3 · Date: 2026-05-08  
**Applies to:** SKZ-TOYO · SKZ-ZANKA · SKZ-MALTA · SKZ-CHILI

---

## Safety and Setup

- Wear eye protection when cutting tubes on the miter saw or band saw.
- Wear hearing protection when routing frame rails.
- Keep beeswax away from open flames — melt in a double boiler only.
- Work in a well-ventilated space when applying finish to frame rails.
- Do not rush the tuning trim phase — cutting too short is irreversible.

**Tools required:**

| Tool | Use |
|---|---|
| Miter saw or fine-tooth hand saw | Cutting tubes to rough length |
| Drill press or lathe | Boring hardwood/PVC blanks (if not using pre-bored stock) |
| CNC router or router table | Frame rail pocket routing |
| Calipers (0.001" resolution) | Bore ID and OD verification |
| Chromatic tuner (Korg CA-1 or equivalent) | Pitch measurement during trim |
| Double boiler + thermometer | Beeswax melting (max 185°F) |
| Sandpaper 220/320 grit + dowel caul | Tube end finishing |
| Waxed cord + blunt needle | Binding lash |

---

## Phase 1 — Stock Preparation and Bore Verification

### 1A. Measure Actual Bore ID

Before computing or trusting any cut lengths, **verify the actual bore ID** of your tube stock with calipers.

The design table assumes nominal bore IDs (0.750", 0.625", 0.500", 0.375" for Toyo through Chili). Natural bamboo can vary ±0.050" from nominal. If your actual bore differs, the tube lengths from `family-spec.csv` and `cut-list.csv` will be slightly off.

**Recalculation formula:**

```
L_physical = 13552 / (4 × f_hz) − 0.82 × actual_bore_ID_in
```

Record actual bore measurements in `validation.csv` rows `VAL-BORE-01` through `VAL-BORE-04`.

### 1B. Select and Inspect Blanks

- Bamboo: look for straight, crack-free sections. Node spacing must exceed your longest tube length (22.6" for Toyo — this may require selecting between nodes on long blanks).
- PVC: confirm Schedule 40 designation; measure actual ID with caliper before cutting. Degrease with isopropyl alcohol before sealing or bonding.
- Hardwood (if boring from solid): grain must run parallel to bore axis. Avoid knots near the bore path.

---

## Phase 2 — Tube Cutting

### 2A. Mark Lengths

Mark each tube with a fine-point marker at the **L_cut** length from `cut-list.csv`. Double-check the mark before cutting. Label the tube with its note name and member ID (e.g., "Z-A3 D4").

### 2B. Cut Tubes

- Use a fine-tooth miter saw blade (80T for PVC, 60T for bamboo) to minimize tearout at the cut end.
- For bamboo, orient the cut so the open end faces the blade — this prevents splitting the culm wall.
- Lightly sand the cut end flat and perpendicular on 220-grit paper wrapped around a flat block. The open (blow) end must be perfectly flat; a beveled end affects embouchure angle and can introduce a systematic pitch error.

### 2C. Verify Squareness

Hold each tube upright against a machinist square. The open end must be perpendicular to the bore axis within ±0.5°.

---

## Phase 3 — Closed-End Sealing

### 3A. Option A — Natural Bamboo Node (preferred)

If the blank has a natural node at the desired closed-end position (within ±1/8" of L_cut from the open end), the node forms a nearly perfect closed-end reflector.

- Clean the node interior with a bottle brush; remove any pith material.
- Seal with a thin beeswax coat for moisture protection.

### 3B. Option B — Beeswax Plug

1. Melt beeswax in a double boiler to ~160°F. Do not overheat.
2. Stand the tube upright, closed-end down. Pour molten wax to a depth of ~3/8" (Toyo/Zanka) or ~1/4" (Malta/Chili).
3. Allow to cool completely before handling (~20 minutes at room temperature).
4. Verify the plug is solid and flush with the tube wall — no voids or cracks.

> **Acoustic note:** Beeswax provides an excellent rigid boundary. The tube will be slightly sharp immediately after pouring (warm wax), then settle to pitch as it cools. Always measure at shop temperature.

### 3C. Option C — Wood Dowel Plug

- Turn a dowel to a light press fit (0.002"–0.005" undersize from bore ID).
- Apply Titebond III to the dowel, press in to 1/2" depth, allow to cure 24 hours.
- Trim flush with a chisel and sand level.

---

## Phase 4 — First Tuning Pass

### 4A. Measure Before Trimming

After sealing, measure every tube with the chromatic tuner. Blow across the open end at a consistent 45° embouchure angle. Record the measured pitch in `validation.csv`.

Expected result: tubes should measure between 0 and +15 cents sharp (due to the trim allowance). If any tube measures flat at this stage, something is wrong — check the plug length, bore ID, or re-measure the cut length.

### 4B. Trim to Pitch

- Trim only from the **open (blow) end** — never from the closed end.
- Remove material in ≤1/32" increments. Use the miter saw or a fine file; sand the end flat after each cut.
- Re-measure after each increment. Stop when the tube reads 0 to +2 cents (give the player slight room to tune sharp with breath pressure if desired).
- Record final measured frequency and cents error in `validation.csv`.

**Do not over-trim.** A tube that is more than 5 cents flat cannot be corrected without plugging the closed end with more wax (which adjusts the effective acoustic length) — messy and imprecise.

---

## Phase 5 — Frame Rail Fabrication

### 5A. Mill Rails to Dimension

For each family member, mill two cherry or walnut rails to:

| Member | Rail thickness | Rail width | Rail length |
|---|---|---|---|
| Toyo | 3/8" | 1.5" | 14.75" |
| Zanka | 3/8" | 1.5" | 12.4" |
| Malta | 3/8" | 1.5" | 10.3" |
| Chili | 3/8" | 1.5" | 8.2" |

Joint one face and one edge flat before routing pockets.

### 5B. CNC Tube Pockets

Route tube pockets on the CNC router or router table using a straight bit equal to the OD of the tubes (or slightly undersize for a press fit). See `cnc/setup-sheet.md` for the full operation plan.

Pocket depth = 1/3 × OD:

| Member | OD | Pocket depth |
|---|---|---|
| Toyo | 1.000" | 0.333" |
| Zanka | 0.821" | 0.274" |
| Malta | 0.658" | 0.219" |
| Chili | 0.493" | 0.164" |

Pocket spacing = OD + 1/16" gap, 13 pockets per rail.

> **Photo placeholder:** _[Photo: CNC routing tube pockets in cherry rail — Zanka size]_

### 5C. Finish Rails

Sand to 220 grit. Apply 3 coats of Watco Danish Oil, wiping off excess after 15 minutes per coat. Allow 24 hours cure before assembly.

---

## Phase 6 — Assembly

### 6A. Dry Fit

Before any glue, dry-fit all 13 tubes in the top rail. Verify:
- All tubes seat fully in pockets.
- Blow ends are flush with the rail face (±1/32").
- No gaps between rail and tube wall.

Correct any tight pockets with a drum sander or round file.

### 6B. Glue-Up

1. Apply a thin bead of Titebond III (bamboo/wood) or West System epoxy (PVC) into each pocket.
2. Press tubes in one at a time, working from the longest to shortest.
3. Clamp the rail against the tubes with a caul and clamps. Allow 2 hours minimum before disturbing.

### 6C. Second Rail and Binding

The bottom rail can be:

- **Flat** (all tubes extend below the rail at varying lengths — traditional stepped appearance): Glue and clamp the second rail 2–4" below the blow end.
- **Profile cut** (bottom edge follows the stepped tube profile): Mark the tube bottom ends on the rail, cut the stepped profile on the band saw, then glue and clamp.

Finish with two wraps of waxed cord: one wrap 1/4" from the top rail, one wrap at the bottom rail. Lash with a square knot; wax the knot.

> **Photo placeholder:** _[Photo: Completed Zanka arka rank — cord lashing detail]_

---

## Phase 7 — Final Tuning and Validation

### 7A. Post-Assembly Pitch Check

After the glue has fully cured (24 hours), measure every tube again with the tuner. The assembly process should not have shifted pitch significantly. If any tube has moved more than ±3 cents from Phase 4 readings, check the plug for cracking or that no glue entered the bore.

### 7B. Validate Against Spec

Complete all rows in `validation.csv`. Sign off with temperature, RH, and date.

Target: all tubes within ±5 cents of target (±10 cents for Toyo bass tubes where breath embouchure variance is higher).

### 7C. Duet Setup

Once both arka and ira ranks are complete, hold them side by side with arka on the left (longest tube at player's left). Play a diatonic scale by alternating between arka and ira (arka provides notes 1, 3, 5, ♭7, 9, 11, 13; ira provides 2, 4, 6, 8, 10, 12 of the combined scale).

Confirm all 13 notes are playable and the combined scale is in tune.

---

## Phase 8 — Finishing Touches

### 8A. Decorative Cord Wrap (Optional)

Traditional siku may have colored yarn or patterned cord wrapping in addition to the structural cord. Alpaca or wool yarns in traditional Andean patterns (red/black/yellow) are appropriate; any non-elastic yarn works.

### 8B. Maintenance

- Store in a dry case or wrapped in cloth; avoid extreme temperature changes.
- Beeswax plugs may soften slightly in hot vehicles — store away from direct sunlight.
- Re-tune after significant humidity change — bamboo responds more than PVC.
- Inspect cord wraps annually; re-wax if the cord feels dry or shows fraying.
