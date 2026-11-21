# Deployment

## Release Files

Each version tag (e.g., `0.2.9`) has a GitHub release with:

| File          | What                                                                     |
| ------------- | ------------------------------------------------------------------------ |
| `site.tar.gz` | The docs site, built for `/jekyll-and-plaid/0/`, in one top-level folder |

The same tag publishes the theme as a gem, `cmu-web-jekyll-and-plaid`, at the
tag's version, and sites can pin the theme to it (e.g.,
`remote_theme: cmu-web/cmu-web-jekyll-and-plaid@0.2.9`).

## Install

A site uses the theme one of two ways:

- **On GitHub Pages:** name it with `remote_theme` in the site's
  `_config.yml`, as the [README](README.md#install) shows. GitHub fetches
  the theme on each build; add `@` and a tag to pin a release.
- **With Jekyll 4, built yourself:** add the gem; see
  [its README](packages/jekyll/README.md).

The [docs](https://themes.andrew.cmu.edu/jekyll-and-plaid/) cover writing
pages, full-width layouts and the settings.

### Serve the Docs Site

`site.tar.gz` is static. Unpack it and serve its folder at
`/jekyll-and-plaid/0/`, the address it was built for; a server that pins the
file changes only when it moves to a new tag.
