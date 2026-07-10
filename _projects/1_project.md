---
layout: page
title: Multi-GPU DEM for Complex Particles
description: Scalable CUDA/MPI algorithms for large concave and convex polyhedral-particle systems.
img: assets/img/publication_preview/convex_multigpu_dem.png
importance: 1
category: research
---

## Overview

This research develops high-performance discrete element method (DEM) frameworks for particulate systems containing geometrically complex, non-spherical particles. The implementation combines CUDA acceleration, MPI-based domain decomposition, and geometry-aware collision detection to make industrial-scale simulations tractable.

{% include figure.liquid loading="eager" path="assets/img/publication_preview/convex_multigpu_dem.png" title="Multi-GPU polyhedral DEM framework, verification, and industrial application" class="img-fluid rounded z-depth-1" %}

### Highlights

- Supports concave and convex polyhedral particles represented by triangular surface meshes.
- Simulates up to 20 million complex particles with approximately 12 billion triangular facets.
- Achieves near-linear weak scaling and more than 80 percent strong-scaling efficiency on 16 NVIDIA RTX 4090 GPUs.
- Has been applied to rotating drums, hoppers, fixed beds, particle packing, and granular piles.

### Representative publications

- [DEM framework for large-scale concave and convex polyhedral particle systems with multiple GPUs](https://doi.org/10.1007/s00466-026-02781-y), _Computational Mechanics_ (2026).
- [Large-scale multiple-GPU-based DEM simulation of polyhedral particle systems](https://doi.org/10.1016/j.powtec.2026.122132), _Powder Technology_ (2026).

## Simulation gallery

The following original animations show representative packing systems and a large-scale polyhedral-particle simulation.

<div class="project-media-grid">
  <figure class="project-media-card">
    <img src="{{ '/assets/video/polyhedral-dem/u-packingxx3.gif' | relative_url }}" alt="Packing simulation of U-shaped particles" loading="lazy">
    <figcaption>U-shaped particle packing</figcaption>
  </figure>
  <figure class="project-media-card">
    <img src="{{ '/assets/video/polyhedral-dem/banana-packingxx3.gif' | relative_url }}" alt="Packing simulation of banana-shaped particles" loading="lazy">
    <figcaption>Banana-shaped particle packing</figcaption>
  </figure>
  <figure class="project-media-card">
    <img src="{{ '/assets/video/polyhedral-dem/apple-packingxx3.gif' | relative_url }}" alt="Packing simulation of apple-shaped particles" loading="lazy">
    <figcaption>Apple-shaped particle packing</figcaption>
  </figure>
</div>

<figure class="project-media-card project-media-wide">
  <video controls preload="metadata" playsinline poster="{{ '/assets/img/publication_preview/convex_multigpu_dem.png' | relative_url }}">
    <source src="{{ '/assets/video/polyhedral-dem/Large-scale.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support embedded video. <a href="{{ '/assets/video/polyhedral-dem/Large-scale.mp4' | relative_url }}">Open the MP4 file</a>.
  </video>
  <figcaption>Large-scale multi-GPU polyhedral-particle simulation</figcaption>
</figure>
