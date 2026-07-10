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

- [DEM framework for large-scale concave and convex polyhedral particle systems with multiple GPUs](https://doi.org/10.1007/s00466-026-02781-y), *Computational Mechanics* (2026).
- [Large-scale multiple-GPU-based DEM simulation of polyhedral particle systems](https://doi.org/10.1016/j.powtec.2026.122132), *Powder Technology* (2026).
