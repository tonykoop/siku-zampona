# Siku (Zampoña) — Resources

**Packet:** v4.3 · Date: 2026-05-08

---

## Acoustic and Physics References

- **Fletcher & Rossing — *The Physics of Musical Instruments* (2nd ed., Springer, 1998):** Chapter 16 covers flute-family acoustics; Chapter 8 covers cylindrical-bore stopped pipes. The definitive reference for end-correction derivations and excitation threshold modeling.
- **Nederveen — *Acoustical Aspects of Woodwind Instruments* (1998):** Detailed tone-hole and bore-correction theory. Useful for understanding why the 0.82 × bore_diameter convention differs from the pure physics 0.3 × d value.
- **Benade — *Fundamentals of Musical Acoustics* (Oxford, 1976):** Chapter 22 discusses panpipes. Accessible treatment of stopped-pipe resonance.
- **Acústica de flautas de pan (Spanish, various authors):** Search "acústica zampoña cálculo longitud" for South American papers that present empirical tuning data for traditional cañahueca instruments. These provide useful cross-checks against the formula approach used in this packet.

---

## Ethnomusicological and Cultural Sources

- **Arnaud Gérard — "Acoustic research on pre-Columbian flutes" (various, 2010s):** Documents Nazca and Tiwanaku panpipes with measured bore and length data. Primary archaeological reference for siku instrument history.
- **Ellen Hickmann — *Musik des Altertums in Südamerika* (Laaber Verlag, 1990):** Covers archaeological finds from Peru/Bolivia including panpipes with dating evidence from 1500 BCE.
- **Thomas Turino — *Moving Away from Silence: Music of the Peruvian Altiplano and the Experience of Urban Migration* (University of Chicago Press, 1993):** Essential ethnography of siku playing in Aymara culture; explains yanantin (complementarity) and the interlocking duet tradition in cultural context. Read before writing any provenance copy for public build-log or README.
- **Max Peter Baumann — "Music in the Andean Highlands" (The World of Music, Vol. 21, 1979):** Overview of siku traditions, instrument families, and ensemble formats across Aymara/Quechua communities.
- **Wikipedia — Siku (instrument):** https://en.wikipedia.org/wiki/Siku — reasonable entry point; check primary references in footnotes before citing.

---

## Bamboo and Materials References

- **Londoño, X. et al. — Guadua chacoensis monograph (FAO, 2002):** Species description, distribution, and physical properties of cañahueca bamboo — the traditional siku tube material.
- **Janssen, J.J.A. — *Bamboo in Building Structures* (Eindhoven, 1981):** Wall thickness, culm taper, node spacing data across bamboo species. Useful for calculating bore variance expectations.
- **Archery supply catalogs (Easton, Gold Tip):** Arrow shaft diameter tables cover bamboo and carbon tubes in the 3/8"–5/8" OD range; a practical cross-reference for Malta and Chili size sourcing.

---

## Maker and Build References

- **tonykoop/transverse-flute** — https://github.com/tonykoop/transverse-flute — stopped-pipe family baseline; slip-cast bore workflow; reference for family-aware drawings.
- **tonykoop/gemshorn** — https://github.com/tonykoop/gemshorn — vessel-flute family; demonstrates `family-spec.csv` format and multi-member packet structure.
- **tonykoop/instrument-maker** — https://github.com/tonykoop/instrument-maker — parent skill and catalog.
- **panflutejedi.com:** English-language panflute-maker community with build logs and empirical bore correction data. Particularly useful thread: "Pan flute tube length calculations — what end correction factor actually works?"
- **Quena-Makers Forum (Spanish):** Similar community for South American flute makers. Empirical bore correction discussions often reference cañahueca bamboo specifically.

---

## CAD / CNC Tools

- **SolidWorks + design table workflow:** `references/solidworks-integration.md` (instrument-maker-v4 skill). Applicable for generating parametric siku tube array models.
- **OpenSCAD siku starter:** `cad/siku-openscad-starter.scad` (TBD — see `drawing-brief.md` for specifications). OpenSCAD is appropriate for a fully parametric tube-array model where root_midi, bore_id, and member_id drive all dimensions.
- **Wolfram siku model:** `wolfram/instrument-model.wl` — interactive tube length explorer, arka/ira split visualization, odd-harmonic spectrum.

---

## Provenance and Cultural Sensitivity Notes

The siku is a living cultural artifact, not simply a historical instrument. The Aymara and Quechua peoples of Bolivia and Peru continue to build and play siku in community contexts today. When documenting, publishing, or displaying this build:

1. **Attribute the tradition accurately.** Describe the instrument as "Andean Aymara/Quechua in origin" rather than generically "South American" or "Incan."
2. **Use the Aymara name *siku* (or *siku'*) as primary, with *zampoña* (Spanish) as a secondary common name.** The Aymara name is more specific and preferred in ethnomusicological writing.
3. **Do not claim cultural authenticity.** A CNC-built PVC or cherry siku is a contemporary workshop interpretation. State this clearly in the README and any public-facing documentation.
4. **Acknowledge yanantin.** The split arka/ira design is not arbitrary — it embodies a cultural philosophy of paired complementarity. Any write-up that explains the instrument without explaining yanantin is missing the point.
5. **Do not sell as "traditional" or "authentic."** The CC BY 4.0 license covers the engineering documentation, not a claim of cultural ownership.
