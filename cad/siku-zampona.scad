// Siku (Zampoña) parametric master — two-rank closed-pipe tube envelope.
//
// Authority: pending_measurement. NOT fabrication authority until reviewed
// against a measured/built prototype (see visual-output-register.csv and
// build-packet-status.md — cad/ row is "partial").
//
// Dimension sources (do not edit values without updating the source record):
//   - member selection (bore/wall/OD/frame width/root pitch): family-spec.csv
//     columns bore_id_in, wall_in, od_in, frame_width_in, root_hz, root_note.
//   - governing model (closed/stopped cylindrical pipe, quarter-wave):
//     design.md §2.1 "Stopped Pipe":
//       f = c / (4 * L_eff)
//       L_eff = L_physical + ΔL_end,  ΔL_end ≈ 0.82 × bore_ID
//       => L_physical = c / (4f) - 0.82 × bore_ID
//     c = 13,552 in/s (68°F/20°C shop standard, design.md §2.1;
//     family-spec.csv column c_in_per_s). end_correction_coeff = 0.82 is
//     Tony's empirical convention (~2x the physics unflanged-end value
//     0.3*d — bundles embouchure effects; unvalidated per risks.md AC-05).
//     Cross-checked against siku-zampona-design-table.xlsx tube-length
//     formula cells (e.g. row 14: "=3388/(((2^(1/12))^(...))*440)-0.82*bore",
//     3388 = 13552/4) via inspect_instrument_workbook.py.
//   - trim allowance +0.1875 in (3/16"): family-spec.csv trim_allowance_in,
//     design.md §2.2.
//   - arka/ira semitone offset schedule: design.md §2.3
//     Arka (7 tubes): offsets [0, 4, 7, 10, 14, 17, 21] from root
//     Ira  (6 tubes): offsets [2, 5, 9, 12, 16, 19] from root
//   - tube center-to-center gap 0.0625 in: family-spec.csv tube_gap_in.
//
// Scope boundary: this is a TWO-RANK (arka + ira) tube-LENGTH ENVELOPE only.
// Each tube is modeled as a plain open/hollow cylinder at its computed
// closed-pipe length. Voicing/mouth-edge (embouchure) geometry, bottom-end
// plug/node/bevel detail, and frame-rail pocket geometry are explicitly
// OUT OF SCOPE here — no blow-edge chamfer or bevel is modeled. See
// assembly-manual.md and bom.csv for the physical sealing/binding process.
//
// Units: inches.

/* [Variant] */
// 0=Toyo (bass), 1=Zanka (tenor, primary build target per README), 2=Malta (alto), 3=Chili (soprano)
variant = 1;

member_names       = ["Toyo", "Zanka", "Malta", "Chili"];               // family-spec.csv member_id / size_class
root_notes         = ["D3", "G3", "D4", "A4"];                          // family-spec.csv root_note
root_hz_list       = [146.83, 196.00, 293.66, 440.00];                  // family-spec.csv root_hz
bore_id_in_list    = [0.750, 0.625, 0.500, 0.375];                      // family-spec.csv bore_id_in
wall_in_list       = [0.125, 0.098, 0.079, 0.059];                      // family-spec.csv wall_in
od_in_list         = [1.000, 0.821, 0.658, 0.493];                      // family-spec.csv od_in (== bore + 2*wall)
frame_width_in_list = [13.750, 11.423, 9.304, 7.159];                   // family-spec.csv frame_width_in (reference/echo check only)

root_hz     = root_hz_list[variant];
bore_id_in  = bore_id_in_list[variant];
od_in       = od_in_list[variant];

/* [Rank schedule — design.md §2.3] */
arka_offsets = [0, 4, 7, 10, 14, 17, 21]; // 7 tubes, leader/female rank
ira_offsets  = [2, 5, 9, 12, 16, 19];     // 6 tubes, follower/male rank

/* [Constants — family-spec.csv / design.md §2.1-2.2] */
c_in_per_s          = 13552;   // speed of sound, in/s, 68F shop standard
end_correction_coeff = 0.82;   // Tony's empirical closed-end correction convention
trim_allowance_in    = 0.1875; // 3/16" post-cut tuning trim, added to every physical length
tube_gap_in           = 0.0625; // center-gap between adjacent tube walls in a rank

// ---------------------------------------------------------------------------
// Derived geometry (formulas, not baked values)
// ---------------------------------------------------------------------------

function midi_free_hz(offset) = root_hz * pow(2, offset / 12); // equal-temperament offset from root_hz

// Closed/stopped cylindrical pipe: L_physical = c/(4f) - end_correction_coeff * bore_ID
function tube_length_calc_in(f) = c_in_per_s / (4 * f) - end_correction_coeff * bore_id_in;
function tube_length_cut_in(f)  = tube_length_calc_in(f) + trim_allowance_in;

function arka_hz(n)     = midi_free_hz(arka_offsets[n]);
function ira_hz(n)      = midi_free_hz(ira_offsets[n]);
function arka_len_in(n) = tube_length_cut_in(arka_hz(n));
function ira_len_in(n)  = tube_length_cut_in(ira_hz(n));

arka_count = len(arka_offsets);
ira_count  = len(ira_offsets);

// ---------------------------------------------------------------------------
// Modules
// ---------------------------------------------------------------------------

// Plain closed-pipe tube envelope: hollow cylinder, open both ends (bottom
// seal/plug is a physical assembly step — assembly-manual.md — not modeled).
module closed_tube(length_in, od_val_in, bore_val_in) {
  difference() {
    cylinder(h = length_in, d = od_val_in, $fn = 48);
    translate([0, 0, -0.01])
      cylinder(h = length_in + 0.02, d = bore_val_in, $fn = 48);
  }
}

// One rank: `count` tubes placed left-to-right (longest/lowest pitch first),
// tops flush at z=0 (the blow/open end), descending profile toward +x, per
// design.md §4.1 "Tubes align flush at the blow end (top)."
module rank(count, len_in_func) {
  for (i = [0 : count - 1]) {
    len_in = len_in_func(i);
    translate([i * (od_in + tube_gap_in), 0, -len_in])
      closed_tube(len_in, od_in, bore_id_in);
  }
}

module arka_rank() { rank(arka_count, function (n) arka_len_in(n)); }
module ira_rank()  { rank(ira_count,  function (n) ira_len_in(n)); }

// Visualization spacing between the arka and ira rows. The two ranks are
// traditionally bound/played as SEPARATE instruments (design.md §4.1); this
// gap is a layout convenience for viewing both ranks together, not a lashing
// or shared-frame spec (frame-rail geometry is out of scope — see cad/README.md).
rank_row_gap_in = 1.5; // assumption; not sourced from family-spec.csv

module siku_assembly() {
  arka_rank();
  translate([0, od_in + rank_row_gap_in, 0])
    ira_rank();
}

siku_assembly();

// Echo the tube-length schedule so `openscad` runs double as a numeric check
// against family-spec.csv (arkaN_L_cut / iraN_L_cut columns for this member).
echo(str("member=", member_names[variant], " root=", root_notes[variant],
         " root_hz=", root_hz, " bore_id_in=", bore_id_in, " od_in=", od_in));
for (n = [0 : arka_count - 1])
  echo(str("arka_", n + 1, "_hz=", arka_hz(n), " L_cut_in=", arka_len_in(n)));
for (n = [0 : ira_count - 1])
  echo(str("ira_", n + 1, "_hz=", ira_hz(n), " L_cut_in=", ira_len_in(n)));

// family-spec.csv frame_width_in is the FULL 13-tube (arka+ira combined)
// row width per design.md §4.3, not either rank alone.
total_tube_count = arka_count + ira_count;
computed_frame_width_in = total_tube_count * od_in + (total_tube_count - 1) * tube_gap_in;
echo(str("computed_13tube_frame_width_in=", computed_frame_width_in,
         " family_spec_frame_width_in=", frame_width_in_list[variant]));
