---
layout: page
title: 湿颗粒挤出
description: 面向湿颗粒力学、配方优化与篮式造粒工艺放大的 DEM 建模。
nav: false
lang: zh-CN
permalink: /zh/projects/5_project/
---

<div lang="zh-CN" markdown="1">

## 工业背景

该联合利华科研项目采用湿颗粒 DEM 研究篮式造粒过程中的挤出行为。模型将颗粒尺度的黏聚作用与可测量的工艺结果关联起来，包括挤出力和物料通量。

{% include figure.liquid loading="eager" path="assets/img/publication_preview/wet_granular_collapse.png" title="湿颗粒之间的液桥" class="img-fluid rounded z-depth-1" %}

### 主要贡献

- 建立了用于挤出过程的黏聚性湿颗粒 DEM 模型。
- 研究了配方和含水率的影响。
- 评估了工艺结构对挤出力和处理量的影响。
- 为配方优化和工艺放大提供支持。

**项目周期：** 2022 年 6 月—2024 年 8 月

**合作单位：** 联合利华

## 湿颗粒模型验证与黏度效应

湿颗粒模型还通过受控颗粒柱塌落实验和 DEM 模拟进行了研究。接触模型同时考虑液桥毛细力与黏性阻力，并采用 Bond 数、Galileo 数和毛细数对不同工况下的塌落行为进行量纲分析。

{% include figure.liquid loading="lazy" path="assets/img/projects/wet-granular-column-validation.png" title="同时考虑液桥毛细力与黏性力的湿颗粒柱实验与 DEM 对比" class="img-fluid rounded z-depth-1" %}

_实验与 Case 2 DEM 的对比；该模型同时考虑液桥毛细力与黏性力。来源：[Zhang 等，Chemical Engineering Science 301，120725（2025）](https://doi.org/10.1016/j.ces.2024.120725)，Fig. 9。_

完整液桥力模型能够较好复现实验中的动态塌落过程和最终沉积形态。含水率为 2%、4% 和 6% 时，模拟铺展距离分别为 0.039、0.036 和 0.033 m，实验值分别为 0.036、0.035 和 0.032 m。

<div class="project-stat-grid" role="list" aria-label="湿颗粒模型研究指标">
  <div class="project-stat" role="listitem"><strong>2-6%</strong><span>含水率范围</span><small>在三个黏聚水平下进行实验与 DEM 验证</small></div>
  <div class="project-stat" role="listitem"><strong>5 种</strong><span>硅油黏度扫描</span><small>黏度覆盖 0.019-0.490 Pa&middot;s</small></div>
  <div class="project-stat" role="listitem"><strong>Ca &gt; 1</strong><span>滚动塌落区间</span><small>由黏性力主导的湿颗粒运动</small></div>
</div>

### 黏度控制的流动机制

{% include figure.liquid loading="lazy" path="assets/img/projects/wet-granular/viscosity-velocity-fields.png" title="水与高黏度硅油 V 工况下的颗粒速度场" class="img-fluid rounded z-depth-1" %}

_水与高黏度硅油 V 工况的速度场对比，展示滑移主导与滚动塌落动力学的差异。来源：[Zhang 等，Chemical Engineering Science 301，120725（2025）](https://doi.org/10.1016/j.ces.2024.120725)，Fig. 16。_

### 主要发现

- 对于水工况（`Ca = 1.94 × 10^-3`），最终沉积轮廓主要由 Bond 数表征。
- 当毛细数处于 `10^-1` 量级时，需要同时使用 Bond 数和 `√Ga` 描述最终轮廓。
- 对 5 种硅油的研究表明，随着黏度升高，铺展距离逐渐缩短并趋于平台；硅油 III-V 的 `Ca > 1`，其运动由黏性力主导。
- 高黏度体系出现滚动塌落机制；当 `Ca > 1` 后，继续改变黏度对最终轮廓影响很小，轮廓再次主要受 Bond 数控制。

<div class="project-scope-note"><strong>研究边界：</strong>颗粒柱塌落研究用于验证湿颗粒接触模型并识别控制机制，是篮式挤出研究的方法学支撑，而不是对挤出工艺结果的直接描述。当前机制图基于理想化的单分散球形颗粒。</div>

### 个人贡献

论文作者贡献声明明确记录了我在 **软件、方法学、实验研究、数据整理、可视化、概念设计和初稿撰写** 等方面的工作。

### 相关论文

- [Numerical and experimental investigation of the effect of interstitial liquid viscosity on the collapse of wet granular columns](https://doi.org/10.1016/j.ces.2024.120725)，_Chemical Engineering Science_ 301，120725（2025）。

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
