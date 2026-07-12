---
layout: page
title: 面向复杂颗粒的多 GPU DEM
description: 面向大规模凹、凸多面体颗粒系统的可扩展 CUDA/MPI 算法。
img: assets/img/publication_preview/convex_multigpu_dem.png
permalink: /zh/projects/1_project/
nav: false
lang: zh-CN
---

<div lang="zh-CN" markdown="1">

## 项目概述

本研究致力于为含几何形状复杂非球形颗粒的颗粒系统开发高性能离散元法（DEM）框架。该框架融合 CUDA 加速、基于 MPI 的区域分解以及考虑几何特征的碰撞检测，使工业规模模拟具备实际可行性。

{% include figure.liquid loading="eager" path="assets/img/publication_preview/convex_multigpu_dem.png" title="多 GPU 多面体 DEM 框架、验证与工业应用" class="img-fluid rounded z-depth-1" %}

### 主要特点

- 支持以三角形表面网格表示的凹、凸多面体颗粒。
- 可模拟多达 2,000 万个复杂颗粒及约 120 亿个三角形面片。
- 在 16 块 NVIDIA RTX 4090 GPU 上实现接近线性的弱扩展性能，强扩展效率超过 80%。
- 已应用于转鼓、料斗、固定床、颗粒堆积和颗粒堆等系统。

### 代表性论文

- [DEM framework for large-scale concave and convex polyhedral particle systems with multiple GPUs](https://doi.org/10.1007/s00466-026-02781-y)，_Computational Mechanics_（2026）。
- [Large-scale multiple-GPU-based DEM simulation of polyhedral particle systems](https://doi.org/10.1016/j.powtec.2026.122132)，_Powder Technology_（2026）。

## 模拟展示

以下原始动画展示了若干代表性堆积系统以及一个大规模多面体颗粒模拟算例。

<div class="project-media-grid">
  <figure class="project-media-card">
    <img src="{{ '/assets/video/polyhedral-dem/u-packingxx3.gif' | relative_url }}" alt="U 形颗粒堆积模拟" loading="lazy">
    <figcaption>U 形颗粒堆积</figcaption>
  </figure>
  <figure class="project-media-card">
    <img src="{{ '/assets/video/polyhedral-dem/banana-packingxx3.gif' | relative_url }}" alt="香蕉形颗粒堆积模拟" loading="lazy">
    <figcaption>香蕉形颗粒堆积</figcaption>
  </figure>
  <figure class="project-media-card">
    <img src="{{ '/assets/video/polyhedral-dem/apple-packingxx3.gif' | relative_url }}" alt="苹果形颗粒堆积模拟" loading="lazy">
    <figcaption>苹果形颗粒堆积</figcaption>
  </figure>
</div>

<figure class="project-media-card project-media-wide">
  <video controls preload="metadata" playsinline poster="{{ '/assets/img/publication_preview/convex_multigpu_dem.png' | relative_url }}">
    <source src="{{ '/assets/video/polyhedral-dem/Large-scale.mp4' | relative_url }}" type="video/mp4">
    您的浏览器不支持嵌入式视频。<a href="{{ '/assets/video/polyhedral-dem/Large-scale.mp4' | relative_url }}">打开 MP4 文件</a>。
  </video>
  <figcaption>大规模多 GPU 多面体颗粒模拟</figcaption>
</figure>

<figure class="project-media-card project-media-wide-2">
  <video controls preload="metadata" playsinline poster="{{ '/assets/img/publication_preview/convex_multigpu_dem.png' | relative_url }}">
    <source src="{{ '/assets/video/polyhedral-dem/Claude+DEM.mp4' | relative_url }}" type="video/mp4">
    您的浏览器不支持嵌入式视频。<a href="{{ '/assets/video/polyhedral-dem/Claude+DEM.mp4' | relative_url }}">打开 MP4 文件</a>。
  </video>
  <figcaption>Claude Plus DeepseekV4 </figcaption>
</figure>

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
