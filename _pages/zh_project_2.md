---
layout: page
title: AI 辅助的颗粒测量
description: 利用深度学习及模拟-实验融合方法进行颗粒追踪与 DEM 参数辨识。
img: assets/img/publication_preview/particle_tracking.png
permalink: /zh/projects/2_project/
nav: false
lang: zh-CN
---

<div lang="zh-CN" markdown="1">

## 项目概述

本研究将高速成像、由 DEM 生成的合成数据与深度学习相结合，用于测量非球形颗粒的运动并标定模拟参数，目标是在物理实验与数值模型之间建立可复现的闭环流程。

{% include figure.liquid loading="eager" path="assets/img/publication_preview/particle_tracking.png" title="深度学习辅助的非球形颗粒追踪流程" class="img-fluid rounded z-depth-1" %}

### 主要特点

- 直接从 DEM 模拟中生成合成训练数据。
- 使用 Mask R-CNN 对立方体和椭球形颗粒进行分割与追踪。
- 根据实验图像重建瞬时运动轨迹和时均速度场。
- 结合视觉 Transformer、网格搜索和 CMA-ES 优化方法反演 DEM 接触参数。

### 代表性论文

- [An efficient non-spherical particle tracking strategy based on deep-learning and simulation-experiment integration](https://doi.org/10.1016/j.powtec.2025.121681)，_Powder Technology_（2026）。
- [Deep-learning-based property parameters identification for DEM simulations](https://doi.org/10.1016/j.ces.2026.124100)，_Chemical Engineering Science_（2026）。

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
