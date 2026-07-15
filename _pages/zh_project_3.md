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

- 在较高表观气速下，耦合方法相对 CG-DPM 将总体计算时间降低约 **35%**。
- MP-PIC 局部区域的耗时约为相应 CG-DPM 区域的 **1/5**。
- 模拟得到的鼓泡频率为 **1.8 Hz**，与实验一致；CG-DPM 和双流体模型对应结果分别为 1.6 Hz 和 2.2 Hz。

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
