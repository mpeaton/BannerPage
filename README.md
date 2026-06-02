# AMDG Technologies, Inc. Website

This is the source for the AMDG Technologies website.

## Current Status (Approved)
- **Logo + Animation**: The final approved version is the simple 2x2 animated blocks (no robot arm).
  - A: semantic/AI network (blue)
  - M: red with animated EKG trace (medical signal processing)
  - D: gold compass
  - G: green with PCB + green electricity animation following the traces
- **Video**: `html/resources/amdg-animation-final.mp4` (and poster `amdg-poster.png`)
- **Website**: Modern dark single-page site with the animation as full-bleed hero. See `html/index.html`.

## Hosting
**Using AWS Amplify** (chosen to stay in AWS ecosystem for future apps/services).

- GitHub repo: https://github.com/mpeaton/BannerPage (branch: master)
- The repo is prepared (amplify.yml, site updates, docs committed).
- Configuration: `amplify.yml` (tells Amplify this is static and output dir is `html/`)
- Full deployment guide: `DEPLOYMENT.md` (includes exact Amplify steps for this repo, DNS notes for GoDaddy + Google Workspace email preservation)
- Domain: amdgtechnologies.com (managed at GoDaddy for email compatibility)

### Amplify Console Build Settings
On the "Build settings" screen (during app creation from the connected repository, or via override):
- **Frontend build command**: `echo "Static assets ready for deployment"` (or leave blank)
- **Build output directory**: `html`

Amplify typically auto-detects the committed `amplify.yml`. Use "Override build settings" to match the values above if needed.

The full contents of `amplify.yml` can also be pasted into the YAML build spec editor on that screen (via "Edit" link or equivalent YAML view) for an explicit configuration. This is a valid approach.

No package install or complex build step is required — the site is purely static. The `amplify.yml` declares the output location.

## Key Files
- `html/index.html` + `html/resources/` — the live site
- `amplify.yml` — Amplify build settings
- `DEPLOYMENT.md` — hosting instructions
- `linkedin-post-draft.md` — suggested announcement post
- `html/resources/logos/` — all historical logo explorations + the approved final assets + review frames

## Quick Local Preview
From the project root:
```bash
cd html
python -m http.server 8000
```
Then open http://localhost:8000

## Next
Follow `DEPLOYMENT.md` to connect to AWS Amplify and point the GoDaddy domain.
