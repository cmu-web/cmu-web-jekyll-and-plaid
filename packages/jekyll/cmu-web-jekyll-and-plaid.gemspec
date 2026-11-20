# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'cmu-web-jekyll-and-plaid'
  # rake version writes the release tag here
  spec.version = File.file?('VERSION') ? File.read('VERSION').strip : '0.0.0'
  spec.authors = ['CMU Web']
  spec.summary = 'A Jekyll theme in Carnegie Mellon style'
  spec.description = "Jekyll & Plaid builds sites with Carnegie Mellon's web template and the Carnegie Mellon Web Kilt: Markdown docs pages and full-width home pages that look like cmu.edu."
  spec.homepage = 'https://jekyllandplaid.andrew.cmu.edu/'
  spec.license = 'BSD-3-Clause'
  spec.required_ruby_version = '>= 3.2'

  # The theme's files are copied in from the repository by rake assets
  spec.files = Dir['_layouts/**/*', '_includes/**/*', 'assets/**/*'] + %w[LICENSE README.md VERSION]
  spec.metadata = {
    'source_code_uri' => 'https://github.com/cmu-web/cmu-web-jekyll-and-plaid',
    'documentation_uri' => 'https://github.com/cmu-web/cmu-web-jekyll-and-plaid/tree/main/packages/jekyll#readme',
    'bug_tracker_uri' => 'https://github.com/cmu-web/cmu-web-jekyll-and-plaid/issues',
    'rubygems_mfa_required' => 'true'
  }

  # GitHub Pages builds with Jekyll 3 and uses remote_theme instead
  spec.add_dependency 'jekyll', '>= 4.3', '< 5'
  # The GitHub Pages defaults the theme counts on: a layout for every page,
  # titles from first headings, pages without front matter, README.md as a
  # folder's index and links between Markdown files
  spec.add_dependency 'jekyll-default-layout', '~> 0.1'
  spec.add_dependency 'jekyll-optional-front-matter', '~> 0.3'
  spec.add_dependency 'jekyll-readme-index', '~> 0.3'
  spec.add_dependency 'jekyll-relative-links', '~> 0.7'
  spec.add_dependency 'jekyll-titles-from-headings', '~> 0.5'
end
