---
layout: page
title: Wet Granule Extrusion
description: Wet-particle DEM for granular mechanics, formulation optimization, and basket-granulation scale-up.
img: assets/img/publication_preview/wet_granular_collapse.png
importance: 2
category: industry
---

## Industrial Context

This Unilever research project used wet-particle DEM to study extrusion during basket granulation. The model linked particle-scale cohesion to measurable process outcomes, including extrusion force and material flux.

{% include figure.liquid loading="eager" path="assets/img/publication_preview/wet_granular_collapse.png" title="Liquid bridges between wet particles" class="img-fluid rounded z-depth-1" %}

### Industrial Contributions

- Developed a cohesive wet-particle DEM model for extrusion.
- Studied formulation and moisture-content effects.
- Evaluated process-geometry influences on extrusion force and throughput.
- Supported formulation optimization and process scale-up.

**Project period:** June 2022 - August 2024

**Industrial partner:** Unilever

## Validated Wet-Particle Methodology

The underlying wet-particle modelling was also investigated through controlled granular-column-collapse experiments and DEM simulations. The contact model accounts for both liquid-bridge capillary forces and viscous resistance, while dimensional analysis organizes the response using the Bond, Galileo, and capillary numbers.

{% include figure.liquid loading="lazy" path="assets/img/projects/wet-granular-column-validation.png" title="Experiment and complete wet-particle DEM comparison including capillary and viscous liquid-bridge forces" class="img-fluid rounded z-depth-1" %}

_Experiment-DEM comparison using Case 2, which includes both capillary and viscous liquid-bridge forces. Source: [Zhang et al., Chemical Engineering Science 301, 120725 (2025)](https://doi.org/10.1016/j.ces.2024.120725), Fig. 9._

The complete force model reproduces the measured collapse sequence and final deposit more faithfully than the capillary-only case. At water contents of 2%, 4%, and 6%, the simulated runout distances were 0.039, 0.036, and 0.033 m, compared with experimental values of 0.036, 0.035, and 0.032 m.

<div class="project-stat-grid" role="list" aria-label="Wet-particle methodology highlights">
  <div class="project-stat" role="listitem"><strong>2-6%</strong><span>Water content</span><small>Experiment-DEM validation across three cohesion levels</small></div>
  <div class="project-stat" role="listitem"><strong>5 oils</strong><span>Viscosity sweep</span><small>Silicone oils spanning 0.019-0.490 Pa&middot;s</small></div>
  <div class="project-stat" role="listitem"><strong>Ca &gt; 1</strong><span>Rolling-collapse regime</span><small>Viscous-force-dominated wet granular motion</small></div>
</div>

### Viscosity-Dependent Flow Regimes

{% include figure.liquid loading="lazy" path="assets/img/projects/wet-granular/viscosity-velocity-fields.png" title="Velocity fields for water and high-viscosity silicone oil V" class="img-fluid rounded z-depth-1" %}

_Velocity fields for water and high-viscosity silicone oil V, revealing sliding-dominated and rolling-collapse dynamics. Source: [Zhang et al., Chemical Engineering Science 301, 120725 (2025)](https://doi.org/10.1016/j.ces.2024.120725), Fig. 16._

### Findings

- For water (`Ca = 1.94 × 10^-3`), the final deposit profile is organized primarily by the Bond number.
- At intermediate capillary number (`Ca` of order `10^-1`), both the Bond number and `√Ga` are needed to collapse the final-profile response.
- For the five silicone oils, increasing viscosity reduces runout until the response approaches a plateau; oils III-V have `Ca > 1` and exhibit viscous-force-dominated behaviour.
- The high-viscosity case develops a rolling-collapse mechanism. Once `Ca > 1`, further viscosity variation has little effect on the final profile, which again becomes primarily Bond-number controlled.

<div class="project-scope-note"><strong>Research boundary:</strong> The granular-column study validates the wet-contact model and identifies its governing regimes; it is supporting methodology rather than a direct basket-extrusion result. The reported regime map is based on idealized monodisperse spherical particles.</div>

### My Contribution

The paper's contributor statement records my roles in **software, methodology, investigation, data curation, visualization, conceptualization, and writing the original draft**.

### Related Publication

- [Numerical and experimental investigation of the effect of interstitial liquid viscosity on the collapse of wet granular columns](https://doi.org/10.1016/j.ces.2024.120725), _Chemical Engineering Science_ 301, 120725 (2025).
