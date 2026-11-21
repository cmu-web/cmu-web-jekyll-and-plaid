# Jekyll & Plaid: Notes for AI Agents

Read [CONTRIBUTING.md](CONTRIBUTING.md) and [DEVELOPMENT.md](DEVELOPMENT.md)
before changing anything. The rules agents most often break here:

- Pages use CMU's template and the Web Kilt, nothing else.
- Before writing markup, find the component: ask the Web Kilt MCP server
  (https://webkilt.andrew.cmu.edu/mcp) or browse the Components page
  (https://webkilt.andrew.cmu.edu/0/components.html).
- Use the template's classes first, then the Kilt's (cmu-). Never add a
  project-specific class or a stylesheet rule here. If the Kilt lacks
  something, say so and stop; it gets added to the Kilt.
- Never copy the template's CSS or values; pages load it from www.cmu.edu.
- The theme is `_layouts/`, `_includes/` and `assets/` at the root, where
  `remote_theme` finds them. Don't move them, and never edit the copies in
  `packages/jekyll/` or `docs/` (both are made from the root and ignored by
  git).
- `docs/` is the public docs site, and it uses the theme through
  `remote_theme`; don't put notes there.
- The theme has to build on GitHub Pages (Jekyll 3 and its allowed plugins)
  and with the gem on Jekyll 4. Check both when a layout changes.
- Made-up people only (e.g., Andrew Carnegie, ac00).
- Follow the Web Kilt's [writing conventions](https://webkilt.andrew.cmu.edu/0/conventions.html).
- Versions use semantic versioning as plain numbers (e.g., `0.1.0`).
