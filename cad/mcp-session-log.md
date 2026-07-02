# CAD / MCP Session Log — siku-zampona

No external MCP or creative-tool sessions have produced artifacts in this packet as of 2026-05-29.
All SVGs in `drawings/` were generated from the design-table by prior sprint agents without an
interactive OpenSCAD MCP, Blender MCP, Illustrator MCP, or image-gen session.

When an OpenSCAD MCP, Blender MCP, or image-gen session produces or modifies a repo artifact,
add a row to the table below before committing that artifact.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
|---|---|---|---|---|---|---|---|
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | siku-zampona-design-table.xlsx, family-spec.csv | family-spec.csv, bom.csv, sourcing.csv, cut-list.csv, validation.csv | packet_refresh | fabrication | self_checked | V5 refresh pass; tabular packet data reviewed against design table; no dimension changes made. Provenance rows added to satisfy V5 fabrication-artifact logging. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | family-spec.csv, design.md §2, siku-zampona-design-table.xlsx | cad/siku-zampona.scad | cad_authoring | pending_measurement | self_checked | New parametric master: two-rank (arka 7 + ira 6) closed-pipe tube-length envelope, equation-driven (L = c/(4f) - 0.82*bore_ID per design.md §2.1). Tube lengths and combined 13-tube frame width cross-checked at render time against family-spec.csv for all 4 variants (Toyo/Zanka/Malta/Chili) — exact match. Voicing/mouth-edge geometry and frame-rail pockets out of scope. OpenSCAD render check: pass (openscad -o STL, exit 0). |
