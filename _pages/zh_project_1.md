---
layout: page
title: 面向复杂颗粒的多 GPU DEM
description: 面向大规模凹、凸多面体颗粒体系的 GPU 原生 CUDA/MPI 求解器。
img: assets/img/publication_preview/convex_multigpu_dem.png
permalink: /zh/projects/1_project/
nav: false
lang: zh-CN
---

<div lang="zh-CN" markdown="1">

## 项目概述

本项目面向几何形状复杂的非球形颗粒，开发 GPU 原生离散元法（DEM）求解器。软件融合 CUDA 加速、基于 MPI 的区域分解以及面向三角网格的接触算法，使大规模凹、凸多面体颗粒模拟具备实际可行性。

{% include figure.liquid loading="eager" path="assets/img/publication_preview/convex_multigpu_dem.png" title="多 GPU 多面体 DEM 框架、验证与工业应用" class="img-fluid rounded z-depth-1" %}

## 个人职责与开发范围

**个人职责：独立开发者。** 该求解器由我从零独立设计和实现，涵盖接触几何、全部 CUDA 内核、MPI 通信、颗粒管理、内存管理、科学数据输出及配套工作流工具。

项目自 2022 年底持续开发至今。整个科研软件代码库约 8 万至 13 万行，包含 DEM 求解器以及后处理、颗粒识别和颗粒追踪等辅助工具。软件主要面向 Linux 批处理和 HPC 工作流，而非传统桌面图形界面。

## 规模与性能

- 凹凸多面体框架完成了 **2,000 万个岩石形颗粒、约 120 亿个三角面元**的大规模模拟。
- 在 16 块 NVIDIA RTX 4090 GPU 上，弱扩展最高加速比达到 **15.84 倍**；最大强扩展案例达到 **14.2 倍加速和 89% 并行效率**。
- 前一代凸多面体框架可模拟 **2,000 万个颗粒**，在 16 块 GPU 上相对单 GPU 最高加速 **14.8 倍**。
- 通用凹凸多面体框架比前一代仅支持凸多面体的实现快约 **1.3-1.4 倍**；在 50 万颗粒专项测试中，局部接触定位优化实现 **80.9 倍加速**。
- 16 GPU 算例跨越两个各含 8 块 GPU 的节点，节点间采用 **200 Gbps InfiniBand** 互连。

## 求解器架构

### 接触几何

- 凸多面体接触采用包围球宽相搜索、GJK 窄相相交检测，并通过对偶空间几何运算计算重叠体积及接触特征。
- 通用 ECCM 路径无需凸分解即可处理凹、凸三角网格；算法直接计算三角形交线，并通过局部笛卡尔网格和 owner-cell 规则限制候选范围、避免重复计算。
- 多面体与壁面的接触采用适用于三角网格边界的裁剪和接触特征计算。

### GPU 与分布式执行

- 候选接触被压缩为一维接触对数组，每个接触对由细粒度 GPU 线程处理，避免单个颗粒循环全部邻居造成的负载不均。
- 轻量化颗粒模板缓存在 constant memory 中；变换后的顶点按需计算，避免在线程内保存完整多面体引起寄存器溢出。
- 颗粒状态采用 `real4` 等紧凑向量结构；通过 CUDA Runtime 的轻量封装统一管理 Host/Device 内存分配和传输。
- MPI 区域分解只交换子域边界所需的颗粒状态，并在目标 GPU 上根据本地模板和颗粒姿态重建几何信息。

## 性能工程

- 根据数据复用与访存代价，对接触几何、接触力和状态更新等内核进行有针对性的融合或拆分，减少位置、速度和接触特征的重复读取。
- 针对不同 GPU 架构单独测试 kernel launch 和线程块配置，而不假设存在通用最优参数。
- 模拟快照通过 Pinned Host Memory 和独立 CUDA Stream 传输，使 Device-to-Host 复制及输出处理能够与后续计算重叠。
- 对大型多面体模板和接触临时数据进行显式管理，以控制 constant memory 容量、寄存器压力和 global memory 使用量。

## 验证与应用

验证内容包括解析碰撞、壁面网格和时间步敏感性、颗粒堆积实验以及转鼓测量。U 形凹颗粒转鼓算例与实验速度场的 **R² 达到 0.952**；370 个空心圆柱颗粒的受限堆积模拟与实验均得到约 **0.165 m** 的填充高度。

代表性应用包括百万颗粒筒仓流动、催化剂固定床、转鼓、颗粒堆积和颗粒堆。该求解器已作为课题组科研计算平台使用，并为宝钢、联合利华和中煤等合作项目中的颗粒体系建模提供支持。

## AI 辅助模拟工作流

我开发的自定义 **Claude Code Skill** 接入 **DeepSeek Flash**，可将用户需求转换为 DEM 参数文件，自动启动算例、读取运行日志、诊断并修正配置相关错误，最后辅助用户通过 ParaView 查看和分析结果。

<figure class="project-media-card project-media-wide">
  <video controls preload="metadata" playsinline poster="{{ '/assets/img/publication_preview/convex_multigpu_dem.png' | relative_url }}">
    <source src="{{ '/assets/video/polyhedral-dem/Claude+DEM.mp4' | relative_url }}" type="video/mp4">
    您的浏览器不支持嵌入式视频。<a href="{{ '/assets/video/polyhedral-dem/Claude+DEM.mp4' | relative_url }}">打开 MP4 文件</a>。
  </video>
  <figcaption>AI 辅助 DEM 工作流：参数生成、自动运行、日志诊断、错误修正与 ParaView 可视化</figcaption>
</figure>

## 科研软件工作流

求解器可输出供 ParaView 使用的 VTK/VTU 数据及时间序列集合文件，适用于无需专用图形界面的大规模批处理计算和结果分析。

## 论文与知识产权

- [DEM framework for large-scale concave and convex polyhedral particle systems with multiple GPUs](https://doi.org/10.1007/s00466-026-02781-y)，_Computational Mechanics_（2026）。
- [Large-scale multiple-GPU-based DEM simulation of polyhedral particle systems](https://doi.org/10.1016/j.powtec.2026.122132)，_Powder Technology_（2026）。
- **polyDEM V1.0-V2.0**，软件登记号 2025SR2431344、2026SR0709452。
- **DEMms V8.0**，软件登记号 2026SR0445479。
- 相关发明专利：多面体 DEM 系统的并行计算。

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

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
