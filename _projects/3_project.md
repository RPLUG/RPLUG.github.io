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

- At high superficial gas velocities, the coupled method reduced total wall time by approximately **35%** relative to CG-DPM.
- The local MP-PIC region required approximately **one fifth** of the corresponding CG-DPM time.
- The predicted bubbling frequency was **1.8 Hz**, matching the experiment; the corresponding CG-DPM and two-fluid-model results were 1.6 and 2.2 Hz.

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
