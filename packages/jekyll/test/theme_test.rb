# frozen_string_literal: true

require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'jekyll'

# Builds a small Markdown site with the theme, the way someone using the gem
# would, and checks the pages come out in CMU's template
class ThemeTest < Minitest::Test
  def build(files)
    Dir.mktmpdir('jekyll-and-plaid') do |directory|
      source = File.join(directory, 'site')
      files.each do |name, text|
        FileUtils.mkdir_p(File.dirname(File.join(source, name)))
        File.write(File.join(source, name), text)
      end
      config = Jekyll.configuration('source' => source, 'destination' => File.join(directory, '_site'), 'quiet' => true)
      Jekyll::Site.new(config).process
      yield File.join(directory, '_site')
    end
  end

  SITE = {
    '_config.yml' => <<~YAML,
      title: Andrew Carnegie's Project
      description: A line under the name
      theme: cmu-web-jekyll-and-plaid
      plugins:
        - jekyll-default-layout
        - jekyll-optional-front-matter
        - jekyll-readme-index
        - jekyll-relative-links
        - jekyll-titles-from-headings
    YAML
    'README.md' => "# Welcome\n\nSee [Getting Started](getting-started.md).\n",
    'getting-started.md' => "# Getting Started\n\n| One | Two |\n| --- | --- |\n| a | b |\n"
  }.freeze

  def test_a_markdown_site_comes_out_in_the_template
    build(SITE) do |out|
      home = File.read(File.join(out, 'index.html'))
      assert_includes home, 'https://www.cmu.edu/common/standard-v6/css/main.6.7.min.css'
      assert_includes home, 'cmu-web-kilt'
      assert_includes home, "Andrew Carnegie&#39;s Project"
      assert_includes home, 'href="/getting-started.html"', 'links between Markdown files become page links'
      refute_includes home, 'googletagmanager', 'a site without cmu.google_tag loads no analytics'

      page = File.read(File.join(out, 'getting-started.html'))
      assert_match %r{<title>Getting Started}, page, 'the first heading is the title'
      assert_includes page, '<table'
    end
  end

  def test_the_theme_script_is_copied_into_the_site
    build(SITE) do |out|
      assert File.file?(File.join(out, 'assets/js/jekyll-and-plaid.js'))
    end
  end
end
