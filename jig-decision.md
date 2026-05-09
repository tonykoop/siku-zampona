# Siku (Zampoña) — Jig Decision Matrix

**Purpose:** Choose the right fixture approach for each siku manufacturing operation before committing to tooling.  
**Packet:** v4.3 · Date: 2026-05-08

---

## Decision 1 — Tube Boring Method (Hardwood or PVC from solid stock)

**Context:** If not using pre-bored bamboo or nominal-bore PVC, you must bore the tube blank to the target bore ID. Three options:

| Option | Method | Pros | Cons | Verdict |
|---|---|---|---|---|
| **A — Drill Press + V-Block** | Mount blank in a V-block on the drill press table. Drill with a brad-point or Forstner bit. | Simple; no lathe needed | Bore wander likely on tubes > 6"; not suitable for Toyo/Zanka long tubes | ✅ Use for Malta and Chili (tubes ≤ 11") |
| **B — Lathe + Jacobs Chuck** | Chuck blank in 4-jaw chuck; bore with twist drill held in tailstock | Good concentricity; standard lathe workflow | Limits blank length to ~2× lathe capacity; requires 4-jaw setup | ✅ Use for Zanka (tubes to 17") |
| **C — Headstock-Driven Deep-Bore** | Spin drill in headstock Jacobs chuck; advance stationary blank with guided tailstock carrier | Correct technique for deep bores; minimal wander | Requires tailstock vise/carrier jig; more setup time | ✅ Use for Toyo (22.6" longest tube) |

**Decision:**
- Toyo → Option C (headstock-driven deep bore)
- Zanka → Option B (lathe) or Option C if lathe travel is insufficient
- Malta → Option A (drill press + V-block)
- Chili → Option A (drill press + V-block)

**Reference:** `references/techniques/headstock-driven-deep-bore-drilling.md`

---

## Decision 2 — Tube Length Marking Jig

**Context:** 52 tubes across 4 size classes, each with a unique length. Risk of mislabeling or incorrect cut length is high without a systematic marking fixture.

| Option | Method | Verdict |
|---|---|---|
| **A — Story Stick** | Cut a master story stick per family member with all 13 tube lengths marked. Transfer marks to each tube. | ✅ Recommended for bamboo builds — fast, tactile, no electronics needed |
| **B — Digital Stop on Miter Saw** | Set digital stop to each length, cut in sequence. | ✅ Recommended for PVC — repeatable for cylindrical stock |
| **C — Mark with Tape Measure Per Tube** | Measure each tube individually against the cut list. | ❌ Error-prone; too slow for 52 tubes |

**Decision:** Use Option A (story stick) for bamboo, Option B (digital stop) for PVC. Always double-check with a caliper after marking, before cutting.

**Story stick spec:**
- Material: 1/4" plywood or MDF, 25" long
- Mark all 13 Toyo lengths; 13 Zanka lengths (separate stick per family member)
- Label each mark with the tube ID (e.g., "T-A1 22.646") and note name
- Store with the packet

---

## Decision 3 — Frame Rail Pocket Routing Fixture

**Context:** 13 evenly-spaced tube pockets per rail; pocket spacing = OD + 1/16" gap. Options:

| Option | Method | Verdict |
|---|---|---|
| **A — CNC Router with G-code** | Generate pocket toolpath in Vectric or Fusion 360 from the frame-width and OD parameters | ✅ Best accuracy; recommended if CNC is available |
| **B — Router Table + Fence + Index Stops** | Set fence to pocket centerline. Use index pins or stop-block sequence to space pockets. | ✅ Acceptable for single builds; more setup time |
| **C — Drill Press + Forstner Bit** | Use Forstner bit equal to OD for circular pockets (vs. rectangular). | ⚠️ Circular pockets are fine for round tubes; need to verify tube OD matches bit diameter exactly |

**Decision:** Use Option A (CNC) with pocket width set to measured tube OD − 0.005". If CNC is unavailable, Option B with a test pocket first.

**CNC parameters (Zanka example):**
- Pocket width = 0.821" (Zanka OD) − 0.005" = 0.816"
- Pocket depth = 0.274" (1/3 of 0.821" OD)
- Pocket length = 1.5" (rail width)
- Spacing: 0.821" + 0.0625" = 0.884" center-to-center
- Total 13 pockets; first center at OD/2 = 0.411" from rail end

---

## Decision 4 — Closed-End Sealing Fixture

**Context:** Tubes must be held vertically and level while beeswax cures. 52 tubes across 4 sessions.

| Option | Method | Verdict |
|---|---|---|
| **A — Drilled Plywood Stand** | Drill 13 holes per stand in a scrap plywood panel matching tube ODs; stand tubes upright while wax pours. | ✅ Recommended; takes 20 minutes to build |
| **B — Sand/Rice Tray** | Stand tubes in a box of sand or rice. | ✅ Works; less repeatable; tubes may lean |
| **C — Individual Clamps** | Hold each tube in a machinist V-block or hand clamp. | ❌ Too slow for 13+ tubes |

**Decision:** Option A (drilled plywood stand). Build one per family member (4 stands, 4 hole diameters). Label each stand with the member ID.

**Stand spec:**
- 3/4" plywood, 6" × 14" (Toyo) down to 4" × 8" (Chili)
- Holes drilled at OD + 0.010" clearance, spaced at pocket-spacing interval
- Clamp stand to bench during wax pour

---

## Decision 5 — Tuning Trim Jig

**Context:** Final pitch adjustment by trimming open end. Need to hold tube perpendicular to saw blade and remove very small increments (≤1/32").

| Option | Method | Verdict |
|---|---|---|
| **A — Miter Saw with Fine-Tooth Blade** | Mark increment with tape; light scoring passes | ✅ Fastest; needs 80T blade for clean cuts |
| **B — Fine File + Sanding Block** | File end square; verify with engineer's square | ✅ Safest (no over-cut risk); slowest |
| **C — Lathe Parting Tool** | Chuck tube; face off with parting tool or facing pass | ✅ Best surface quality; requires lathe setup per tube |

**Decision:** Option A for rough adjustment (>1/16" removal), Option B for final micro-trim (<1/32"). Always sand end flat after each cut.

---

## Jig Build Priority

| Priority | Jig | When needed |
|---|---|---|
| P1 | Story stick × 4 (one per member) | Before any cutting |
| P1 | Sealing stand × 4 (one per member) | Before Phase 3 sealing |
| P2 | CNC pocket toolpath | Before Phase 5 frame fabrication |
| P3 | Tailstock carrier for deep bore (Toyo only) | Before boring hardwood Toyo blanks |
