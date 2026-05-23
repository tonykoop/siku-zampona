(* ============================================================
   Siku (Zampoña) — Wolfram Starter  (v4.3 packet entry point)
   ============================================================
   This file is the v4.3 Tier-1 siku-zampona-starter.wl stub.
   The full interactive model is in wolfram/siku-zampona-wolfram-model.wl.

   To open the full notebook:
     Get["wolfram/siku-zampona-wolfram-model.wl"]

   Or navigate to the wolfram/ directory and open wolfram/siku-zampona-wolfram-model.wl
   in Mathematica / Wolfram Desktop / Wolfram Player.

   Quick sanity check (copy-paste into a Mathematica cell):
*)

(* Speed of sound, end-correction convention *)
cInPerSec    = 13552.0;
endCorrCoeff = 0.82;

(* Tube length formula *)
tubeLength[f_?NumericQ, bore_?NumericQ] :=
  cInPerSec / (4.0 * f) - endCorrCoeff * bore;

(* MIDI → Hz *)
midiToHz[midi_] := 440.0 * 2^((midi - 69) / 12.0);

(* Sanity checks *)
Print["A4 = ", midiToHz[69], " Hz (expect 440.0)"];
Print["Zanka A4 tube length = ",
  N[tubeLength[440.0, 0.625], 4], "\" (expect ~7.188)"];

(* Load full model *)
(* Get[NotebookDirectory[] <> "wolfram/siku-zampona-wolfram-model.wl"]; *)
