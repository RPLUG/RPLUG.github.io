---
layout: page
title: 研究
permalink: /zh/research/
lang: zh-CN
description: 围绕颗粒体系、高性能科学计算与 AI 辅助建模开展的研究，以及部分工业应用。
nav: false
display_categories: [research, industry]
---

<div class="projects research-overview" lang="zh-CN">
  {% for category in page.display_categories %}
    {% assign category_index = forloop.index %}
    {% assign categorized_projects = site.projects | where: "category", category %}
    {% assign sorted_projects = categorized_projects | sort: "importance" %}

    <section id="zh-{{ category }}" class="research-section research-section--{{ category }}" aria-labelledby="zh-{{ category }}-heading">
      <header class="research-section__header">
        <span class="research-section__number" aria-hidden="true">0{{ category_index }}</span>
        <div>
          <p class="research-section__kicker">
            {% if category == "research" %}方法与关键技术{% else %}代表性工业合作{% endif %}
          </p>
          <h2 id="zh-{{ category }}-heading" class="research-section__title">
            {% if category == "research" %}研究主题{% else %}工业应用{% endif %}
          </h2>
          <p class="research-section__description">
            {% if category == "research" %}
              面向不同尺度的高性能颗粒模拟、多相流建模与数据驱动测量方法。
            {% else %}
              将颗粒尺度模型用于装备设计、过程理解与运行决策。
            {% endif %}
          </p>
        </div>
      </header>

      <div class="research-card-grid">
        {% for project in sorted_projects %}
          {% assign project_zh = site.data.projects_zh[project.title] %}
          {% assign zh_project_url = '/zh' | append: project.url %}
          <a
            class="research-card-link"
            href="{{ zh_project_url | relative_url }}"
            aria-label="查看{{ project_zh.title | default: project.title }}"
          >
            <article class="research-card">
              <div class="research-card__media{% unless project.img %} research-card__media--placeholder{% endunless %}">
                {% if project.img %}
                  {% include figure.liquid loading="lazy" path=project.img sizes="(min-width: 832px) 280px, 92vw" alt=project_zh.title class="research-card__image" %}
                {% else %}
                  <span class="research-card__placeholder-label">
                    {% if category == "industry" %}工业应用{% else %}研究主题{% endif %}
                  </span>
                  <span class="research-card__placeholder-number" aria-hidden="true">0{{ forloop.index }}</span>
                {% endif %}
              </div>

              <div class="research-card__body">
                <p class="research-card__eyebrow">
                  {% if category == "research" %}研究主题{% else %}工业应用{% endif %}
                </p>
                <h3 class="research-card__title">{{ project_zh.title | default: project.title }}</h3>
                <p class="research-card__description">{{ project_zh.description | default: project.description }}</p>
                <span class="research-card__action">查看项目 <span aria-hidden="true">→</span></span>
              </div>
            </article>
          </a>
        {% endfor %}
      </div>
    </section>

{% endfor %}

</div>

<script defer src="{{ '/assets/js/i18n.js' | relative_url }}" data-language="zh-CN"></script>
