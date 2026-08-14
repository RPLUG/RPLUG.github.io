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

本研究聚焦于颗粒—流体系统的可扩展数值方法，将接触解析颗粒力学、粗粒化方法和颗粒尺度传递模型相衔接，使数值分辨率能够根据具体物理问题和计算预算进行选择。

{% include figure.liquid loading="eager" path="assets/img/publication_preview/cg_dpm_mppic.png" title="面向气固系统的 CG-DPM 与 MP-PIC 耦合策略" class="img-fluid rounded z-depth-1" %}

## CG-DPM 与 MP-PIC 混合耦合

该空间分区策略在颗粒接触作用重要的底部密相区采用 CG-DPM，在稀相上部区域采用计算代价更低的 MP-PIC，并通过过渡区实现两种描述之间的动量平滑传递。

在高 1.0 m 的验证床层中，下部 0.4 m 采用 CG-DPM，中间 0.1 m 为过渡区，上部 0.5 m 采用 MP-PIC；过渡权重随高度线性变化。测试表明，小于 0.06 m 的过渡区会使具有重叠的 MP-PIC 颗粒进入接触解析区域时产生过大接触力，因此最终采用 0.1 m 以保证平滑过渡。

### 鼓泡床数据验证

<figure class="project-media-card project-media-portrait">
  <img loading="lazy" src="{{ '/assets/img/projects/particle-fluid-multiscale/mppic-bubbling-validation.png' | relative_url }}" alt="CG-DPM 与耦合方法预测的鼓泡行为及其与实验数据的对比" />
  <figcaption>CG-DPM 与耦合方法预测的鼓泡行为及其与公开实验数据的对比。来源：<a href="https://hgxb.cip.com.cn/CN/10.11949/0438-1157.20250599">Zhang 等，<em>化工学报</em> 76（2025）</a>，图 4。</figcaption>
</figure>

耦合计算能够再现典型鼓泡形态，并在床层膨胀、压降以及轴向和径向空隙率方面保持与 CG-DPM 接近。在床层高度 0.2 m 处，耦合方法准确给出了实验鼓泡频率。

<div class="project-stat-grid" role="list" aria-label="CG-DPM 与 MP-PIC 验证及性能指标">
  <div class="project-stat" role="listitem"><strong>1.8 Hz</strong><span>鼓泡频率</span><small>耦合方法与实验一致；CG-DPM 为 1.6 Hz</small></div>
  <div class="project-stat" role="listitem"><strong>65%</strong><span>总体计算耗时</span><small><em>u</em><sub>g</sub> = 0.51 m/s 时相对 CG-DPM</small></div>
  <div class="project-stat" role="listitem"><strong>1/5</strong><span>局部计算耗时</span><small><em>u</em><sub>g</sub> &ge; 0.38 m/s 时 MP-PIC 区域相对 CG-DPM</small></div>
</div>

### 计算性能

<div class="project-media-grid">
  <figure class="project-media-card">
    <img loading="lazy" src="{{ '/assets/img/projects/particle-fluid-multiscale/mppic-total-wall-time.png' | relative_url }}" alt="耦合方法相对 CG-DPM 的整体计算耗时比" />
    <figcaption>耦合方法相对 CG-DPM 的整体计算耗时比（图 10）。</figcaption>
  </figure>
  <figure class="project-media-card">
    <img loading="lazy" src="{{ '/assets/img/projects/particle-fluid-multiscale/mppic-local-wall-time.png' | relative_url }}" alt="MP-PIC 局部区域相对 CG-DPM 的计算耗时比" />
    <figcaption>MP-PIC 局部区域相对 CG-DPM 的计算耗时比（图 11）。</figcaption>
  </figure>
</div>

<div class="project-scope-note"><strong>基准范围：</strong>颗粒计算使用单张 NVIDIA K80，OpenFOAM 流体计算运行于 Intel Xeon E5-2680 v4 CPU。高气速下耦合方法会略微高估床层膨胀，可能与 MP-PIC 对碰撞耗散的简化有关；计算域分界和过渡区宽度的定量选择仍需进一步研究。</div>

## 颗粒尺度—粗粒化 CFD-DEM 生物质热解

合作研究将径向解析的颗粒内部传热与反应模型同粗粒化 CFD-DEM 耦合：砂粒采用粗粒化颗粒表示，而单个生物质颗粒仍保留其内部温度和反应分辨率。

- 在 10 个 CPU 核上模拟 40 s 物理时间时，粗粒化等级 2 和 3 分别将计算时间降低 **86.3%** 和 **96.6%**，同时保持相近的反应器尺度产物收率。
- 模型可描述热表皮—冷核心、颗粒内部转化前沿、气泡演化以及具有长尾的停留时间分布。
- 在本文研究条件下，粒径大于约 **1 mm** 的生物质颗粒需要显式考虑内部温度梯度。

## 粗粒化 CFD-DEM 方法体系

相关综述梳理了约 25 年的粗粒化 CFD-DEM 发展，包括相似准则、碰撞与受力缩放、传热传质，以及从实验室到工业流化床的应用。综述同时总结了高粗粒化比、宽粒径分布、自适应颗粒合并与拆分、复杂几何、非球形颗粒、CPU-GPU 异构计算及工业尺度验证等开放问题。

## 当前软件方向

- 基于 OpenFOAM 与多面体颗粒求解器的 CPU-GPU 异构 CFD-DEM 耦合。
- 面向流化床、固定床和输运系统的粗粒化气固两相流建模。
- 面向大规模自由表面流动的多 GPU 移动粒子半隐式（MPS）方法。
- 通过实验进行验证，并在面向应用的基准系统中开展测试。

## 代表性论文

- [Coupled simulation method of CG-DPM and MP-PIC for gas-solid system](https://hgxb.cip.com.cn/CN/10.11949/0438-1157.20250599)，_CIESC Journal_（2025，中文）。
- [Numerical investigation on the fast pyrolysis of large biomass particles in bubbling beds using the coupled particle-scale and coarse-grained CFD-DEM](https://doi.org/10.1016/j.cej.2026.177360)，_Chemical Engineering Journal_（2026）。
- [Revolution of coarse-grained CFD-DEM technology and its application in fluidized beds: A comprehensive review](https://doi.org/10.1016/j.partic.2025.08.017)，_Particuology_（2025）。

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
