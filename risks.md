# Siku (Zampoña) — Risks

**Instrument:** Siku / Zampoña (Andean Panpipe Family)  
**Packet:** v4.3 · Date: 2026-05-08  
**Format:** Risk ID · Category · Description · Severity (H/M/L) · Likelihood (H/M/L) · Verification test

---

## Acoustic Risks

### AC-01 — Bore Diameter Variance in Bamboo

**Risk:** Natural bamboo bore varies ±0.030"–0.050" along the tube length. If the bore near the open end differs from the bore used in length calculation, the effective end correction shifts and the tube plays out of tune.  
**Severity:** H · **Likelihood:** H (bamboo is always variable)  
**Mitigation:** Measure bore ID at the blow end of each tube with calipers. Recalculate L_physical with the actual measured bore before cutting. Record in `validation.csv` `VAL-BORE-01` through `VAL-BORE-04`.  
**Test:** Measure 3 random tubes per size class before cutting any tube. If variance > ±0.020", recalculate all cut lengths with the measured bore.

---

### AC-02 — Temperature / Humidity Tuning Drift

**Risk:** Speed of sound changes with temperature. A 10°F shift ≈ 1.8 cents. A bamboo instrument stored outdoors in Andean conditions can shift by 15–20 cents from indoor calibration.  
**Severity:** M · **Likelihood:** M  
**Mitigation:** Final tuning trim should be performed at the intended playing temperature. Note shop temperature and RH in every `validation.csv` row.  
**Test:** Re-measure a reference tube (Zanka Arka 5, A4) at two temperatures: shop temp and 55°F. If difference > 5 cents, add a note to the README about re-tuning before performance.

---

### AC-03 — Cork Plug Acoustic Penalty

**Risk:** If cork plugs are used instead of beeswax or bamboo nodes, the less-reflective closed end shifts pitch flat by 5–10 cents (estimated). This affects all tubes equally but means the design table lengths will not be accurate for cork-plugged instruments.  
**Severity:** M · **Likelihood:** L (if builder follows beeswax recommendation)  
**Mitigation:** Use beeswax or bamboo node for closed end. If cork is used, add ~1/16" to each tube length and re-verify with tuner.  
**Test:** Build one Zanka Arka 5 (A4) with a cork plug and measure. Compare to beeswax plug version. Document the delta and add it to `design.md` Section 4.4 if significant.

---

### AC-04 — Chili Arka 7 (F#6) Below Practical Embouchure Length

**Risk:** The Chili Arka 7 (F#6 at 1479 Hz) calculates to 1.982" physical length (50 mm). Traditional panpipe makers consider ~50 mm the practical minimum; many builder references suggest the lowest limit for reliable tone production is 45–60 mm. Tubes this short require very precise embouchure angle and produce thin, breathy tone with embouchure sensitivity 2× higher than longer tubes.  
**Severity:** H · **Likelihood:** M  
**Mitigation:** Build and prototype this tube alone before committing to a full Chili build. If unplayable, omit Arka 7 (11-tube Chili) or substitute a half-step flat at a playable length.  
**Test:** Cut and seal a single F#6 Chili tube at 2.169" (L_cut). Attempt to produce a clear tone. If consistent tone requires extreme embouchure control or is unreliable, flag as "omit" and update `family-spec.csv` notes.

---

### AC-05 — End Correction Model Accuracy

**Risk:** The end correction `ΔL = 0.82 × bore_ID` is a dimensional approximation (empirically derived). The standard physics value is `ΔL = 0.6 × r` (unflanged) = `0.3 × d`, or `0.85 × r` (flanged) = `0.425 × d`. Tony's convention uses `0.82 × d` (diameter), which is ~2× the physics value. This likely bundles empirical embouchure effects; its accuracy for this instrument family has not been validated.  
**Severity:** M · **Likelihood:** M  
**Mitigation:** The 3/16" trim allowance covers this uncertainty. After first prototype, measure the actual trim removed from each tube and compute the actual effective end correction. Add to `design.md` as an empirical correction once ≥7 data points are available.  
**Test:** For the first Zanka build, record `L_cut` (before trim) and `L_final` (after trim) for all 13 tubes. Compute actual `ΔL_actual = L_calc - L_final` and compare to `0.82 × bore = 0.5125"`. If mean deviation > 0.100", update the end-correction coefficient in the design table.

---

## Structural Risks

### ST-01 — Frame Rail Pocket Splitting Under Cord Tension

**Risk:** CNC tube pockets reduce the rail cross-section between pockets to `gap / 2 = 1/32"` of solid wood. Under cord binding tension, inter-pocket walls in cherry may split along the grain.  
**Severity:** H · **Likelihood:** L (cherry is tough; cord tension is low)  
**Mitigation:** Ensure pocket depth ≤ 1/3 OD (not 1/2). Keep cord tension moderate — decorative binding, not structural clamp. If pocket walls are undersized, add a 1/8" solid wood strip glued between every 3rd pocket.  
**Test:** After glue-up, inspect rail under 10× magnification at each inter-pocket wall. No hairline cracks acceptable. If present, apply thin CA glue as stabilizer before cord wrapping.

---

### ST-02 — Toyo Arka 1 (22.6") Long-Tube Sag

**Risk:** A 22.6" bamboo tube with 1.0" OD and 0.125" wall is relatively slender. If the tube is not fully supported along its length, the weight of the tube itself can deflect it out of the pocket under playing tension. This can cause a buzzing rattle.  
**Severity:** M · **Likelihood:** L  
**Mitigation:** Use full-depth glue-bond at both rails for Toyo Arka 1 specifically. Add a third intermediate cord wrap at the midpoint of the longest 3 tubes.  
**Test:** Gently tap the assembled Toyo arka along each tube. No buzzing or rattle should be heard. Confirm tube is firmly seated in both rail pockets.

---

### ST-03 — Beeswax Plug Creep at Elevated Temperature

**Risk:** Beeswax melts at ~145°F. In direct sunlight inside a car, instrument temperature can exceed 120°F. Wax may soften, allowing the plug to migrate toward the open end under gravity, effectively lengthening the air column and flattening pitch.  
**Severity:** M · **Likelihood:** M (depends on storage habits)  
**Mitigation:** Store instrument in a case; never in direct sunlight. Alternatively, use wood dowel plugs for instruments intended for outdoor/travel use.  
**Test:** Place a wax-plugged tube in a 130°F oven for 30 minutes. Measure plug position before and after. If plug has migrated more than 1/16", switch to wood dowel plugs.

---

## Ergonomic Risks

### ER-01 — Toyo Bass Arm Span at 13.75" Frame Width

**Risk:** The Toyo frame is 13.75" wide with all 13 tubes. In traditional Andean play, one player holds only 7 tubes (the arka rank) = 7 × 1.000" + 6 × 0.063" = 7.375" + 0.375" = 7.75" wide arka rank. That is fine. But if someone attempts to hold the full 13-tube Toyo as a single instrument, 13.75" exceeds comfortable one-hand span for most adults.  
**Severity:** L (by design, split into arka + ira)  
**Likelihood:** L  
**Mitigation:** Document clearly in README and assembly manual that this is a split instrument — arka and ira are separate ranks. Do not bind all 13 Toyo tubes into one frame unless intentionally making a "concert" single-player Toyo.  
**Test:** Build arka (7-tube) and ira (6-tube) as separate bound ranks. Confirm each fits comfortably in one hand.

---

### ER-02 — Chili High-Register Breath Pressure Requirements

**Risk:** Very short soprano tubes (Ira 6, E6 = 2.262") require significantly higher breath velocity than bass tubes to excite a tone. A player switching rapidly between Toyo and Chili in an ensemble may struggle with breath pressure transitions.  
**Severity:** L · **Likelihood:** M (pedagogical concern, not build failure)  
**Mitigation:** Document in README that the 4-size ensemble is intended as distinct instruments for different players, not typically played simultaneously by one person. Provide an embouchure guide in the learn-to-play notes.  
**Test:** Play all 13 tubes of the Chili from Arka 1 to Ira 6 in a single breath sequence. All tubes should produce a clear tone with consistent embouchure pressure adjustment. If Ira 6 or Arka 7 cannot be reliably played, flag for omission.

---

## Supply Chain Risks

### SC-01 — Andean Bamboo Cañahueca Difficult to Source Outside South America

**Risk:** Traditional cañahueca bamboo (*Guadua chacoensis*) may not be available from US suppliers in the specified bore diameters. Most US bamboo suppliers stock Asian bamboo species (Moso, Tonkin) which have different wall-to-bore ratios.  
**Severity:** M · **Likelihood:** H  
**Mitigation:** PVC Schedule 40 is an adequate substitute for all size classes. Tonkin arrow shaft bamboo is acceptable for Malta and Chili. See `sourcing.csv` for verified alternatives. Note the bore diameter difference if substituting PVC and recalculate cut lengths.  
**Test:** Verify at least one alternative supplier can ship within 2 weeks before starting build. If no bamboo available in spec, proceed with PVC prototype and note in README.

---

### SC-02 — Cherry Frame Stock Grain Quality

**Risk:** Cheap cherry lumber may have wavy grain or short grain that crosses the tube pocket walls, causing split-out during pocket routing.  
**Severity:** M · **Likelihood:** L  
**Mitigation:** Inspect cherry stock for straight grain running parallel to rail length. Use FAS-grade lumber.  
**Test:** Pre-route a test pocket in the leftover cherry cutoff before routing the actual rail. Inspect for tearout. If tearout is severe, switch to walnut (tighter grain) or increase bit sharpness/reduce feed rate.

---

## Fit and Finish Risks

### FF-01 — PVC / Bamboo OD Inconsistency Causing Loose Pockets

**Risk:** If the tube OD is smaller than the CNC pocket width, the tube will be loose in the pocket and may rattle or rotate.  
**Severity:** M · **Likelihood:** M (especially if mixing tube sources)  
**Mitigation:** Measure actual OD of every tube with calipers. Set CNC pocket width to the measured mean OD − 0.005" for a light press fit.  
**Test:** Dry-fit all tubes before gluing. Each tube should require light finger pressure to seat, and should not fall out when the rail is inverted.

---

### FF-02 — Beeswax Plug Flush with Tube End

**Risk:** If the wax plug is not flush with the tube bottom end, the instrument appears unfinished and the tube will not sit level in the frame pocket.  
**Severity:** L · **Likelihood:** M  
**Mitigation:** After wax cures, trim any overpour flush with a sharp chisel. Sand level.  
**Test:** Visual inspection — no wax should protrude below the tube end. Place tube on a flat surface — it should not rock.
