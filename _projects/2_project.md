---
layout: page
title: AI-Assisted Particle Measurement and DEM Parameter Identification
description: Deep learning and simulation-experiment integration for particle tracking and six-parameter DEM calibration.
img: assets/img/publication_preview/particle_tracking.png
importance: 2
category: research
---

<div class="ai-project" markdown="1">

## Overview

This project connects two first-author studies: a simulation-to-experiment strategy for tracking non-spherical particles, and a closed-loop framework for identifying effective DEM contact parameters. Together they turn high-speed images into particle-resolved measurements and then use those measurements to improve simulation.

{% include figure.liquid loading="eager" path="assets/img/publication_preview/particle_tracking.png" title="Workflow for deep-learning-assisted non-spherical particle tracking" class="img-fluid rounded z-depth-1" %}

<div class="project-stat-grid" role="list" aria-label="Project highlights">
  <div class="project-stat" role="listitem"><strong>1,082</strong><span>Synthetic images</span><small>Automatically rendered with pixel-level masks</small></div>
  <div class="project-stat" role="listitem"><strong>10</strong><span>Corrected experimental frames</span><small>Used for real-image fine-tuning</small></div>
  <div class="project-stat" role="listitem"><strong>10,000</strong><span>DEM training cases</span><small>For ViT-based inverse identification</small></div>
  <div class="project-stat" role="listitem"><strong>336</strong><span>Rotating-drum experiments</span><small>168 for enhancement and 168 for validation</small></div>
</div>

## My Contribution

- **Particle tracking:** first author; worked across superquadric DEM data generation, automatic mask construction, Mask R-CNN training and experimental transfer, three-frame PTV, field reconstruction, evaluation, and visualization.
- **Parameter identification:** completed the end-to-end computational workflow, including simulation-dataset generation, experimental-data processing, ViT development and inference, local grid search, CMA-ES optimization, evaluation, visualization, and software implementation.

<div class="project-module-label">Research module 01</div>

## Simulation-to-Experiment Non-Spherical Particle Tracking

The central idea is to replace large-scale manual annotation with physics-based synthetic data. Superquadric DEM supplies particle geometry and motion; ParaView renders realistic images while preserving exact per-particle labels. A small corrected experimental set then closes the simulation-to-camera domain gap.

### Mask R-CNN Architecture

{% include figure.liquid loading="lazy" path="assets/img/projects/ai-particle-measurement/mask-rcnn-architecture-original.png" title="Original Mask R-CNN architecture from the published study" class="img-fluid rounded z-depth-1" %}

Synthetic or experimental frames pass through a ResNet-50/FPN feature backbone, the Region Proposal Network, and RoI Align. Separate heads then return particle class, bounding box, and pixel-level instance mask.

### From Masks to Velocity Fields

<div class="model-flow model-flow--four" role="group" aria-label="Particle tracking and velocity field reconstruction workflow">
  <div class="model-flow__node">
    <span class="model-flow__step">01</span>
    <strong>Instance masks</strong>
    <small>Extract particle centroids and contours</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">02</span>
    <strong>Three-frame matching</strong>
    <small>Bidirectional association across t-1, t, and t+1</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">03</span>
    <strong>Particle trajectories</strong>
    <small>Instantaneous Lagrangian velocities</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">04</span>
    <strong>Eulerian field</strong>
    <small>Mask-area-weighted velocity mapping</small>
  </div>
</div>

### Dataset and Experimental Transfer

- **1,082 synthetic images** cover silo packing, dilute random motion, and rotating-drum flow. Each image contains 10-200 particles (about 80 on average), split 80%/20% for training and validation.
- Automatic augmentation combines flips, Gaussian blur, brightness, contrast, and saturation changes to approximate camera variation.
- The synthetic model is transferred using only **10 manually corrected experimental frames**, selected across different speeds and particle counts rather than fully annotating a large real-image dataset.
- The Mask R-CNN uses a ResNet-50/FPN backbone with RPN, RoI Align, classification, bounding-box, and FCN mask heads. The reported model contains approximately 45.9 million parameters.

<div class="project-stat-grid" role="list" aria-label="Particle tracking results">
  <div class="project-stat" role="listitem"><strong>0.899</strong><span>mAP<sub>50:95</sub></span><small>Synthetic validation data</small></div>
  <div class="project-stat" role="listitem"><strong>0.926</strong><span>AR<sub>50:95</sub></span><small>Synthetic validation data</small></div>
  <div class="project-stat" role="listitem"><strong>0 error</strong><span>Particle-count deviation</span><small>After fine-tuning in the 253-cuboid experiment</small></div>
  <div class="project-stat" role="listitem"><strong>&lt;10 h</strong><span>Shape-specific deployment</span><small>Approximately 1,000 images, including simulation and training</small></div>
</div>

The independent synthetic test used 1,550 frames and achieved complete particle association in that sequence. Experimental validation covered cuboids, ellipsoids, and a mixed cuboid-ellipsoid system; a 10,000-frame average reconstructed the cuboid velocity field and particle trajectories. Current inference is approximately 200 ms per frame (about 5 FPS), so the implementation is positioned for offline analysis rather than real-time tracking.

<div class="project-scope-note"><strong>Metric boundary:</strong> AP and AR are measured on synthetic data. The zero-error result refers specifically to particle-count deviation after fine-tuning in one cuboid experiment; it does not imply zero mask or velocity error.</div>

<div class="project-module-label">Research module 02</div>

## Closed-Loop DEM Parameter Identification

This study turns experimental particle motion into a fast initial estimate of six coupled DEM contact parameters, then verifies and improves that estimate through new simulations. Refined experiment-simulation pairs feed back into the training set so that the model progressively adapts to real observations.

{% include figure.liquid loading="lazy" path="assets/img/publication_preview/property_parameter_identification.png" title="Closed-loop workflow for ViT-guided DEM parameter identification" class="img-fluid rounded z-depth-1" %}

### Vision Transformer Architecture

{% include figure.liquid loading="lazy" path="assets/img/projects/ai-particle-measurement/vit-parameter-architecture-original.png" title="Original Vision Transformer architecture from the published study" class="img-fluid rounded z-depth-1" %}

The time-resolved PVF is encoded through a 1 &times; 1 convolution and non-overlapping field patches. Patch embeddings, positional information, and operating-condition context enter the Transformer encoder; the MLP head then returns particle-particle and particle-wall restitution, sliding-friction, and rolling-friction values. Training uses a Smooth L1 regression objective, and the inferred set is not assumed to be the only physically possible parameter combination.

### Experiment-Simulation-Optimization Loop

<div class="model-flow model-flow--five" role="group" aria-label="Closed-loop DEM parameter identification workflow">
  <div class="model-flow__node">
    <span class="model-flow__step">01 Measure</span>
    <strong>High-speed imaging + PTV</strong>
    <small>Construct PVF and dynamic angle of repose</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">02 Infer</span>
    <strong>ViT initial estimate</strong>
    <small>Six contact parameters in about 0.5 s</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">03 Verify</span>
    <strong>DEM replay</strong>
    <small>Compare PVF R² and angle-of-repose RMSE</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">04 Refine</span>
    <strong>Local grid search</strong>
    <small>Explore candidates near the ViT estimate</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">05 Escalate</span>
    <strong>CMA-ES when needed</strong>
    <small>Global refinement for difficult cases</small>
  </div>
</div>

<div class="project-feedback-band"><strong>Feedback path:</strong> experimentally validated PVFs, AoRs, and refined parameter sets are added to the enhancement dataset and used to update the ViT model.</div>

### Data Scale and Results

- Latin hypercube sampling produced **10,000 rotating-drum DEM cases**, pairing PVFs and AoRs with parameter labels.
- **336 experiments** span 0-50 rpm, 100-400 particles, and particle diameters of 9 or 10 mm; 168 cases enhance the model and 168 remain independent tests.
- On the 168 enhancement cases, simulation-based refinement increased mean **R² from 0.78 to 0.947** and reduced mean angle-of-repose RMSE from **0.075 to 0.067**.
- In a representative case, grid search increased R² from **0.6429 to 0.9332** and reduced angle-of-repose RMSE from **0.098 to 0.053**.
- On the independent test set, enhancement raised mean R² from **0.74 to 0.82**, while mean angle-of-repose RMSE changed from about **0.068 to 0.073**. The gain therefore concentrates on PVF consistency rather than improving every metric.
- Attention analysis indicates that the ViT focuses on the free surface and drum side wall, where shear, dissipation, and particle-wall interactions are pronounced.

<div class="project-stat-grid" role="list" aria-label="DEM parameter identification results">
  <div class="project-stat" role="listitem"><strong>~0.5 s</strong><span>Initial ViT inference</span><small>Before simulation-based refinement</small></div>
  <div class="project-stat" role="listitem"><strong>0.78 → 0.947</strong><span>Mean PVF R²</span><small>168 enhancement cases after refinement</small></div>
  <div class="project-stat" role="listitem"><strong>0.075 → 0.067</strong><span>Mean AoR RMSE</span><small>168 enhancement cases after refinement</small></div>
  <div class="project-stat" role="listitem"><strong>6</strong><span>Coupled contact parameters</span><small>Particle-particle and particle-wall pairs</small></div>
</div>

<div class="project-scope-note"><strong>Scope:</strong> the current validation covers spherical particles in a fixed quasi-two-dimensional rotating drum under quasi-steady conditions. The identified values are feasible effective parameter sets that reproduce the observations, not unique directly measurable material constants.</div>

## Representative Publications

- [An efficient non-spherical particle tracking strategy based on deep-learning and simulation-experiment integration](https://doi.org/10.1016/j.powtec.2025.121681), _Powder Technology_ 468 (2026) 121681. First author.
- [Deep-learning-based property parameters identification for DEM simulations](https://doi.org/10.1016/j.ces.2026.124100), _Chemical Engineering Science_ 332 (2026) 124100.

</div>
