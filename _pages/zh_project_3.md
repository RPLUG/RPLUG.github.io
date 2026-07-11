---
layout: page
title: 颗粒-流体与多尺度建模
description: 面向复杂多相流与自由表面流动的 CFD-DEM、CG-DPM、MP-PIC 和 MPS 方法。
img: assets/img/publication_preview/cg_dpm_mppic.png
permalink: /zh/projects/3_project/
nav: false
lang: zh-CN
---

<div lang="zh-CN" markdown="1">

## 项目概述

本研究聚焦于颗粒-流体系统的可扩展数值方法，将解析复杂颗粒力学与粗粒化方法相衔接，从而能够依据各类应用的物理尺度和计算资源选择合适的模拟方法。

{% include figure.liquid loading="eager" path="assets/img/publication_preview/cg_dpm_mppic.png" title="面向气固系统的 CG-DPM 与 MP-PIC 耦合策略" class="img-fluid rounded z-depth-1" %}

### 当前研究方向

- 基于 OpenFOAM 与多面体颗粒求解器的 CPU-GPU 异构 CFD-DEM 耦合。
- 面向流化床和输运系统，采用 CG-DPM 与 MP-PIC 开展粗粒化气固两相流建模。
- 面向大规模自由表面流动的多 GPU 移动粒子半隐式（MPS）方法。
- 通过实验进行验证，并在面向应用的基准系统中开展测试。

### 代表性论文

- [Coupled simulation method of CG-DPM and MP-PIC for gas-solid system](https://hgxb.cip.com.cn/CN/10.11949/0438-1157.20250599)，_CIESC Journal_（2025，中文）。

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
