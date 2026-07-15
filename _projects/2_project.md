---
layout: page
title: AI-Assisted Particle Measurement and DEM Parameter Identification
description: Deep learning and simulation-experiment integration for particle tracking and six-parameter DEM calibration.
img: assets/img/publication_preview/particle_tracking.png
importance: 2
category: research
---

## Overview

This work integrates high-speed imaging, DEM-generated synthetic data, computer vision, and optimization to measure particle motion and identify effective DEM contact parameters. The common goal is a reproducible loop in which simulation supports experimental measurement and experimental data improves simulation.

{% include figure.liquid loading="eager" path="assets/img/publication_preview/particle_tracking.png" title="Workflow for deep-learning-assisted non-spherical particle tracking" class="img-fluid rounded z-depth-1" %}

## My Role

For the DEM parameter-identification study, I completed the end-to-end workflow, including simulation-dataset generation, experimental-data processing, model development, ViT inference, local grid search, CMA-ES optimization, evaluation, visualization, and software implementation.

## Non-Spherical Particle Tracking

- DEM simulations generate synthetic training images and labels without requiring extensive manual annotation.
- Mask R-CNN segments cuboidal and ellipsoidal particles in experimental images.
- Particle positions are linked across frames to reconstruct instantaneous trajectories and time-averaged velocity fields.
- The simulation-experiment workflow enables quantitative measurements in dense scenes where conventional image processing is unreliable.

## DEM Parameter-Identification Pipeline

The parameter-identification study combines a Vision Transformer with simulation-based refinement:

1. Latin hypercube sampling generates **10,000 rotating-drum DEM cases**.
2. Particle-volume-fraction fields and angle-of-repose measurements are encoded by a ViT to infer an initial parameter set.
3. A local grid search evaluates nearby candidates through new DEM simulations.
4. CMA-ES is activated when further optimization is required.

The workflow identifies six coupled contact parameters: particle-particle and particle-wall restitution, sliding-friction, and rolling-friction coefficients.

### Experimental Data and Results

- **336 rotating-drum experiments** were used, with 168 cases for model enhancement and 168 for independent evaluation.
- ViT inference provides an initial parameter set in approximately **0.5 s**.
- Across 168 experimental cases, simulation-based refinement increased the mean **R² from 0.78 to 0.947** and reduced the mean angle-of-repose RMSE from **0.075 to 0.067**.
- In a representative case, R² increased from **0.6429 to 0.9332**, while angle-of-repose RMSE decreased from **0.098 to 0.053**.
- Attention maps concentrate around the free surface and drum wall, providing a physically interpretable indication of where the model extracts information.

The current study focuses on spherical particles in a fixed quasi-two-dimensional rotating drum. The inferred values should be interpreted as feasible effective parameter sets rather than uniquely measurable material constants.

## Representative Publications

- [An efficient non-spherical particle tracking strategy based on deep-learning and simulation-experiment integration](https://doi.org/10.1016/j.powtec.2025.121681), _Powder Technology_ (2026).
- [Deep-learning-based property parameters identification for DEM simulations](https://doi.org/10.1016/j.ces.2026.124100), _Chemical Engineering Science_ (2026).
