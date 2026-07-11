---
layout: page
title: research
permalink: /research/
description: Research themes spanning particulate systems, high-performance scientific computing, and AI-assisted modelling, with selected industrial applications.
nav: true
nav_order: 1
display_categories: [research, industry]
horizontal: false
---

<!-- pages/projects.md -->
<div class="projects research-overview">
  {% if site.enable_project_categories and page.display_categories %}
    {% for category in page.display_categories %}
      {% assign category_index = forloop.index %}
      {% assign categorized_projects = site.projects | where: "category", category %}
      {% assign sorted_projects = categorized_projects | sort: "importance" %}

      <section id="{{ category }}" class="research-section research-section--{{ category }}" aria-labelledby="{{ category }}-heading">
        <header class="research-section__header">
          <span class="research-section__number" aria-hidden="true">0{{ category_index }}</span>
          <div>
            <p class="research-section__kicker">
              {% if category == "research" %}
                Methods and enabling technologies
              {% else %}
                Selected industrial collaborations
              {% endif %}
            </p>
            <h2 id="{{ category }}-heading" class="research-section__title">
              {% if category == "research" %}
                Research themes
              {% else %}
                Industrial applications
              {% endif %}
            </h2>
            <p class="research-section__description">
              {% if category == "research" %}
                High-performance particle simulation, multiphase modelling, and data-driven measurement across scales.
              {% else %}
                Particle-scale models translated into equipment design, process understanding, and operating decisions.
              {% endif %}
            </p>
          </div>
        </header>

        <div class="research-card-grid">
          {% for project in sorted_projects %}
            <a
              class="research-card-link"
              href="{% if project.redirect %}{{ project.redirect }}{% else %}{{ project.url | relative_url }}{% endif %}"
              aria-label="Read more about {{ project.title }}"
            >
              <article class="research-card">
                <div class="research-card__media{% unless project.img %} research-card__media--placeholder{% endunless %}">
                  {% if project.img %}
                    {% include figure.liquid loading="lazy" path=project.img sizes="(min-width: 832px) 280px, 92vw" alt=project.title class="research-card__image" %}
                  {% else %}
                    <span class="research-card__placeholder-label">
                      {% if category == "industry" %}Industrial application{% else %}Research theme{% endif %}
                    </span>
                    <span class="research-card__placeholder-number" aria-hidden="true">0{{ forloop.index }}</span>
                  {% endif %}
                </div>

                <div class="research-card__body">
                  <p class="research-card__eyebrow">
                    {% if category == "research" %}Research theme{% else %}Industrial application{% endif %}
                  </p>
                  <h3 class="research-card__title">{{ project.title }}</h3>
                  <p class="research-card__description">{{ project.description }}</p>
                  <span class="research-card__action">Explore project <span aria-hidden="true">→</span></span>
                </div>
              </article>
            </a>
          {% endfor %}
        </div>
      </section>
    {% endfor %}

{% else %}
{% assign sorted_projects = site.projects | sort: "importance" %}
<div class="row row-cols-1 row-cols-md-3">
{% for project in sorted_projects %}
{% include projects.liquid %}
{% endfor %}
</div>
{% endif %}

</div>
