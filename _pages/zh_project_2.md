---
layout: page
title: AI 辅助颗粒测量与 DEM 参数辨识
description: 融合深度学习、模拟和实验，实现颗粒追踪与六参数 DEM 标定。
img: assets/img/publication_preview/particle_tracking.png
permalink: /zh/projects/2_project/
nav: false
lang: zh-CN
---

<div class="ai-project" lang="zh-CN" markdown="1">

## 项目概述

本项目整合了两项第一作者研究：一项建立从模拟数据到真实实验的非球形颗粒追踪方法，另一项构建有效 DEM 接触参数的闭环辨识框架。两者共同将高速摄影转化为颗粒尺度测量，并利用这些测量结果持续改进模拟。

{% include figure.liquid loading="eager" path="assets/img/publication_preview/particle_tracking.png" title="深度学习辅助的非球形颗粒追踪流程" class="img-fluid rounded z-depth-1" %}

<div class="project-stat-grid" role="list" aria-label="项目概览">
  <div class="project-stat" role="listitem"><strong>1,082</strong><span>张合成图像</span><small>自动生成逐像素颗粒掩膜</small></div>
  <div class="project-stat" role="listitem"><strong>10</strong><span>帧修正实验图像</span><small>用于真实图像域微调</small></div>
  <div class="project-stat" role="listitem"><strong>10,000</strong><span>个 DEM 训练算例</span><small>用于 ViT 逆向参数辨识</small></div>
  <div class="project-stat" role="listitem"><strong>336</strong><span>组转鼓实验</span><small>168 组增强，168 组独立验证</small></div>
</div>

## 个人贡献

- **颗粒追踪：**第一作者；参与超二次曲面 DEM 数据生成、自动掩膜构建、Mask R-CNN 训练与实验迁移、三帧 PTV、速度场重构、评估和可视化的完整方法链。
- **参数辨识：**完成端到端计算流程，包括模拟数据集生成、实验数据处理、ViT 开发与推理、局部网格搜索、CMA-ES 优化、结果评估、可视化和软件实现。

<div class="project-module-label">研究模块 01</div>

## 模拟—实验融合的非球形颗粒追踪

核心思路是使用物理模拟生成的数据替代大规模人工标注。超二次曲面 DEM 提供颗粒几何和运动信息；ParaView 在渲染图像的同时保留精确的逐颗粒标签；最后仅使用少量修正后的实验图像缩小模拟域与相机图像域之间的差异。

### Mask R-CNN 网络架构

{% include figure.liquid loading="lazy" path="assets/img/projects/ai-particle-measurement/mask-rcnn-architecture-original.png" title="论文中的原始 Mask R-CNN 网络结构" class="img-fluid rounded z-depth-1" %}

合成图像或实验图像依次经过 ResNet-50/FPN 特征主干、区域建议网络和 RoI Align，随后由独立任务头输出颗粒类别、边界框和逐像素实例掩膜。

### 从实例掩膜到速度场

<div class="model-flow model-flow--four" role="group" aria-label="颗粒追踪与速度场重构流程">
  <div class="model-flow__node">
    <span class="model-flow__step">01</span>
    <strong>实例掩膜</strong>
    <small>提取颗粒质心和轮廓</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">02</span>
    <strong>三帧匹配</strong>
    <small>在 t-1、t 和 t+1 帧间进行双向关联</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">03</span>
    <strong>颗粒轨迹</strong>
    <small>计算瞬时拉格朗日速度</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">04</span>
    <strong>欧拉速度场</strong>
    <small>按掩膜覆盖面积进行速度映射</small>
  </div>
</div>

### 数据集与实验迁移

- **1,082 张合成图像**覆盖料仓堆积、稀相随机运动和转鼓流动，每张图像包含 10–200 个颗粒，平均约 80 个；训练集和验证集按 80%/20% 划分。
- 数据增强随机组合水平/垂直翻转、高斯模糊、亮度、对比度和饱和度变化，以逼近真实相机条件。
- 实验迁移仅使用 **10 帧人工修正图像**，这些帧来自不同转速和颗粒数量，而不需要完整标注大规模真实图像数据集。
- Mask R-CNN 采用 ResNet-50/FPN 主干、RPN、RoI Align、分类头、边界框头和 FCN 掩膜头，论文报告的模型规模约为 4,590 万参数。

<div class="project-stat-grid" role="list" aria-label="颗粒追踪结果">
  <div class="project-stat" role="listitem"><strong>0.899</strong><span>mAP<sub>50:95</sub></span><small>合成验证数据</small></div>
  <div class="project-stat" role="listitem"><strong>0.926</strong><span>AR<sub>50:95</sub></span><small>合成验证数据</small></div>
  <div class="project-stat" role="listitem"><strong>误差为 0</strong><span>颗粒数量偏差</span><small>253 个立方体颗粒实验微调后</small></div>
  <div class="project-stat" role="listitem"><strong>&lt;10 h</strong><span>新形状部署流程</span><small>约 1,000 张图像，包含模拟和训练</small></div>
</div>

独立合成测试包含 1,550 帧，该序列实现了完整的颗粒关联。实验验证覆盖立方体、椭球及立方体—椭球混合体系；立方体颗粒的时均速度场由连续 10,000 帧重构。当前推理时间约为 200 ms/帧（约 5 FPS），因此定位为离线分析，而非实时追踪。

<div class="project-scope-note"><strong>指标边界：</strong>AP 和 AR 来自合成数据。“误差为 0”仅指特定立方体实验在微调后的颗粒数量偏差，不代表掩膜误差或速度误差为零。</div>

<div class="project-module-label">研究模块 02</div>

## DEM 参数的闭环辨识

该研究首先根据实验颗粒运动快速估计 6 个相互耦合的 DEM 接触参数，再通过新的 DEM 模拟验证并改进初值。经过实验验证的模拟—实验样本被反馈到训练集，使模型逐步适应真实观测。

{% include figure.liquid loading="lazy" path="assets/img/publication_preview/property_parameter_identification.png" title="ViT 引导的 DEM 参数闭环辨识流程" class="img-fluid rounded z-depth-1" %}

### Vision Transformer 网络架构

{% include figure.liquid loading="lazy" path="assets/img/projects/ai-particle-measurement/vit-parameter-architecture-original.png" title="论文中的原始 Vision Transformer 网络结构" class="img-fluid rounded z-depth-1" %}

时间序列 PVF 首先经过 1 &times; 1 卷积和互不重叠的场切片编码；patch embedding、位置信息和运行工况共同进入 Transformer 编码器，MLP 回归头最终输出粒—粒及粒—壁恢复系数、滑动摩擦系数和滚动摩擦系数。模型采用 Smooth L1 回归目标，且不假设辨识结果是唯一可能的物理参数组合。

### 实验—模拟—优化闭环

<div class="model-flow model-flow--five" role="group" aria-label="DEM 参数闭环辨识流程">
  <div class="model-flow__node">
    <span class="model-flow__step">01 测量</span>
    <strong>高速摄影 + PTV</strong>
    <small>构建 PVF 和动态休止角</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">02 推理</span>
    <strong>ViT 初始估计</strong>
    <small>约 0.5 s 给出 6 个接触参数</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">03 验证</span>
    <strong>DEM 重放</strong>
    <small>比较 PVF R² 和休止角 RMSE</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">04 局部优化</span>
    <strong>参数空间网格搜索</strong>
    <small>在 ViT 初值附近评估候选组合</small>
  </div>
  <div class="model-flow__node">
    <span class="model-flow__step">05 全局优化</span>
    <strong>必要时启动 CMA-ES</strong>
    <small>进一步处理难收敛算例</small>
  </div>
</div>

<div class="project-feedback-band"><strong>反馈路径：</strong>将通过实验验证的 PVF、AoR 和优化参数加入增强数据集，继续更新 ViT 模型。</div>

### 数据规模与结果

- 采用拉丁超立方采样生成 **10,000 个转鼓 DEM 算例**，将 PVF 和 AoR 与参数标签配对。
- **336 组实验**覆盖 0–50 rpm、100–400 个颗粒以及 9 或 10 mm 粒径；其中 168 组用于模型增强，另外 168 组作为独立测试。
- 对 168 组增强算例进行基于模拟的优化后，平均 **R² 从 0.78 提升至 0.947**，平均休止角 RMSE 从 **0.075 降至 0.067**。
- 在一个代表性案例中，网格搜索使 R² 从 **0.6429 提升至 0.9332**，休止角 RMSE 从 **0.098 降至 0.053**。
- 在独立测试集上，模型增强使平均 R² 从 **0.74 提升至 0.82**，而平均休止角 RMSE 由约 **0.068 变为约 0.073**。因此，改进主要体现在 PVF 一致性，并非所有指标都同步改善。
- 注意力分析表明，ViT 主要关注颗粒自由表面和转鼓侧壁附近区域，这些区域中的剪切、耗散以及颗粒—壁面作用更为明显。

<div class="project-stat-grid" role="list" aria-label="DEM 参数辨识结果">
  <div class="project-stat" role="listitem"><strong>约 0.5 s</strong><span>ViT 初始推理</span><small>不包含后续模拟优化</small></div>
  <div class="project-stat" role="listitem"><strong>0.78 → 0.947</strong><span>平均 PVF R²</span><small>168 组增强算例优化后</small></div>
  <div class="project-stat" role="listitem"><strong>0.075 → 0.067</strong><span>平均 AoR RMSE</span><small>168 组增强算例优化后</small></div>
  <div class="project-stat" role="listitem"><strong>6</strong><span>个耦合接触参数</span><small>粒—粒和粒—壁参数对</small></div>
</div>

<div class="project-scope-note"><strong>适用范围：</strong>当前验证对象为固定准二维转鼓中的球形颗粒和准稳态工况。辨识结果是能够复现实验响应的有效参数组合，而不是唯一、可直接测量的材料常数。</div>

## 代表性论文

- [An efficient non-spherical particle tracking strategy based on deep-learning and simulation-experiment integration](https://doi.org/10.1016/j.powtec.2025.121681)，_Powder Technology_ 468（2026）121681。第一作者。
- [Deep-learning-based property parameters identification for DEM simulations](https://doi.org/10.1016/j.ces.2026.124100)，_Chemical Engineering Science_ 332（2026）124100。

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
