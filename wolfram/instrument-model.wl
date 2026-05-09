(* ============================================================
   Siku (Zampoña) — Wolfram Language Model Package
   Instrument: Andean Panpipe Family (Toyo · Zanka · Malta · Chili)
   Packet: v4.3 · Date: 2026-05-08
   Repo: tonykoop/siku-zampona
   ============================================================

   USAGE:
     In Wolfram Desktop: File > Open > this file, then Evaluate All.
     In wolframscript:   wolframscript -file instrument-model.wl
     In Wolfram Cloud:   paste cells into a new notebook.

   PHYSICS:
     Stopped pipe:  f = c / (4 * L_eff)
     Tube length:   L = c / (4*f) - 0.82 * bore_diameter
     Overtones:     only ODD harmonics (1f, 3f, 5f, ...)
   ============================================================ *)

(* ── 0. Package metadata ─────────────────────────────────── *)
sikuMeta = <|
  "instrument"   -> "Siku (Zampoña)",
  "family"       -> "Andean Panpipe — 4 sizes",
  "packetVersion"-> "v4.3",
  "date"         -> "2026-05-08",
  "repo"         -> "tonykoop/siku-zampona",
  "workbook"     -> "siku-zampona-design-table.xlsx",
  "license"      -> "CC BY 4.0"
|>;

(* ── 1. Physical constants ───────────────────────────────── *)
(* Speed of sound at 68°F / 20°C, Tony's shop standard *)
cInPerSec  = 13552.0;   (* in/s *)
cMetersPerS = 343.0;    (* m/s  *)

(* End-correction coefficient (Tony's convention: 0.82 × bore diameter) *)
endCorrCoeff = 0.82;

(* ── 2. Core formulas ────────────────────────────────────── *)

(* Frequency from MIDI note number (A4 = MIDI 69 = 440 Hz) *)
midiToHz[midi_] := 440.0 * 2^((midi - 69) / 12.0);

(* Physical tube length (inches) for a stopped pipe at frequency f (Hz)
   with bore diameter d (inches) *)
tubeLength[f_?NumericQ, bore_?NumericQ] :=
  cInPerSec / (4.0 * f) - endCorrCoeff * bore;

(* Inverse: frequency from physical tube length *)
tubeFreq[L_?NumericQ, bore_?NumericQ] :=
  cInPerSec / (4.0 * (L + endCorrCoeff * bore));

(* Cents error between measured and target frequency *)
centsError[measuredHz_?NumericQ, targetHz_?NumericQ] :=
  1200.0 * Log2[measuredHz / targetHz];

(* MIDI note number from semitone offset *)
rootPlusSemis[rootMidi_Integer, semis_Integer] := rootMidi + semis;

(* ── 3. Arka / Ira split definition ─────────────────────── *)
(* Arka (leader, ♀): 7 tubes — semitone offsets from root *)
arkaSemitones = {0, 4, 7, 10, 14, 17, 21};

(* Ira (follower, ♂): 6 tubes — semitone offsets from root *)
iraSemitones  = {2, 5, 9, 12, 16, 19};

(* Combined diatonic (Mixolydian) scale — sorted semitone offsets *)
combinedSemitones = Sort[Join[arkaSemitones, iraSemitones]];
(* = {0,2,4,5,7,9,10,12,14,16,17,19,21} — D Mixolydian when root=D *)

(* ── 4. Family specification ─────────────────────────────── *)
(* Each member: <| name, siku key, root MIDI, bore (in), wall (in) |> *)
sikuFamily = {
  <| "name" -> "Toyo",  "siku_key" -> "G3", "root_midi" -> 38,
     "bore" -> 0.750, "wall" -> 0.125, "od" -> 1.000 |>,
  <| "name" -> "Zanka", "siku_key" -> "C4", "root_midi" -> 43,
     "bore" -> 0.625, "wall" -> 0.098, "od" -> 0.821 |>,
  <| "name" -> "Malta", "siku_key" -> "G4", "root_midi" -> 50,
     "bore" -> 0.500, "wall" -> 0.079, "od" -> 0.658 |>,
  <| "name" -> "Chili", "siku_key" -> "D5", "root_midi" -> 57,
     "bore" -> 0.375, "wall" -> 0.059, "od" -> 0.493 |>
};

(* Helper: generate all 13 tube lengths for a family member *)
memberTubeLengths[member_Association] := Module[
  {root = member["root_midi"], bore = member["bore"],
   arkaLengths, iraLengths},
  arkaLengths = Table[
    tubeLength[midiToHz[root + s], bore],
    {s, arkaSemitones}];
  iraLengths = Table[
    tubeLength[midiToHz[root + s], bore],
    {s, iraSemitones}];
  <| "arka" -> arkaLengths, "ira" -> iraLengths,
     "all"  -> Join[arkaLengths, iraLengths] |>
];

(* Compute and store tube lengths for all 4 members *)
allLengths = Association[
  #["name"] -> memberTubeLengths[#] & /@ sikuFamily
];

(* ── 5. Tube-length table printout ──────────────────────── *)
Print["=== Siku (Zampoña) — Tube Length Tables ==="];
Print["  c = ", cInPerSec, " in/s   end-correction coeff = ", endCorrCoeff];
Print["  Formula: L = c/(4f) - ", endCorrCoeff, " × bore_ID"];
Print["  Trim allowance: +3/16\" added in L_cut"];
Print[];

Do[
  member = sikuFamily[[i]];
  lengths = allLengths[member["name"]];
  Print["── ", member["name"], " (", member["siku_key"], " key) ──"];
  Print["   Bore: ", member["bore"], "\"   OD: ", member["od"], "\""];
  Table[
    Print["   Arka ", j, ": ",
      midiToHz[member["root_midi"] + arkaSemitones[[j]]] // N // Round[#, 0.01]&, " Hz  ",
      "L_calc=", N[lengths["arka"][[j]], 5], "\"  ",
      "L_cut=",  N[lengths["arka"][[j]] + 3/16, 5], "\""],
    {j, 1, 7}];
  Table[
    Print["   Ira  ", j, ": ",
      midiToHz[member["root_midi"] + iraSemitones[[j]]] // N // Round[#, 0.01]&, " Hz  ",
      "L_calc=", N[lengths["ira"][[j]], 5], "\"  ",
      "L_cut=",  N[lengths["ira"][[j]] + 3/16, 5], "\""],
    {j, 1, 6}];
  Print["   Longest: ", N[Max[lengths["all"]], 5], "\"   Shortest: ",
    N[Min[lengths["all"]], 5], "\""];
  Print[],
  {i, 1, 4}
];

(* ── 6. Sanity check: A4 = 440 Hz ──────────────────────── *)
Print["=== Sanity checks ==="];
Print["midiToHz[69] = ", midiToHz[69], " Hz  (expected 440.0)"];
Print["tubeLength[440, 0.625] = ",
  N[tubeLength[440.0, 0.625], 5],
  "\"  (Zanka Arka 5 — expected 7.188\")"];
Print["tubeFreq[7.188, 0.625] = ",
  N[tubeFreq[7.188, 0.625], 5],
  " Hz  (expected ~440 Hz)"];
Print[];

(* ── 7. Interactive tube-length explorer (Manipulate) ───── *)
(* Run in Wolfram Desktop or Cloud for interactive controls *)

tubeExplorer = Manipulate[
  Module[{rootHz, arkaLens, iraLens, allLens, frameWidth},
    rootHz   = 440.0 * 2^((rootMidi - 69) / 12.0);
    arkaLens = tubeLength[rootHz * 2^(#/12), bore] & /@ arkaSemitones;
    iraLens  = tubeLength[rootHz * 2^(#/12), bore] & /@ iraSemitones;
    allLens  = Join[arkaLens, iraLens];
    frameWidth = 13 * (bore + 2 * wall) + 12 * 0.0625;

    Column[{
      Row[{"Root: ", Quantity[N[rootHz, 4], "Hertz"],
           "   Bore: ", bore, "\"   OD: ", bore + 2*wall, "\""}],
      Row[{"Frame width: ", N[frameWidth, 4], "\"   ",
           "Longest: ", N[Max[allLens], 4], "\"   ",
           "Shortest: ", N[Min[allLens], 4], "\""}],

      (* Tube array diagram — arka in blue, ira in orange *)
      Graphics[{
        (* Arka tubes (blue) *)
        MapIndexed[{RGBColor[0.2, 0.45, 0.7],
          Rectangle[{(#2[[1]] - 1) * (bore + 2*wall + 0.0625), 0},
                    {(#2[[1]] - 1) * (bore + 2*wall + 0.0625) + (bore + 2*wall), #1}]
          } &, arkaLens],
        (* Ira tubes (orange) *)
        MapIndexed[{RGBColor[0.9, 0.55, 0.1],
          Rectangle[{(#2[[1]] + 6) * (bore + 2*wall + 0.0625), 0},
                    {(#2[[1]] + 6) * (bore + 2*wall + 0.0625) + (bore + 2*wall), #1}]
          } &, iraLens],
        (* Labels *)
        MapIndexed[{Black, FontSize -> 7,
          Text[Style["A" <> ToString[#2[[1]]], 7],
               {(#2[[1]] - 1) * (bore + 2*wall + 0.0625) + (bore + 2*wall)/2,
                #1 + 0.3}]} &, arkaLens],
        MapIndexed[{Black, FontSize -> 7,
          Text[Style["I" <> ToString[#2[[1]]], 7],
               {(#2[[1]] + 6) * (bore + 2*wall + 0.0625) + (bore + 2*wall)/2,
                #1 + 0.3}]} &, iraLens]
      },
      ImageSize -> {500, 250},
      PlotRange -> {{-0.2, frameWidth + 0.5}, {-0.5, Max[allLens] + 1}},
      Frame -> True,
      FrameLabel -> {{"Length (in)", None}, {"Tube position", None}},
      PlotLabel -> Style["Arka (blue) + Ira (orange) — tube array", 11]
      ]
    }]
  ],
  {{rootMidi, 43, "Root MIDI (G3=43, D4=50, A4=57)"}, 36, 60, 1, Appearance -> "Labeled"},
  {{bore, 0.625, "Bore ID (in)"}, 0.375, 0.75, 0.0625, Appearance -> "Labeled"},
  {{wall, 0.098, "Wall thickness (in)"}, 0.059, 0.125, 0.001, Appearance -> "Labeled"},
  ControlPlacement -> Top,
  SaveDefinitions -> True
];

(* ── 8. Odd-harmonic spectrum visualization ─────────────── *)
(* Stopped pipe: only odd harmonics 1f, 3f, 5f, 7f *)
harmonicSpectrum[fundamental_?NumericQ, nHarmonics_Integer : 7] :=
  Table[{(2k - 1) * fundamental, 1.0 / (2k - 1)}, {k, 1, nHarmonics}];

(* Example: Zanka Arka 1 (G3 = 196 Hz) *)
zankaArka1Spectrum = harmonicSpectrum[196.0];

spectrumPlot = BarChart[
  zankaArka1Spectrum[[;; , 2]],
  ChartLabels -> (ToString[Round[#]] <> " Hz" & /@ zankaArka1Spectrum[[;; , 1]]),
  AxesLabel -> {"Harmonic (odd only)", "Relative amplitude"},
  PlotLabel -> Style["Stopped-pipe odd-harmonic spectrum — Zanka G3 (196 Hz)", 11],
  ChartStyle -> RGBColor[0.2, 0.45, 0.7],
  ImageSize -> 450
];

(* ── 9. AudioGenerator preview ──────────────────────────── *)
(* Play a stopped-pipe-like tone: fundamental + odd harmonics *)
sikuTone[fundamental_?NumericQ, duration_: 2.0] :=
  Sound[
    SoundNote[Null, duration,
      SampledSoundFunction[
        Function[t,
          Sum[Sin[2 Pi (2k - 1) fundamental t] / (2k - 1), {k, 1, 5}] / 2.5
        ], 44100, duration
      ]
    ]
  ];

(* Preview: Zanka Arka 1 (G3), Ira 1 (A3), then both together *)
zankaArka1Preview = sikuTone[196.0];
zankaIra1Preview  = sikuTone[220.0];

(* Arka/Ira hocketing sequence — alternate every 0.4 s *)
hocketingDemo = Sound[
  Join @@ Table[
    {SoundNote[Null, 0.4,
       SampledSoundFunction[Function[t, Sin[2 Pi f t]], 44100, 0.4]]},
    {f, {196.0, 220.0, 246.94, 261.63, 293.66, 329.63, 349.23,
         392.00, 440.00, 493.88, 523.25, 587.33, 659.26}}
  ]
];

(* ── 10. Validation plot — predicted vs measured ─────────── *)
(* After prototype: load measured data from validation.csv and plot *)
(* Placeholder: replace with Import["../validation.csv"] after first build *)

validationPlaceholder = Graphics[{
  Text[Style["Validation data not yet available.\nComplete first prototype build\nand fill validation.csv.", 14],
       {0.5, 0.5}]
}, ImageSize -> 400, Frame -> True,
   PlotLabel -> "Predicted vs. Measured Hz — Zanka"];

(* ── 11. Cultural timeline ───────────────────────────────── *)
(* Requires Wolfram 13+ for TimelinePlot *)
sikuTimeline = TimelinePlot[{
  Labeled[Interval[{Quantity[-1500, "Years"], Quantity[-1000, "Years"]}],
          "Pre-Columbian siku (Tiwanaku culture, Bolivia)"],
  Labeled[Interval[{Quantity[-1000, "Years"], Quantity[-500, "Years"]}],
          "Nazca/Huari panpipe variants (Peru)"],
  Labeled[Interval[{Quantity[-500, "Years"], Quantity[1532, "CommonEra"]}],
          "Inca empire — siku in regional ceremonies"],
  Labeled[Interval[{Quantity[1532, "CommonEra"], Quantity[1900, "CommonEra"]}],
          "Colonial period — Spanish zampoña naming"],
  Labeled[Interval[{Quantity[1900, "CommonEra"], Quantity[1980, "CommonEra"]}],
          "Folk revival; ethnomusicology (Turino, Baumann)"],
  Labeled[Interval[{Quantity[1980, "CommonEra"], Quantity[2026, "CommonEra"]}],
          "Contemporary: New Age, world music, workshop builds"]
},
PlotLabel -> "Siku / Zampoña Historical Timeline",
ImageSize -> 600
];

(* ── 12. Geographic context ─────────────────────────────── *)
(* Requires GeoGraphics context — shows Aymara/Quechua altiplano region *)
sikuGeoMap = GeoGraphics[{
  GeoMarker[GeoPosition[{-16.5, -68.2}],  (* La Paz, Bolivia *)
            Tooltip["La Paz, Bolivia — center of Aymara siku tradition"]],
  GeoMarker[GeoPosition[{-15.8, -70.0}],  (* Puno, Peru *)
            Tooltip["Puno, Peru — Lake Titicaca siku tradition"]],
  GeoMarker[GeoPosition[{-16.4, -71.5}],  (* Arequipa, Peru *)
            Tooltip["Arequipa, Peru — coastal siku variants"]],
  GeoStyling["StreetMap"]
},
GeoRange -> {{-24, -8}, {-78, -58}},
ImageSize -> 400,
PlotLabel -> "Siku cultural geography — Andean altiplano"
];

(* ── 13. Tube-length sensitivity analysis ───────────────── *)
(* How much does bore variance shift the A4 Zanka Arka 5 tube length? *)
boreVarianceAnalysis = Plot[
  tubeLength[440.0, boreD] * 25.4,  (* convert to mm *)
  {boreD, 0.575, 0.675},
  AxesLabel -> {"Bore diameter (in)", "Tube length (mm)"},
  PlotLabel -> Style["Zanka Arka 5 (A4=440 Hz) — tube length vs bore diameter", 10],
  PlotStyle -> {Thick, RGBColor[0.2, 0.45, 0.7]},
  Epilog -> {Red, Dashed,
    Line[{{0.625, 0}, {0.625, 250}}],
    Text["Nominal bore\n0.625\"", {0.630, 175}]},
  ImageSize -> 400
];

(* ── 14. Temperature-pitch sensitivity ──────────────────── *)
tempPitchSensitivity = Plot[
  (centsError[
    tubeFreq[tubeLength[440.0, 0.625], 0.625] *
      Sqrt[(tempF - 32)/1.8/100 + 273.15] / Sqrt[(68 - 32)/1.8/100 + 273.15],
    440.0
  ]),
  {tempF, 50, 90},
  AxesLabel -> {"Shop temperature (°F)", "Cents error vs 68°F calibration"},
  PlotLabel -> Style["Zanka A4 — pitch drift with temperature", 10],
  GridLines -> Automatic,
  PlotStyle -> {Thick, RGBColor[0.9, 0.4, 0.2]},
  Epilog -> {Black, Dashed, Line[{{68, -15}, {68, 15}}],
             Text["68°F reference", {72, 10}]},
  ImageSize -> 400
];

(* ── 15. Notebook entry point ────────────────────────────── *)
(* Uncomment to create a Wolfram notebook from this source: *)
(*
packetNotebook = CreateDocument[{
  TextCell["Siku (Zampoña) — Wolfram Model", "Title"],
  TextCell["Packet v4.3 · tonykoop/siku-zampona", "Subtitle"],
  TextCell["1. Tube Length Explorer", "Section"],
  ExpressionCell[tubeExplorer, "Input"],
  TextCell["2. Odd-Harmonic Spectrum (Stopped Pipe)", "Section"],
  ExpressionCell[spectrumPlot, "Input"],
  TextCell["3. Arka/Ira Hocketing Audio Preview", "Section"],
  ExpressionCell[hocketingDemo, "Input"],
  TextCell["4. Bore-Variance Sensitivity Analysis", "Section"],
  ExpressionCell[boreVarianceAnalysis, "Input"],
  TextCell["5. Temperature-Pitch Sensitivity", "Section"],
  ExpressionCell[tempPitchSensitivity, "Input"],
  TextCell["6. Cultural Timeline", "Section"],
  ExpressionCell[sikuTimeline, "Input"],
  TextCell["7. Geographic Context", "Section"],
  ExpressionCell[sikuGeoMap, "Input"]
}];
*)

Print["=== instrument-model.wl loaded successfully ==="];
Print["Available expressions:"];
Print["  tubeExplorer       — Manipulate: root key + bore → tube lengths"];
Print["  spectrumPlot       — Bar chart: stopped-pipe odd harmonics"];
Print["  hocketingDemo      — Sound: arka/ira interlocking sequence"];
Print["  boreVarianceAnalysis — Plot: bore diameter vs tube length"];
Print["  tempPitchSensitivity — Plot: temperature drift in cents"];
Print["  sikuTimeline       — TimelinePlot: cultural history"];
Print["  sikuGeoMap         — GeoGraphics: Andean altiplano region"];
Print[];
Print["Run tubeExplorer to begin interactive exploration."];
