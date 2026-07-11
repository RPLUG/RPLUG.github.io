---
layout: page
permalink: /zh/cv/
title: 简历
description: 徐嘉宇的中文学术简历。
lang: zh-CN
nav: false
---

<div class="cv cv-zh" lang="zh-CN">
  <p class="cv-zh__downloads">
    下载：<a href="/assets/pdf/JiayuXu_CV_Ch.pdf">中文简历 PDF</a> ·
    <a href="/assets/pdf/JiayuXu_CV_En.pdf">英文简历 PDF</a>
  </p>

  <section class="card mt-3 p-3" markdown="1">
    <h2 class="card-title">个人信息</h2>

    **姓名：** 徐嘉宇
    **身份：** 化学工程博士研究生
    **单位：** 中国科学院过程工程研究所
    **地点：** 北京市怀柔区
    **邮箱：** [rplug_jyxu@icloud.com](mailto:rplug_jyxu@icloud.com)
    **学术主页：** [ResearchGate](https://www.researchgate.net/profile/Jiayu-Xu-23) · [GitHub](https://github.com/RPLUG)

  </section>

  <section class="card mt-3 p-3" markdown="1">
    <h2 class="card-title">个人简介</h2>

    主要从事多 GPU 并行计算、离散元方法、多物理场耦合以及 AI 辅助的实验—模拟融合研究。开发面向大规模复杂颗粒体系的 CUDA/MPI 科学计算软件，研究内容覆盖基础算法、颗粒—流体多尺度建模与工业颗粒过程。

  </section>

  <section class="card mt-3 p-3" markdown="1">
    <h2 class="card-title">教育经历</h2>

    ### 中国科学院过程工程研究所

    **化学工程博士研究生，2021.09—至今**
    中国科学院大学；GPA：3.70/4.00；导师：徐骥研究员、葛蔚研究员。

    ### 湘潭大学

    **化学工程与工艺工学学士，2017.09—2021.06**
    化工学院；GPA：3.73/4.00；指导教师：周业峰教授。

  </section>

  <section class="card mt-3 p-3" markdown="1">
    <h2 class="card-title">研究方向与经历</h2>

    ### 大规模 DEM 与 GPU 加速计算

    - 开发基于 CUDA/MPI 的多 GPU 凹、凸多面体颗粒 DEM 框架。
    - 实现约 2,000 万个复杂颗粒、约 120 亿个三角面元的模拟。
    - 在 16 张 NVIDIA RTX 4090 GPU 上获得近线性的弱扩展性能和超过 80% 的强扩展效率。

    ### 多面体颗粒 CFD-DEM 与气固多尺度建模

    - 构建 OpenFOAM 与多面体 DEM 求解器之间的 CPU-GPU 异构耦合框架。
    - 开展 CG-DPM、MP-PIC 等多尺度气固方法研究，面向流化床、固定床与颗粒输运系统。

    ### AI 辅助颗粒测量与参数识别

    - 利用 DEM 合成数据与 Mask R-CNN 实现不规则颗粒图像分割。
    - 从高速实验图像重建颗粒轨迹与速度场。
    - 结合 Vision Transformer、网格搜索和 CMA-ES 实现 DEM 接触参数快速识别。

  </section>

  <section class="card mt-3 p-3" markdown="1">
    <h2 class="card-title">代表性项目</h2>

    - **高炉渣旋转储料装置（宝钢，2024—2026）：** 分析进料方式、储量、转速与扬料板结构对排料均匀性和设备性能的影响。
    - **湿颗粒挤出模拟（联合利华，2022—2024）：** 研究配方、含水率、挤压力和物料通量，支持配方优化与工艺放大。
    - **高炉炉料分布定量建模（宝钢，2019—2021）：** 分析料流轨迹、料面形貌、矿焦比与粒径分布，支持布料策略优化。

  </section>

  <section class="card mt-3 p-3" markdown="1">
    <h2 class="card-title">论文与软件成果</h2>

    已发表 9 篇同行评议论文，研究涉及多 GPU 多面体 DEM、深度学习颗粒跟踪、DEM 参数识别、颗粒混合指数以及气固多尺度建模。完整作者、期刊和 DOI 信息见[中文论文页面](/zh/publications/)。

    - 多面体 DEM 并行计算相关发明专利。
    - 目标检测方法、设备、电子装置与存储介质相关发明专利。
    - 射流固体混合相关发明专利。
    - **polyDEM V1.0—V2.0：** 复杂颗粒 DEM 模拟软件。
    - **DEMms V8.0：** GPU 加速 DEM 软件。

  </section>

  <section class="card mt-3 p-3" markdown="1">
    <h2 class="card-title">专业技能</h2>

    - **编程：** C/C++、Python、MATLAB、CUDA、Shell。
    - **并行计算：** GPU 计算、MPI、CPU-GPU 异构计算、区域分解。
    - **数值方法：** DEM、CFD-DEM、CG-DPM、MP-PIC、MPS。
    - **人工智能：** 机器学习、深度学习、图像分割、CMA-ES 优化及 LLM/AI Agent 工作流。

  </section>

  <section class="card mt-3 p-3" markdown="1">
    <h2 class="card-title">荣誉奖励</h2>

    - 湘潭大学优秀毕业生，2021。
    - 展辰企业奖学金，2020。
    - 湘潭大学一等奖学金，2018、2019、2020。
    - 全国大学生化工设计竞赛三等奖，2018。

  </section>
</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
