# Jekyll & Plaid as a Gem

Jekyll & Plaid is a Jekyll theme in Carnegie Mellon style: Markdown docs
pages and full-width home pages in CMU's web template, with the
[Carnegie Mellon Web Kilt](https://webkilt.andrew.cmu.edu/). This gem is
for sites you build yourself with Jekyll 4, locally or in GitHub Actions.

The gem lives in the theme repository's `packages/jekyll/`. Each release
of the theme publishes it at the same version.

## On GitHub Pages

GitHub Pages builds only its own list of theme gems, so a Pages site uses
the theme straight from GitHub instead; it doesn't take this gem. In
`_config.yml`:

```yaml
remote_theme: cmu-web/cmu-web-jekyll-and-plaid
```

## In Your Own Build

Add the gem to your site's `Gemfile`:

```ruby
gem 'jekyll', '~> 4.4'
gem 'cmu-web-jekyll-and-plaid', '~> 0.1'
```

Then name the theme in `_config.yml`, with the plugins it counts on. They
do what GitHub Pages does for every site: a layout for every page, the
first heading as a page's title, pages without front matter, `README.md` as
the home page and links between Markdown files.

```yaml
title: Your Office or Project
description: A line under the name
theme: cmu-web-jekyll-and-plaid
plugins:
  - jekyll-default-layout
  - jekyll-optional-front-matter
  - jekyll-readme-index
  - jekyll-relative-links
  - jekyll-titles-from-headings
```

The gem installs those plugins for you. For the footer's link to your
repository, add `jekyll-github-metadata` to your `Gemfile` and plugins too,
and name the repository in `_config.yml` (`repository: your-org/your-repo`).

[Writing Pages](https://jekyllandplaid.andrew.cmu.edu/writing.html) covers
the pages, the home page's sections and the settings you can change.

## Work on the Gem

```bash
cd packages/jekyll
bundle install
bundle exec rake test build
```

`rake assets` (run by `test` and `build`) copies the theme's `_layouts/`,
`_includes/` and `assets/` and the license into the gem, and takes its
version from the latest release tag. The test builds a small Markdown site
with the theme. `rake clean` removes the copies and the build.
