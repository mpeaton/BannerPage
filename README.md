# AMDG Technologies, Inc. Website

This is the source for the AMDG Technologies website.

## Current Status (Live)
- **Logo + Animation**: The final approved version is the simple 2x2 animated blocks (no robot arm).
  - A: semantic/AI network (blue)
  - M: red with animated EKG trace (medical signal processing)
  - D: gold compass
  - G: green with PCB + green electricity animation following the traces
- **Video**: `html/resources/amdg-animation-final.mp4` (with original audio track; sound toggle available on site) + poster `amdg-poster.png`
- **Website**: Modern dark single-page site with the animation as full-bleed hero (including optional sound toggle). Live at https://www.amdgtechnologies.com/. See `html/index.html`.

## Hosting
**Using AWS Amplify** (chosen to stay in AWS ecosystem for future apps/services).

- GitHub repo: https://github.com/mpeaton/BannerPage (branch: master)
- The repo is prepared (amplify.yml, site updates, docs committed).
- Configuration: `amplify.yml` (tells Amplify this is static and output dir is `html/`)
- Full deployment guide: `DEPLOYMENT.md` (includes exact Amplify steps for this repo, DNS notes for GoDaddy + Google Workspace email preservation)
- Domain: amdgtechnologies.com (managed at GoDaddy for email compatibility)

### Amplify Console Build Settings
When you reach the "Build settings" screen while creating the app from the GitHub repo (or via "Override build settings"):
- **Frontend build command**: `echo "Static assets ready for deployment"` (or leave blank)
- **Build output directory**: `html`

Amplify should auto-detect the `amplify.yml` we committed. If it offers "Override build settings", use the values above.

You can also paste the *entire content* of the `amplify.yml` file into the full YAML build spec editor on that screen (look for an "Edit" link or YAML view). This is a perfectly valid and explicit option if you prefer to paste the whole thing.

No complex build command is needed — this is a pure static site. The `amplify.yml` handles everything.

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

## Live Site
- https://www.amdgtechnologies.com/ (primary)
- Apex (amdgtechnologies.com) currently resolves via existing Google records/forwarding (www is the connected hostname in Amplify).

The site is fully deployed and live via AWS Amplify + custom domain from GoDaddy (with Google Workspace email preserved).

## Next
See `DEPLOYMENT.md` for ongoing maintenance, updates (just `git push`), and any apex setup details.
