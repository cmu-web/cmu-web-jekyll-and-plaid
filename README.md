# Jekyll & Plaid

A theme with a checkered past: GitHub Pages sites in CMU style, built from
Carnegie Mellon's web template and the
[Carnegie Mellon Web Kilt](https://webkilt.andrew.cmu.edu/). Write your
docs in Markdown the way you already do, and build a home page from the
template's full-width sections; both match the rest of cmu.edu.

## Use It

In your repository's `_config.yml`, name the theme and your site:

```yaml
remote_theme: cmu-web/cmu-web-jekyll-and-plaid
title: Your Office or Project
description: A line under the name
```

Then turn on GitHub Pages for the repository, building from the branch and
folder that hold your Markdown. If you build with GitHub Actions instead, name
your repository in `_config.yml` too (`repository: your-org/your-repo`), since
the footer's link to it uses the name. Every `.md` file becomes a page, and the first
heading in each is its title. A `README.md` becomes the home page.

## What You Get

| Markdown                             | On the Page                                                                   |
| ------------------------------------ | ----------------------------------------------------------------------------- |
| Each page                            | The CMU header, navigation, breadcrumbs, footer                               |
| Tables                               | Striped tables, full width                                                    |
| Code blocks                          | Code boxes with a copy icon                                                   |
| `> [!NOTE]` and the other alerts     | Labeled callouts                                                              |
| Other block quotes                   | Notes                                                                         |
| An HTML page with `layout: sections` | Full-width template sections: heroes, full-width sections, cards and sidebars |
| `images/preview.jpg`                 | The picture in link previews                                                  |

See [Writing Pages](writing.md) for each one, and the settings you can change.

## Maintain the Docs Preview

The Jekyll & Plaid documentation site publishes `images/cmu-web-preview.webp`
for cards and gallery entries on the other CMU Web sites. Keep it a clean
1040-by-656-pixel screenshot without a decorative browser frame. Replace it
at the same path so those sites can use the public URL directly. Its Open
Graph image, `images/preview.jpg`, is maintained separately.

To make it, capture the published home page with FencePost's gallery
command, from a FencePost checkout. It takes the public page at 1040 × 656,
signed out, with the menu closed:

```bash
npm run gallery -- https://jekyllandplaid.andrew.cmu.edu/0/ /path/to/cmu-web-jekyll-and-plaid/images/cmu-web-preview.webp
```

## Release the Docs Site

jekyllandplaid.andrew.cmu.edu serves a built copy of this site. Pushing a
version tag, such as `0.1.0`, runs the
[release workflow](.github/workflows/release.yml). It builds the site with
the `github-pages` gem, as GitHub Pages does, and attaches it to the tag's
GitHub release as `site.tar.gz`. The server's configuration pins that file,
so the site changes only when the server moves to a new tag.

## Publish the Theme Gem

The same tag publishes the theme as a gem, `cmu-web-jekyll-and-plaid`, at
the tag's version, through the
[theme gem workflow](.github/workflows/rubygems.yml); see
[the gem's README](packages/jekyll/README.md) for using it. It uses trusted
publishing, so there's no API key to store, but RubyGems.org has to trust it first.
Do this once, before the first tag that should publish the gem:

1. Sign in to RubyGems.org with an account that has multi-factor
   authentication on.
2. Under Trusted Publishers, add a pending trusted publisher for the gem
   `cmu-web-jekyll-and-plaid`: GitHub Actions, owner `cmu-web`, repository
   `cmu-web-jekyll-and-plaid`, workflow `rubygems.yml` and environment
   `rubygems`.

Until then, the workflow's publish step fails on each tag; the docs site's
release is unaffected.

## License

BSD 3-Clause (see `LICENSE`), copyright Carnegie Mellon University. It
doesn't cover Carnegie Mellon's names and marks or its web template, which
the theme loads from www.cmu.edu.
