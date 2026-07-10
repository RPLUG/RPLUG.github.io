---
layout: page
title: AI-Assisted Particle Measurement
description: Deep learning and simulation-experiment integration for tracking particles and identifying DEM parameters.
img: assets/img/publication_preview/particle_tracking.png
importance: 2
category: research
---

## Overview

This work integrates high-speed imaging, DEM-generated synthetic data, and deep learning to measure non-spherical particle motion and calibrate simulation parameters. The goal is to build a reproducible loop between physical experiments and numerical models.

{% include figure.liquid loading="eager" path="assets/img/publication_preview/particle_tracking.png" title="Workflow for deep-learning-assisted non-spherical particle tracking" class="img-fluid rounded z-depth-1" %}

### Highlights

- Generates synthetic training data directly from DEM simulations.
- Uses Mask R-CNN for segmentation and tracking of cuboidal and ellipsoidal particles.
- Reconstructs instantaneous trajectories and time-averaged velocity fields from experimental images.
- Combines Vision Transformers, grid search, and CMA-ES optimization to infer DEM contact parameters.

### Representative publications

- [An efficient non-spherical particle tracking strategy based on deep-learning and simulation-experiment integration](https://doi.org/10.1016/j.powtec.2025.121681), _Powder Technology_ (2026).
- [Deep-learning-based property parameters identification for DEM simulations](https://doi.org/10.1016/j.ces.2026.124100), _Chemical Engineering Science_ (2026).
