# Contributing

For setup and checks, see [Development](DEVELOPMENT.md).

## Report a Problem

Check existing issues first, then
[report a problem](https://github.com/cmu-web/cmu-web-jekyll-and-plaid/issues/new?template=bug_report.yml).
Say whether you use `remote_theme` on GitHub Pages or the gem with Jekyll 4,
with a small Markdown example if you can.

## Submit a Pull Request

- Branch from `0.x` and open the pull request against `0.x`.
- Keep it to one concern.
- Explain the problem, the resulting behavior and how you checked the change.
- Run the gem's tests (`bundle exec rake test` in `packages/jekyll`; see
  [Check a Change](DEVELOPMENT.md#check-a-change)) before submitting. The
  Publish Gem workflow runs them again on the pull request.
- For a change to how pages look, include before-and-after screenshots.

## Code and Writing Style

- Follow the Web Kilt's [writing
  conventions](https://webkilt.andrew.cmu.edu/0/conventions.html) for
  documentation: AP style, and Title Case for headings, buttons and labels.
- Use made-up content in examples, and Andrew Carnegie (ac00) for a person.
- Use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
  for commit subjects.

## CMU's Names and Marks

CMU's names, marks and artwork aren't covered by the license. Use them only
as the project already does.
