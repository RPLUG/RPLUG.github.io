---
layout: page
title: Multi-GPU DEM for Complex Particles
description: GPU-native CUDA/MPI solvers for large-scale concave and convex polyhedral-particle systems.
img: assets/img/publication_preview/convex_multigpu_dem.png
importance: 1
category: research
---

## Overview

This project develops GPU-native discrete element method (DEM) solvers for geometrically complex, non-spherical particles. The software combines CUDA acceleration, MPI-based domain decomposition, and mesh-aware contact algorithms to make large-scale concave and convex polyhedral-particle simulations tractable.

{% include figure.liquid loading="eager" path="assets/img/publication_preview/convex_multigpu_dem.png" title="Multi-GPU polyhedral DEM framework, verification, and industrial application" class="img-fluid rounded z-depth-1" %}

## Role and Development Scope

**Role: Sole developer.** I independently designed and implemented the solver from the ground up, including contact geometry, CUDA kernels, MPI communication, particle management, memory management, scientific-data output, and supporting workflow tools.

Development began in late 2022 and continues today. The broader research-software codebase contains approximately 80,000-130,000 lines across the DEM solver and auxiliary post-processing, particle-identification, and particle-tracking tools. It is designed for batch-oriented Linux and HPC workflows rather than a conventional desktop interface.

## Scale and Performance

- The concave-and-convex framework simulated **20 million rock-shaped particles represented by approximately 12 billion triangular facets**.
- On 16 NVIDIA RTX 4090 GPUs, it achieved up to **15.84× weak-scaling speedup** and **14.2× strong-scaling speedup**, corresponding to **89% strong-scaling efficiency** in the largest strong-scaling case.
- The earlier convex-polyhedron framework simulated up to **20 million particles** and achieved up to **14.8× speedup on 16 GPUs**.
- The generalized framework was approximately **1.3-1.4× faster** than the earlier convex-only implementation, while a local contact-location optimization produced an **80.9× speedup** in a dedicated 500,000-particle benchmark.
- Sixteen-GPU runs spanned two eight-GPU nodes connected through **200 Gbps InfiniBand**.

## Solver Architecture

### Contact Geometry

- Convex-particle contacts use a bounding-sphere broad phase, a GJK narrow-phase intersection test, and dual-space geometry operations to evaluate overlap volume and contact features.
- The generalized ECCM route supports both concave and convex triangular meshes without convex decomposition. Triangle-intersection features are evaluated directly, with a local Cartesian grid and owner-cell rule limiting candidate work and preventing duplicate intersections.
- Particle-wall contacts use mesh-aware clipping and contact-feature evaluation for triangulated boundaries.

### GPU and Distributed Execution

- Candidate contacts are compacted into a one-dimensional contact-pair array, and individual contact pairs are processed by fine-grained GPU threads rather than by particle-centred neighbour loops.
- Lightweight particle templates are cached in constant memory. Transformed vertices are evaluated on demand to avoid materializing complete transformed polyhedra and spilling large thread-local objects from registers.
- Particle states use compact vector records such as `real4`; a thin wrapper around the CUDA runtime centralizes host/device allocation and transfers.
- MPI domain decomposition exchanges only the particle state required at subdomain boundaries. Geometry is reconstructed on the destination GPU from the local template and particle orientation.

## Performance Engineering

- Geometry evaluation, force calculation, and state updates are fused or separated according to data reuse and memory-access cost, reducing repeated reads of positions, velocities, and contact features.
- Kernel launch configurations are benchmarked for each GPU architecture rather than assumed to be universally optimal.
- Simulation snapshots are transferred through pinned host memory and dedicated CUDA streams, allowing device-to-host copies and output processing to overlap with ongoing computation.
- Large polyhedral templates and temporary contact data are managed explicitly to control constant-memory capacity, register pressure, and global-memory use.

## Verification and Applications

Verification covers analytical impact tests, wall-mesh and time-step sensitivity, packing experiments, and rotating-drum measurements. A U-shaped concave-particle drum case reproduced the experimental velocity field with **R² = 0.952**, while a constrained packing of 370 hollow cylinders reproduced an experimental filling height of approximately **0.165 m**.

Representative applications include million-particle silo flow, catalyst fixed beds, rotating drums, particle packing, and granular piles. The solver has served as a research platform within the group and has supported modelling work in collaborative projects with Baosteel, Unilever, and China Coal.

## AI-Assisted Simulation Workflow

A custom **Claude Code Skill** connected to **DeepSeek Flash** translates user intent into DEM parameter files, launches cases, reads runtime logs, diagnoses and corrects configuration-related failures, and guides users through ParaView-based result inspection.

<figure class="project-media-card project-media-wide">
  <video controls preload="metadata" playsinline poster="{{ '/assets/img/publication_preview/convex_multigpu_dem.png' | relative_url }}">
    <source src="{{ '/assets/video/polyhedral-dem/Claude+DEM.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support embedded video. <a href="{{ '/assets/video/polyhedral-dem/Claude+DEM.mp4' | relative_url }}">Open the MP4 file</a>.
  </video>
  <figcaption>AI-assisted DEM workflow: parameter generation, automated execution, log diagnosis, error correction, and ParaView visualization</figcaption>
</figure>

## Scientific Workflow

The solver writes VTK/VTU data and time-series collection files for ParaView. This batch-oriented workflow supports large simulation campaigns without requiring a dedicated graphical user interface.

## Publications and Intellectual Property

- [DEM framework for large-scale concave and convex polyhedral particle systems with multiple GPUs](https://doi.org/10.1007/s00466-026-02781-y), _Computational Mechanics_ (2026).
- [Large-scale multiple-GPU-based DEM simulation of polyhedral particle systems](https://doi.org/10.1016/j.powtec.2026.122132), _Powder Technology_ (2026).
- **polyDEM V1.0-V2.0**, software registration nos. 2025SR2431344 and 2026SR0709452.
- **DEMms V8.0**, software registration no. 2026SR0445479.
- Related invention patent: parallel computation of polyhedral DEM systems.

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
