# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Hugo-based static blog ("Strawberry Fields") deployed to GitHub Pages at `https://hjkunst.github.io/`. Content covers design and development topics in Korean and English.

## Build & Development Commands

```bash
# Local dev server with live reload
hugo server

# Production build (output to public/)
hugo --cleanDestinationDir --minify

# Deploy to GitHub Pages (force-pushes public/ to hjkunst/hjkunst.github.io)
./deploy.sh
```

CI/CD runs automatically via `.github/workflows/hugo-deploy.yml` on push to `main`.

## Architecture

- **Theme:** `hugo-discaptive` (Git submodule in `themes/`). Customized heavily via layout overrides and `assets/css/custom.css`.
- **Layout overrides** in `layouts/` take precedence over theme templates. Key customizations:
  - `_default/single.html` — Post template with Schema.org structured data, sticky TOC sidebar, Giscus comments, and banner image support
  - `_default/list.html` — Archive/index with sidebar and pagination
  - `partials/head.html` — GA4 tracking (G-YS9Z2BGZ1Q), OG/Twitter meta tags, MathJax config
  - `partials/head/css.html` — CSS asset pipeline (minified + SRI in production, direct link in dev)
  - `partials/post-summary.html` — Post card component with image, tags, summary
- **CSS:** `assets/css/custom.css` contains all custom styling — color theme (teal/aqua palette), typography (Pretendard for Korean, Satoshi for Latin), Catppuccin Latte syntax highlighting, responsive grid layouts, MathJax block styling. CSS custom properties defined at root.
- **Content:** Posts in `content/posts/` with front matter: `title`, `date`, `tags`, `image` (optional banner). Images stored in `static/` subdirectories per post.
- **Config:** `hugo.toml` enables MathJax, `buildFuture`, unsafe HTML in Markdown, and minification for CSS/HTML/JS. Pagination set to 5.

## Key Conventions

- Post filenames follow `YYYY-MM-DD-slug.md` format
- Post images go in `static/<post-slug>/` and are referenced as `/<post-slug>/filename.ext`
- Theme color is `#FF6254` (coral); CSS primary is `rgb(124, 181, 185)` (teal)
- Hugo submodule must be initialized: `git submodule update --init --recursive`
