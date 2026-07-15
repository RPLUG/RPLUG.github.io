---
layout: page
title: AI 辅助颗粒测量与 DEM 参数辨识
description: 融合深度学习、模拟和实验，实现颗粒追踪与六参数 DEM 标定。
img: assets/img/publication_preview/particle_tracking.png
permalink: /zh/projects/2_project/
nav: false
lang: zh-CN
---

<div lang="zh-CN" markdown="1">

## 项目概述

本研究将高速成像、DEM 合成数据、计算机视觉与优化算法相结合，用于测量颗粒运动并辨识有效 DEM 接触参数。两部分工作的共同目标是在模拟与实验之间建立可复现的闭环：利用模拟辅助实验测量，再利用实验数据改进模拟。

{% include figure.liquid loading="eager" path="assets/img/publication_preview/particle_tracking.png" title="深度学习辅助的非球形颗粒追踪流程" class="img-fluid rounded z-depth-1" %}

## 个人职责

在 DEM 参数辨识研究中，我负责完整流程，包括模拟数据集生成、实验数据处理、模型开发、ViT 推理、局部网格搜索、CMA-ES 优化、结果评估、可视化及软件实现。

## 非球形颗粒追踪

- 由 DEM 模拟直接生成合成训练图像和标签，减少对大规模人工标注的依赖。
- 使用 Mask R-CNN 对实验图像中的立方体和椭球形颗粒进行分割。
- 跨帧关联颗粒位置，重建瞬时运动轨迹和时均速度场。
- 在传统图像处理难以稳定工作的高密度场景中，实现模拟—实验融合的定量测量。

## DEM 参数辨识流程

参数辨识方法将视觉 Transformer 与基于模拟的优化结合：

1. 采用拉丁超立方采样生成 **10,000 个转鼓 DEM 算例**。
2. 由 ViT 编码颗粒体积分数场和休止角信息，预测初始参数组合。
3. 在初值邻域执行局部网格搜索，并通过新的 DEM 模拟评估候选参数。
4. 如仍需进一步优化，则启动 CMA-ES。

该流程同时辨识 6 个相互耦合的接触参数：粒—粒及粒—壁恢复系数、滑动摩擦系数和滚动摩擦系数。

### 实验数据与结果

- 共使用 **336 组转鼓实验**，其中 168 组用于模型增强，另 168 组用于独立评估。
- ViT 可在约 **0.5 s** 内给出初始参数组合。
- 对 168 组实验进行模拟优化后，平均 **R² 从 0.78 提升至 0.947**，平均休止角 RMSE 从 **0.075 降至 0.067**。
- 在代表性案例中，R² 从 **0.6429 提升至 0.9332**，休止角 RMSE 从 **0.098 降至 0.053**。
- 注意力主要集中在自由表面和转鼓壁面附近，为模型提取信息的位置提供了物理可解释性。

当前研究针对固定准二维转鼓中的球形颗粒。辨识结果应理解为能够复现实验响应的有效参数组合，而非唯一可直接测量的材料常数。

## 代表性论文

- [An efficient non-spherical particle tracking strategy based on deep-learning and simulation-experiment integration](https://doi.org/10.1016/j.powtec.2025.121681)，_Powder Technology_（2026）。
- [Deep-learning-based property parameters identification for DEM simulations](https://doi.org/10.1016/j.ces.2026.124100)，_Chemical Engineering Science_（2026）。

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
