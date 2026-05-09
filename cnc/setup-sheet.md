# Siku (Zampoña) — CNC & Machining Setup Sheet

**Packet:** v4.3 · Date: 2026-05-08  
**Repo:** `siku-zampona`  
**Reference:** `jig-decision.md` (for fixture selection rationale), `cut-list.csv` (for tube lengths), `family-spec.csv` (for bore/OD parameters)

---

## Machine Assignments by Operation

| Op ID | Operation | Machine | Member(s) | Setup File |
|---|---|---|---|---|
| OP-01 | Frame rail pocket routing | CNC Router | All 4 | See §1 |
| OP-02 | Tube boring — shallow | Drill Press | Malta, Chili | See §2 |
| OP-03 | Tube boring — deep | Lathe | Zanka | See §3 |
| OP-04 | Tube boring — deep-bore | Headstock-driven | Toyo | See §4 |
| OP-05 | Sealing stand fabrication | Drill Press | All 4 | See §5 |
| OP-06 | Tube length marking | Story stick / Digital stop | All 4 | See §6 |
| OP-07 | Tuning trim | Miter Saw + File | All 4 | See §7 |

---

## §1 — CNC Router: Frame Rail Pocket Routing

### Purpose
Mill 13 semi-circular or rectangular tube pockets into each cherry/walnut frame rail. Two rails per instrument (top and bottom). Pockets hold tubes at correct spacing for binding.

### Machine Setup
- **Machine:** CNC router (router table with fence acceptable as fallback — see `jig-decision.md` Decision 3)
- **Spindle speed:** 18,000–22,000 RPM (up-cut spiral for cherry/walnut)
- **Feed rate:** 80–100 IPM (cherry), 60–80 IPM (walnut)
- **Plunge rate:** 20 IPM
- **Coolant:** Air blast only (no coolant on wood)

### Tooling

| Member | Pocket Width | Bit Type | Bit Diameter | Notes |
|---|---|---|---|---|
| Toyo | 0.995" | Up-cut spiral end mill | 1/2" | Two passes: rough + finish |
| Zanka | 0.816" | Up-cut spiral end mill | 3/8" or 1/2" | Pocket width = OD − 0.005" |
| Malta | 0.653" | Up-cut spiral end mill | 5/16" or 3/8" | |
| Chili | 0.488" | Up-cut spiral end mill | 1/4" | Minimum recommended bit for this depth |

**Pocket width formula:** `pocket_width = OD − 0.005"` (light interference fit before glue)

### Datum and Workholding
- **X datum:** Left end of rail, first pocket center at `OD/2` from end
- **Y datum:** Rail centerline (rail face up, pockets through the face)
- **Z datum (Z0):** Top surface of rail stock (use touch-off)
- **Workholding:** Double-sided tape + MDF spoilboard, or clamp tabs at rail ends

### Pocket Parameters by Member

| Member | OD (in) | Pocket Width (in) | Pocket Depth (in) | Pocket Length (in) | Pitch C-C (in) | First Center (in) | # Pockets |
|---|---|---|---|---|---|---|---|
| Toyo | 1.000 | 0.995 | 0.333 | 1.5 | 1.063 | 0.500 | 13 |
| Zanka | 0.821 | 0.816 | 0.274 | 1.5 | 0.884 | 0.411 | 13 |
| Malta | 0.658 | 0.653 | 0.219 | 1.5 | 0.721 | 0.329 | 13 |
| Chili | 0.493 | 0.488 | 0.164 | 1.5 | 0.556 | 0.247 | 13 |

**Pocket depth formula:** `pocket_depth = OD / 3` (tube sits 1/3 deep in rail)  
**Pocket pitch formula:** `pitch = OD + 1/16"` (1/16" clearance gap between tubes)

### G-code Notes (Vectric / Fusion 360)
- Use "Pocket" toolpath strategy, not Profile
- Set stock-to-leave = 0.005" on first pass for all members except Chili (cut to final in one pass due to small feature size)
- Climb milling preferred for final pass in cherry/walnut
- Post-process: Mach3 or equivalent; check safe Z height ≥ 1.5" above stock

### Release Checks (Before Running)
- [ ] Touch-off Z0 on fresh stock surface (not previous part)
- [ ] Verify pocket width against first pocket with calipers before continuing
- [ ] Confirm tube drops in with light resistance (not loose, not requiring force)
- [ ] Measure pitch on first two pockets; confirm C-C matches spec ±0.005"

---

## §2 — Drill Press: Tube Boring (Malta, Chili)

### Applicable Members
- Malta: bore ID 0.500", OD 0.658", wall 0.079"
- Chili: bore ID 0.375", OD 0.493", wall 0.059"

### Context
Only needed when sourcing hardwood blanks (maple, boxwood, bamboo without natural bore). Pre-bored PVC or bamboo tubes skip this operation entirely. Confirm bore before ordering.

### Setup
- **Machine:** Drill press with V-block fixture clamped to table
- **Bit type:** Brad-point or Forstner, matched to bore ID
- **Bit diameter:** 1/2" (Malta), 3/8" (Chili)
- **Speed:** 1,200–1,500 RPM (brad-point in hardwood); 800–1,000 RPM (Forstner)
- **Depth stop:** Set to tube length + 1/16" through clearance

### V-Block Fixture
- Commercial steel V-block or CNC-routed plywood V-block
- V-angle: 90° (centers round stock automatically)
- Clamp blank firmly; check alignment with a reference rod before drilling
- For tubes ≤ 6": single clamp mid-point. For tubes 6–11": two clamps, 1/4 and 3/4 positions

### Bore Sequence (per tube)
1. Center-punch both ends on lathe or drill press to mark bore centerline
2. Pilot drill: 1/8" through full length first (minimizes wander)
3. Step up in two stages: 1/4" → target bore diameter
4. Blow chips; verify bore with go/no-go gauge or caliper at 3 depths (entry, mid, exit)

### Release Checks
- [ ] Bore ID measures within +0.000" / −0.010" of target
- [ ] No taper (entry vs. exit within 0.005")
- [ ] No surface cracks at bore entry

---

## §3 — Lathe: Deep Bore Drilling (Zanka)

### Applicable Member
- Zanka: bore ID 0.625", OD 0.821", wall 0.098", tubes to 16.961" long

### Setup
- **Machine:** Metal or wood lathe with 4-jaw independent chuck
- **Chuck:** 4-jaw independent (required for repeatability)
- **Tailstock:** Drill chuck in tailstock
- **Bit:** 5/8" brad-point or reduced-shank twist drill (HSS)
- **Speed:** 600–800 RPM
- **Feed:** Hand-advance; pecking cycle every 1/2" travel to clear chips

### 4-Jaw Chuck Setup
1. Mount blank between centers first to check runout (≤0.003" acceptable)
2. Transfer to 4-jaw chuck; indicate bore centerline mark
3. Adjust until center-punch mark runs within 0.005" TIR

### Bore Sequence
1. Face both ends square on lathe
2. Center-drill tailstock end (A1 drill or combination drill)
3. Pilot drill: 1/4" × full depth
4. Step: 1/2" × full depth (two passes if tube > 12")
5. Final bore: 5/8" × full depth (use steady rest if available for tubes > 12")
6. De-burr both ends; verify bore with caliper at 3 points

### Release Checks
- [ ] Chuck alignment verified before each tube size change
- [ ] Bore ID: 0.615"–0.625" (tolerance −0.010"/+0.000")
- [ ] OD concentric with bore: check wall thickness at 4 compass points, variance ≤ 0.010"

---

## §4 — Headstock-Driven Deep Bore (Toyo)

### Applicable Member
- Toyo: bore ID 0.750", OD 1.000", wall 0.125", tubes to 22.646" long

### Context
At 22.6" depth with 3/4" bore, the drill wanders significantly if advanced from the tailstock in the conventional direction. The headstock-driven technique reverses the setup: the drill bit spins in the headstock Jacobs chuck, and the blank is advanced toward it by a carrier jig mounted in the tailstock. This eliminates drill flex entirely on long bores.

### Setup
- **Machine:** Lathe, 24"+ between-centers capacity
- **Headstock:** 3/4" bit in Jacobs chuck mounted to headstock spindle (run in forward)
- **Tailstock carrier:** Custom wooden or metal V-block carrier that accepts the tube blank; slides along ways
- **Bit:** 3/4" brad-point (HSS), shank ground to fit Jacobs chuck
- **Speed:** 400–600 RPM (lower than tailstock-advance due to blank length vibration risk)

### Carrier Jig Specification
- Material: 1-1/4" aluminum or hardwood block
- V-groove: 90°, depth = OD/2 (captures tube blank)
- Length: 4" (provides stable bearing surface)
- Clamping: Thumb screw + soft jaw (nylon or brass) to not mar tube
- Register: Index pin at tailstock quill → carrier centers on lathe axis

### Bore Sequence
1. Square both tube ends on lathe
2. Mark bore centerline on tailstock end with center punch
3. Mount bit in headstock chuck; set speed to 400 RPM
4. Load blank in carrier; align center punch to bit tip
5. Advance carrier 1/2" per peck; retract to clear chips after each peck
6. Watch for heat build-up (smoke → stop, cool, add paste wax to bit flutes)
7. Final 1" of advance: reduce speed to 300 RPM
8. Full retract; verify bore with 3/4" dowel gauge

### Release Checks
- [ ] Carrier jig alignment confirmed with 12" test rod before boring
- [ ] First tube bored is a sacrificial blank (knot-free scrap, same OD)
- [ ] Bore ID: 0.740"–0.750" (tolerance −0.010"/+0.000")
- [ ] Wall thickness check at 4 points, variance ≤ 0.015"
- [ ] No breakthrough (check by illuminating with flashlight at entry end)

---

## §5 — Drill Press: Sealing Stand Fabrication

### Purpose
Build 4 plywood stands (one per family member) to hold tubes vertically during beeswax plug curing.

### Stand Specifications

| Member | Stand Size | Hole Diam. | # Holes | Hole Spacing | Material |
|---|---|---|---|---|---|
| Toyo | 6" × 14" | 1.010" | 13 | 1.063" C-C | 3/4" plywood |
| Zanka | 5" × 12" | 0.831" | 13 | 0.884" C-C | 3/4" plywood |
| Malta | 4" × 10" | 0.668" | 13 | 0.721" C-C | 1/2" plywood |
| Chili | 3" × 8" | 0.503" | 13 | 0.556" C-C | 1/2" plywood |

**Hole diameter** = tube OD + 0.010" (light clearance, tube must stand plumb without tipping)

### Drill Press Setup
- Layout holes with marking gauge; verify first spacing before drilling all 13
- Forstner bits preferred (flat-bottom hole is not necessary but prevents tube wobble)
- Back with sacrificial scrap to prevent tearout on exit
- Label each stand with member ID and hole diameter in permanent marker

### Release Checks
- [ ] Test tube stands plumb in first hole (leaning > 2° → enlarge hole 0.005")
- [ ] All 13 tubes fit without binding

---

## §6 — Tube Length Marking

### Bamboo Builds (Story Stick Method)
- **Story stick material:** 1/4" × 1" MDF strip, 25" long
- **Per family member:** one stick (do not combine members on one stick)
- Mark tube positions from the closed (bottom) end
- Label each mark: e.g., "Z-A1 16.961" G3" (member-rankTube length note)
- Score marks with marking knife; over-mark with fine Sharpie
- Store sticks with the packet (laminate if possible)

### PVC Builds (Digital Stop Method)
- Set miter saw digital stop or digital caliper fence to target L_cut value
- Sequence: longest → shortest (one fence re-set per tube rather than re-set per cut)
- Call out each measurement before cutting; second operator confirms
- After each cut: measure with calipers; record actual in validation.csv

### Common Release Checks (Both Methods)
- [ ] Verify story stick / stop against independent tape measure before first cut
- [ ] First tube of each member cut 1/32" long; measure, then bring to final length
- [ ] No cuts made without label visible on tube

---

## §7 — Miter Saw + File: Tuning Trim

### Context
After first-pass tuning, tubes that measure flat need material removed from the open (top) end to raise pitch. This is the only irreversible operation in the build — cut less than you think you need.

### Protocol
1. Play tube into chromatic tuner; record cents error in validation.csv
2. Compute trim length: `ΔL ≈ cents_flat × (L_tube / 1200)` (approximate; empirical trim is more accurate)
3. For trim > 1/16": mark with blue tape on tube; cut at miter saw (80T fine-tooth blade)
4. For trim ≤ 1/16": use fine file + engineer's square; remove material in 2–3 passes
5. After each pass: sand end flat on 320-grit paper on glass; re-measure tuning
6. Re-record in validation.csv; circle measurements to distinguish retrim entries

### Miter Saw Setup
- Fence set square; verify with engineer's square before first cut
- 80-tooth ATB blade (or higher); clean teeth before use
- Light downfeed pressure; let the blade do the work
- For bamboo: back-cut method (score from two sides) to prevent node splitting

### Release Checks
- [ ] Each trimmed tube: final measurement within ±5 cents of target
- [ ] No tube trimmed more than 3/16" below L_calc (over-trimmed → scrap or Chili-prototype downgrade)
- [ ] validation.csv updated same session as trim

---

## Datum Reference Summary

| Machine | X0 | Y0 | Z0 |
|---|---|---|---|
| CNC Router (rails) | Left rail end | Rail centerline | Top surface of stock |
| Drill Press (V-block) | V-block center | Table surface | Drill tip at touch-off |
| Lathe (Zanka) | Chuck face | Spindle centerline | — |
| Lathe (Toyo headstock) | Headstock chuck face | Spindle centerline | — |
| Miter Saw | Fence face | Blade centerline | Table surface |

---

## Pre-Run Checklist (All Operations)

- [ ] Verify `family-spec.csv` is open and correct member row is active
- [ ] Tube OD measured with calipers within 24 hours of operation (bamboo varies with humidity)
- [ ] Appropriate PPE: dust mask (wood routing/drilling), safety glasses (all operations)
- [ ] Chip/dust clearance: air blast available; not just shop vac (chips pack in deep bores)
- [ ] First piece is always a test piece — measure before committing production stock
