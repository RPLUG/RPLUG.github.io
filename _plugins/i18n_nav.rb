# frozen_string_literal: true

require "cgi"

module RplugI18n
  module_function

  def normalize_path(path)
    value = path.to_s.strip
    value = "/" if value.empty?
    value = "/#{value}" unless value.start_with?("/")
    return value if value == "/" || !File.extname(value).empty?

    value.end_with?("/") ? value : "#{value}/"
  end

  def with_baseurl(site, path)
    baseurl = site.config.fetch("baseurl", "").to_s
    baseurl = "" if baseurl == "/"
    "#{baseurl.sub(%r{/$}, "")}#{normalize_path(path)}"
  end

  def absolute_url(site, path)
    site_url = site.config.fetch("url", "").to_s.sub(%r{/$}, "")
    "#{site_url}#{with_baseurl(site, path)}"
  end

  def route_pair(routes, path)
    routes.find do |route|
      normalize_path(route["en"]) == path || normalize_path(route["zh"]) == path
    end
  end

  def validate_routes!(documents, routes)
    available_paths = documents.map { |document| normalize_path(document.url) }.uniq
    configured_paths = routes.flat_map { |route| [normalize_path(route["en"]), normalize_path(route["zh"])] }
    duplicate_paths = configured_paths.tally.select { |_path, count| count > 1 }.keys
    missing_paths = configured_paths.uniq - available_paths
    return if duplicate_paths.empty? && missing_paths.empty?

    problems = []
    problems << "duplicate routes: #{duplicate_paths.join(', ')}" unless duplicate_paths.empty?
    problems << "missing pages: #{missing_paths.join(', ')}" unless missing_paths.empty?
    raise Jekyll::Errors::FatalException, "Invalid bilingual route map (#{problems.join('; ')})"
  end

  def language_switch(site, pair, chinese)
    target_path = chinese ? pair["en"] : pair["zh"]
    label = chinese ? "EN" : "中文"
    target_lang = chinese ? "en" : "zh-CN"
    aria_label = chinese ? "Switch to English" : "切换到中文"

    <<~HTML
      <li class="nav-item language-switch">
        <a class="nav-link language-switch__link" href="#{CGI.escapeHTML(with_baseurl(site, target_path))}" lang="#{target_lang}" hreflang="#{target_lang}" aria-label="#{aria_label}">#{label}</a>
      </li>
    HTML
  end

  def insert_language_switch(output, markup)
    search_button = %r{<li class="nav-item">\s*<button id="search-toggle"}
    theme_button = %r{<li class="toggle-container">\s*<button id="light-toggle"}

    if output.match?(search_button)
      output.sub!(search_button) { "#{markup}#{Regexp.last_match(0)}" }
    elsif output.match?(theme_button)
      output.sub!(theme_button) { "#{markup}#{Regexp.last_match(0)}" }
    elsif output.include?("<!-- Search -->")
      output.sub!("<!-- Search -->", "#{markup}          <!-- Search -->")
    elsif output.include?("<!-- Toogle theme mode -->")
      output.sub!("<!-- Toogle theme mode -->", "#{markup}          <!-- Toogle theme mode -->")
    else
      output.sub!(%r{</ul>}, "#{markup}</ul>")
    end
  end

  def inject_hreflang(output, site, pair)
    tags = <<~HTML
      <link rel="alternate" hreflang="en" href="#{CGI.escapeHTML(absolute_url(site, pair["en"]))}">
      <link rel="alternate" hreflang="zh-CN" href="#{CGI.escapeHTML(absolute_url(site, pair["zh"]))}">
      <link rel="alternate" hreflang="x-default" href="#{CGI.escapeHTML(absolute_url(site, pair["en"]))}">
    HTML
    output.sub!("</head>", "#{tags}</head>")
  end

  def rewrite_nav_link(output, site, entry)
    english_href = with_baseurl(site, entry["en_path"])
    chinese_href = with_baseurl(site, entry["zh_path"])
    pattern = %r{(<a\s+class="nav-link"\s+href="#{Regexp.escape(english_href)}">)(.*?)(</a>)}m

    output.gsub!(pattern) do
      match = Regexp.last_match
      opening, body, closing = match.captures
      opening = opening.sub(%r{href="[^"]+"}, %(href="#{chinese_href}"))
      current = body[%r{<span class="sr-only">.*?</span>}m].to_s
      "#{opening}#{CGI.escapeHTML(entry["zh_title"].to_s)}#{current}#{closing}"
    end
  end

  def activate_nav_link(output, href)
    pattern = %r{<li class="nav-item(?:\s+active)?\s*">\s*(<a class="nav-link" href="#{Regexp.escape(href)}">)}m
    output.sub!(pattern) { %(<li class="nav-item active">#{Regexp.last_match(1)}) }
  end

  def rewrite_chinese_navigation(output, site, data, path)
    chinese_home = with_baseurl(site, "/zh/")
    output.sub!(
      %r{(<a class="navbar-brand title font-weight-lighter" href=")[^"]*(">)},
      "\\1#{chinese_home}\\2"
    )

    Array(data["nav"]).each { |entry| rewrite_nav_link(output, site, entry) }

    active_href = if path == "/zh/"
                    chinese_home
                  elsif path.start_with?("/zh/projects/")
                    with_baseurl(site, "/zh/research/")
                  else
                    with_baseurl(site, path)
                  end
    activate_nav_link(output, active_href)
  end

  def process(site)
    data = site.data["i18n"]
    return unless data.is_a?(Hash)

    routes = Array(data["routes"])
    documents = site.pages + site.collections.values.flat_map(&:docs)
    validate_routes!(documents, routes)

    documents.each do |document|
      next unless document.output_ext == ".html" && document.output&.include?("<html")

      path = normalize_path(document.url)
      pair = route_pair(routes, path)
      next unless pair

      chinese = normalize_path(pair["zh"]) == path
      output = document.output.dup
      output.sub!(%r{<html lang="[^"]*">}, %(<html lang="#{chinese ? "zh-CN" : "en"}">))
      if chinese
        output.sub!(%r{<meta property="og:locale" content="[^"]*">}, '<meta property="og:locale" content="zh_CN">')
        output.sub!('placeholder="Type to filter"', 'placeholder="输入关键词筛选"')
        rewrite_chinese_navigation(output, site, data, path)
      end
      insert_language_switch(output, language_switch(site, pair, chinese))
      inject_hreflang(output, site, pair)
      document.output = output
    end
  end
end

Jekyll::Hooks.register :site, :post_render do |site|
  RplugI18n.process(site)
end
