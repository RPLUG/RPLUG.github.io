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

## 相关湿颗粒方法研究

湿颗粒模型还通过受控颗粒柱塌落实验和 DEM 模拟进行了研究。接触模型同时考虑液桥毛细力与黏性阻力，并采用 Bond 数、Galileo 数和毛细数对不同工况下的塌落行为进行量纲分析。

{% include figure.liquid loading="lazy" path="assets/img/projects/wet-granular-column-validation.png" title="湿颗粒柱塌落的实验与数值模拟序列" class="img-fluid rounded z-depth-1" %}

_湿颗粒柱塌落的实验—模拟对比。来源：[Zhang 等，Chemical Engineering Science 301，120725（2025）](https://doi.org/10.1016/j.ces.2024.120725)，Fig. 8。_

### 主要发现

- 对于低黏度液体，最终沉积轮廓主要由 Bond 数表征。
- 研究采用 5 种硅油考察液体黏度的影响；随着黏度升高，颗粒铺展距离逐渐缩短并最终趋于稳定。
- 当毛细数约为 `10^-3` 时，塌落轮廓主要受 Bond 数控制；当毛细数约为 `10^-1` 时，Bond 数和 Galileo 数共同发挥作用。
- 在很高的毛细数条件下观察到不同的滚动塌落机制，最终轮廓再次主要表现为对 Bond 数的依赖。

### 个人贡献

论文作者贡献声明明确记录了我在 **软件、方法学、实验研究、数据整理、可视化、概念设计和初稿撰写** 等方面的工作。

### 相关论文

- [Numerical and experimental investigation of the effect of interstitial liquid viscosity on the collapse of wet granular columns](https://doi.org/10.1016/j.ces.2024.120725)，_Chemical Engineering Science_ 301，120725（2025）。

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
