---
layout: page
title: Particle-Fluid and Multiscale Modelling
description: CFD-DEM, CG-DPM, MP-PIC, and MPS methods for complex multiphase and free-surface flows.
img: assets/img/publication_preview/cg_dpm_mppic.png
importance: 3
category: research
---

## Overview

This research focuses on scalable numerical methods for particle-fluid systems. It connects contact-resolved particle mechanics, coarse-grained methods, and particle-scale transport models so that the numerical resolution can be selected according to the physics and computational budget of each application.

{% include figure.liquid loading="eager" path="assets/img/publication_preview/cg_dpm_mppic.png" title="Coupled CG-DPM and MP-PIC strategy for gas-solid systems" class="img-fluid rounded z-depth-1" %}

## Hybrid CG-DPM and MP-PIC

A spatially decomposed coupling strategy uses CG-DPM in the dense lower region, where explicit contact dynamics are important, and MP-PIC in the dilute upper region, where parcel-based modelling reduces cost. A transition region blends momentum transfer between the two descriptions.

For the 1.0 m-tall validation bed, the lower 0.4 m uses CG-DPM, the middle 0.1 m provides the transition, and the upper 0.5 m uses MP-PIC. The transition weight varies linearly with height. A 0.1 m transition was retained because tests below 0.06 m produced excessive contact forces as overlapping MP-PIC parcels entered the contact-resolved region.

### Validation Against Bubbling-Bed Data

<figure class="project-media-card project-media-portrait">
  <img loading="lazy" src="{{ '/assets/img/projects/particle-fluid-multiscale/mppic-bubbling-validation.png' | relative_url }}" alt="Bubbling behaviour predicted by CG-DPM and the coupled method compared with experimental data" />
  <figcaption>Bubbling behaviour predicted by CG-DPM and the coupled method compared with published experimental data. Source: <a href="https://hgxb.cip.com.cn/CN/10.11949/0438-1157.20250599">Zhang et al., <em>CIESC Journal</em> 76 (2025)</a>, Fig. 4.</figcaption>
</figure>

The coupled calculation reproduces the characteristic bubbling patterns and remains close to CG-DPM for bed expansion, pressure drop, and axial and radial voidage. At a bed height of 0.2 m, it predicts the experimental bubbling frequency exactly.

<div class="project-stat-grid" role="list" aria-label="CG-DPM and MP-PIC validation and performance highlights">
  <div class="project-stat" role="listitem"><strong>1.8 Hz</strong><span>Bubbling frequency</span><small>Coupled method and experiment; CG-DPM gives 1.6 Hz</small></div>
  <div class="project-stat" role="listitem"><strong>65%</strong><span>Total wall time</span><small>Relative to CG-DPM at <em>u</em><sub>g</sub> = 0.51 m/s</small></div>
  <div class="project-stat" role="listitem"><strong>1/5</strong><span>Local wall time</span><small>MP-PIC region relative to CG-DPM for <em>u</em><sub>g</sub> &ge; 0.38 m/s</small></div>
</div>

### Computational Performance

<div class="project-media-grid">
  <figure class="project-media-card">
    <img loading="lazy" src="{{ '/assets/img/projects/particle-fluid-multiscale/mppic-total-wall-time.png' | relative_url }}" alt="Overall wall-time ratio of the coupled method to CG-DPM" />
    <figcaption>Overall wall-time ratio of the coupled method to CG-DPM (Fig. 10).</figcaption>
  </figure>
  <figure class="project-media-card">
    <img loading="lazy" src="{{ '/assets/img/projects/particle-fluid-multiscale/mppic-local-wall-time.png' | relative_url }}" alt="Local wall-time ratio in the MP-PIC region relative to CG-DPM" />
    <figcaption>Local wall-time ratio in the MP-PIC region relative to CG-DPM (Fig. 11).</figcaption>
  </figure>
</div>

<div class="project-scope-note"><strong>Benchmark scope:</strong> The particle calculations used one NVIDIA K80, while OpenFOAM ran on an Intel Xeon E5-2680 v4 CPU. At high gas velocity, the coupled method slightly overpredicts bed expansion, likely because MP-PIC simplifies collision dissipation; quantitative selection of the domain split and transition width remains an open problem.</div>

## Particle-Scale and Coarse-Grained Biomass Pyrolysis

A collaborative study coupled a radially resolved particle-scale heat-transfer and reaction model with coarse-grained CFD-DEM. Sand was represented by coarse-grained parcels while individual biomass particles retained their internal thermal and reaction resolution.

- For 40 s of physical time on 10 CPU cores, coarse-graining levels 2 and 3 reduced wall-clock time by **86.3%** and **96.6%**, respectively, while retaining comparable reactor-scale product yields.
- The model captured hot-skin/cold-core behaviour, internal conversion fronts, bubble evolution, and broad residence-time distributions.
- Results indicate that internal temperature gradients should be resolved explicitly for biomass particles larger than approximately **1 mm** under the studied conditions.

## Coarse-Grained CFD-DEM Method Landscape

The accompanying review organizes approximately 25 years of coarse-grained CFD-DEM development, including similarity principles, collision and force scaling, heat and mass transfer, and applications from laboratory to industrial fluidized beds. It also identifies open challenges in high coarse-graining ratios, broad size distributions, adaptive parcel splitting and merging, complex geometry, non-spherical particles, heterogeneous CPU-GPU computing, and industrial validation.

## Current Software Directions

- CPU-GPU heterogeneous CFD-DEM coupling between OpenFOAM and a polyhedral-particle solver.
- Coarse-grained gas-solid modelling for fluidized beds, fixed beds, and conveying systems.
- Multi-GPU moving particle semi-implicit (MPS) methods for large-scale free-surface flow.
- Verification against experiments and application-oriented benchmark systems.

## Representative Publications

- [Coupled simulation method of CG-DPM and MP-PIC for gas-solid system](https://hgxb.cip.com.cn/CN/10.11949/0438-1157.20250599), _CIESC Journal_ (2025, in Chinese).
- [Numerical investigation on the fast pyrolysis of large biomass particles in bubbling beds using the coupled particle-scale and coarse-grained CFD-DEM](https://doi.org/10.1016/j.cej.2026.177360), _Chemical Engineering Journal_ (2026).
- [Revolution of coarse-grained CFD-DEM technology and its application in fluidized beds: A comprehensive review](https://doi.org/10.1016/j.partic.2025.08.017), _Particuology_ (2025).
