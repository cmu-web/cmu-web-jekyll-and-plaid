# Development

Set up your computer once with
[Working on CMU Web Projects](https://github.com/cmu-web/.github/blob/main/DEVELOPMENT.md);
this page covers this project's own commands.

Jekyll & Plaid is a Jekyll theme. The theme is `_layouts/`, `_includes/` and
`assets/` at the root of the repository, where GitHub's `remote_theme` looks
for them. Two layouts share the includes in `_includes/cmu/`: `default` puts
Markdown in one column, and `sections` puts a page's own template sections
straight into `#content`. `docs/` is the docs site's source, and
`packages/jekyll/` is the theme as a gem.

## Build It

`docs/` uses the theme the way any site does:
`remote_theme: cmu-web/cmu-web-jekyll-and-plaid@0.x` in `docs/_config.yml`.
Build it with the same gems GitHub Pages uses:

```bash
cd docs
bundle install
PAGES_REPO_NWO=cmu-web/cmu-web-jekyll-and-plaid bundle exec jekyll serve
```

`PAGES_REPO_NWO` names the repository, which the footer links to. The build
fetches the theme from GitHub's `0.x` branch, so it shows the theme as
pushed, not your changes. GitHub Pages also publishes a test copy of `docs/`
from the `0.x` branch.

### Preview Theme Changes

A site's own layouts and includes win over its theme's, so copy the theme
into `docs/` to see unpushed changes, then remove the copies (they're
ignored by git):

```bash
cd docs
cp -r ../_layouts ../_includes ../assets .
PAGES_REPO_NWO=cmu-web/cmu-web-jekyll-and-plaid bundle exec jekyll serve
rm -rf _layouts _includes assets
```

## Check a Change

The everyday check is the gem's tests: they need Ruby and Bundler, and no
network access once the gems are installed. `packages/jekyll/` builds the
theme as a gem, with copies of the theme's files, and its tests build a
small Markdown site with it:

```bash
cd packages/jekyll
bundle install
bundle exec rake test
```

The Publish Gem workflow runs the same tests on every push and pull request.
For a change to how pages look, also preview the docs site with your changes
(see [Preview Theme Changes](#preview-theme-changes)).

## Maintain the Docs Preview

The docs site publishes `docs/images/cmu-web-preview.webp` for cards and
gallery entries on the other CMU Web sites. Keep it a clean 1040 × 656
screenshot without a decorative browser frame, and replace it at the same
path so those sites can use the public URL directly. Its Open Graph image,
`docs/images/preview.jpg`, is maintained separately.

To make it, capture the published home page with FencePost's gallery
command, from a FencePost checkout. It takes the public page at 1040 × 656,
signed out, with the menu closed:

```bash
npm run gallery -- https://themes.andrew.cmu.edu/jekyll-and-plaid/0/ /path/to/cmu-web-jekyll-and-plaid/docs/images/cmu-web-preview.webp
```

## Release

The version tag is the version. Tag a commit on the `0.x` branch (e.g.,
`0.2.9`), push it and create the tag's GitHub release with its notes. The
tag starts two workflows:

- **Attach Release Files** builds `docs/` with the `github-pages` gem, as
  GitHub Pages does, with the theme pinned to that tag, under
  `/jekyll-and-plaid/0/`. It waits for the tag's release and attaches the
  site to it as `site.tar.gz`.
- **Publish Gem** publishes the gem at the tag's version, with trusted
  publishing, so there's no API key to store. RubyGems.org trusts it as:
  GitHub Actions, owner `cmu-web`, repository `cmu-web-jekyll-and-plaid`,
  workflow `publish-gem.yml` and environment `rubygems`. Renaming the
  workflow file stops publishing until that trusted publisher is changed to
  match.
