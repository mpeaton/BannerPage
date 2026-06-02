# Hosting & Deployment Guide for AMDG Technologies Site

## Current Site
- Pure static site (HTML + CSS + JS + one video + one image).
- Main file: `html/index.html`
- Assets live in `html/resources/` (including the final animation `amdg-animation-final.mp4` and poster).
- The animation is the hero and the star of the site.

**No server-side code is required.** Any static hosting solution will work perfectly.

## Recommended Hosting Options (ranked for your situation)

**You have chosen AWS Amplify** because you want to stay in the AWS ecosystem for future apps and services. This is a great choice.

### Primary Recommendation: AWS Amplify (Static Hosting)

**Why this is perfect for you:**
- Stays 100% in your existing AWS account.
- Extremely easy for static sites (very similar to Netlify/Vercel in experience).
- Automatic global CDN via CloudFront under the hood.
- Free tier is generous (plenty for this site + room to grow into full-stack later).
- Built-in CI/CD if you connect a Git repo.
- Easy custom domain + free managed SSL certificate.
- When you're ready to add backend (API, auth, database, Lambda, etc.), it's seamless in the same Amplify project.
- `amplify.yml` is already prepared in the root of this project.

**amplify.yml** (already created):
It tells Amplify that this is a pure static site and the publish directory is `html/` (where `index.html` and `resources/` live).

### Detailed Steps to Deploy with AWS Amplify

#### Option 1: Connect Git Repository (Recommended for ongoing development)
This project is **already on GitHub**: `git@github.com:mpeaton/BannerPage.git` (branch: `master`).

The repo has been prepared with:
- `amplify.yml`
- Updated site in `html/`
- `DEPLOYMENT.md`, top-level `README.md`, etc.
- `.gitignore`

1. Make sure your local changes (including the new deployment files we added) are committed and pushed:
   ```bash
   git add .
   git commit -m "Prepare for AWS Amplify + update site with final animation"
   git push origin master
   ```
   (We have already committed the key files locally in this session: amplify.yml, DEPLOYMENT.md, top-level README, .gitignore enhancements, updated index.html, and the final assets.)

   The .gitignore now excludes historical design folders (logos/ etc.), old Netlify/Vercel configs, .DS_Store, legacy Python files, etc., keeping the repo clean for Amplify.

2. Go to the AWS Amplify Console: https://console.aws.amazon.com/amplify/
3. Click "New app" → "Host web app".
4. Connect your Git provider (GitHub) and select the repository `mpeaton/BannerPage` and branch `master`.
5. Amplify will detect the `amplify.yml` (we prepared it) and should auto-configure:
   - Build settings: Use the provided `amplify.yml`
   - Publish directory: `html`
6. Review and click "Save and deploy". It will build and deploy automatically.
7. Once deployed, you'll get a URL like `https://main.xxxxx.amplifyapp.com`.

**Note:** If Amplify doesn't auto-detect the publish dir, manually set it to `html` in the app settings after creation.

#### Option 2: Manual Deploy (Drag & Drop / ZIP - Good for quick start)
1. In Amplify Console: New app → Deploy without Git.
2. Drag and drop the entire `html/` folder (or zip the contents of `html/` and upload).
3. Name your app and deploy.
4. Note: For updates you'll need to re-upload, so Git-connected is better long-term.

### Adding Your Custom Domain (amdgtechnologies.com from GoDaddy) — Important: Decline the Route 53 Hosted Zone

**Critical warning for your situation (Google Workspace email on GoDaddy):**

When you click "Add domain" in Amplify and enter `amdgtechnologies.com`, AWS will often show a prominent option like:

> "Create a hosted zone in Route 53" or "Let Amplify manage your DNS with Route 53" or "Create hosted zone".

**Do NOT choose this.** 

Choosing it will:
- Create a new hosted zone in Route 53.
- Give you new nameserver values.
- Require you to change the nameservers at GoDaddy to Route 53's nameservers.
- This will **break your Google Workspace email** (MX records) unless you manually recreate every single email-related record (MX, SPF, DKIM, DMARC, etc.) in Route 53 perfectly. This is error-prone and risky.

**Correct action on that screen:**

- Look for and select the option that says something like:
  - "I'll add the records myself" 
  - "Manage DNS at my current registrar (GoDaddy)"
  - "Add records manually"
  - Or any choice that does **not** involve creating a Route 53 hosted zone / changing nameservers.

- Amplify will then show you the **exact list of records** you need to add at GoDaddy (verification CNAMEs + www CNAME + possibly apex A records).

**Then:**
1. Go to GoDaddy → Manage DNS for amdgtechnologies.com.
2. Add **only** the new records Amplify listed. Copy them exactly (type, name, value).
3. **Do not delete or modify** any existing records, especially the MX records for Google Workspace.
4. Save.

Amplify will detect the records once they propagate and issue the SSL certificate.

**On the screen you are currently on (subdomain mapping + SSL choice):**

This is the configuration screen for mapping your subdomains (like www) to specific branches of your app, and choosing how to handle the SSL certificate.

- The subdomain mappings look good (pointing to the "master" branch, which has your latest code).
- The "Exclude root" is for not including the apex in that particular mapping if desired.
- There is a checkbox for setting up a redirect (likely for the apex domain to www.amdgtechnologies.com or vice versa) – enable it if you want the naked domain to redirect to www.

**For the SSL certificate question:**

**Yes, let Amplify manage your SSL certificate.** 

Change the radio button selection from "Custom SSL certificate" to **"Amplify managed certificate"** (the top one).

- This is the recommended and simplest option.
- Amplify will automatically create and manage a free SSL certificate for you in AWS Certificate Manager (ACM), including validation (using the DNS records you will add) and automatic renewal.
- The "Custom SSL certificate" option is for advanced users who want to import or use their own existing certificate from ACM. Since none are found, it would require you to create one manually first, which is unnecessary here.

After selecting Amplify managed, complete any other config (the subdomain fields), then click the **"Add domain"** button at the bottom right.

After clicking "Add domain", Amplify will display the specific DNS records (these will be CNAME records) that you must add in your GoDaddy DNS manager.

Go add exactly those in GoDaddy (as CNAME record type), without changing nameservers or touching your email MX records.

Then return to Amplify to verify.

This should get your custom domain live with HTTPS.

### Recommended DNS Strategy (Stay with GoDaddy for now)

- Keep your nameservers at GoDaddy (this protects email).
- Only add the specific A/CNAME records Amplify provides for the custom domain.
- Make `www.amdgtechnologies.com` your primary (add the CNAME for www).
- For the naked domain (`amdgtechnologies.com`), you can:
  - Add the A records Amplify provides (if given), or
  - Use GoDaddy's domain forwarding (forward the root to www) as a simple temporary/permanent solution.
- In Amplify, after the domain is verified, go to Domain management → your domain → Edit and add a 301 redirect rule from the apex to www for a clean experience.

### After Adding Records in GoDaddy

- Wait for propagation (use https://www.whatsmydns.net/ to check).
- Back in Amplify Domain management, the status should change to "Available".
- Amplify will automatically provision a free SSL certificate (can take 5-60 minutes; watch the status).
- Once "Issued", your site will be live on https://www.amdgtechnologies.com (and the apex if you set it up).

### Test After Custom Domain + SSL

- Visit https://www.amdgtechnologies.com and https://amdgtechnologies.com
- Run the full test checklist (animation plays correctly with red EKG / green PCB electricity, no console errors, links work, responsive).
- Send/receive test emails to both addresses to confirm Google Workspace is 100% intact.

**Safety net**: If anything goes wrong, remove the custom domain in Amplify (it immediately falls back to the Amplifyapp.com URL). Your email will continue working because you never touched the MX records.

If Amplify is forcing the hosted zone or the options aren't clear, copy-paste the exact text/options you see on the screen here and I'll give you the precise clicks.

### Updating the Live Site
- With Git connected: Just push changes. Amplify will redeploy.
- The video (`amdg-animation-final.mp4`) and poster are in `html/resources/` and will be served efficiently.

### Future-Proofing for Apps/Services
When you want to add backend:
- In the same Amplify app, you can add:
  - API (GraphQL or REST with AppSync or API Gateway + Lambda)
  - Authentication (Cognito)
  - Database (DynamoDB, etc.)
  - Functions
  - Hosting for multiple frontends if needed
All under one project and one billing account.

### DNS Strategy (Keep DNS at GoDaddy)
- Manage DNS at GoDaddy to protect your Google Workspace email configuration.
- Only add the A/CNAME records that Amplify tells you to add.
- Do not point nameservers to AWS unless you are prepared to fully manage DNS (including recreating all Google Workspace records in Route 53).

### Cost Estimate
- Amplify hosting for a small static site like this: usually $0/month on the free tier.
- Custom domain + SSL: free.
- Data transfer: very low for this site.
- As you add backend services, costs will scale with usage (still very affordable to start).

### Files Prepared for Amplify
- `amplify.yml` — root of the project (tells Amplify this is static and where the files are).
- `html/index.html` + `html/resources/` — the complete site (including the final animation).

### Post-Deployment
- Update `linkedin-post-draft.md` with the live `https://www.amdgtechnologies.com` URL.
- Consider setting up a redirect from the root to www in Amplify (under Rewrites and redirects) if you want the apex to forward.
- Monitor in the Amplify console (analytics, logs, etc. are available even for static hosting).

---

## Other Options (for reference)

### Firebase Hosting (Google ecosystem)
Still viable since you have Google Business, but since you chose AWS for ecosystem consistency, we're focusing on Amplify.

### GoDaddy Hosting
Not recommended (more expensive, less performant).

### S3 + CloudFront (more manual control)
Only if you specifically want to avoid Amplify's managed experience. More steps for custom domain and SSL.

See the older sections below if you ever want to switch.

## Quick DNS + Email Reminder
- Keep your DNS management at GoDaddy (do not change nameservers).
- This protects your existing Google Workspace email configuration (MX records for mpeaton@ and info@).
- Amplify will tell you exactly which additional CNAME records to add at GoDaddy for the custom domain and verification.
- Test email thoroughly after adding records.

## Detailed AWS Amplify Console Steps (Current Choice)

1. **Sign in to AWS Console** → Search for "Amplify" → Go to Amplify Hosting.

2. **Create new app**
   - "New app" → "Host web app" (or "Deploy without Git" for testing).
   - If using Git: Authorize your Git provider, select repo and branch (main/master).
   - Amplify should auto-detect the `amplify.yml` file.

3. **Review build settings**
   - Because we committed `amplify.yml` in the repo, Amplify should auto-detect it.
   - On the "Build settings" screen it will likely show (or you can set via "Override build settings"):
     - **Frontend build command**: `echo "Static assets ready for deployment"`
       (or leave the field blank — the amplify.yml takes precedence)
     - **Build output directory**: `html`
   - Accept the detected values or override to exactly match above.
   - If you see a full YAML editor / "Edit" link for the build spec (common on this screen), you **can paste the entire content of your local `amplify.yml` file** there. That's perfectly valid and explicit. Just copy the whole file and paste it in.
   - Save and deploy. First build usually takes 1-3 minutes.

   **Key point**: This site is 100% static (no package.json, no build tools). The only thing Amplify needs to know is "serve everything from the `html/` folder". The `amplify.yml` we added makes this explicit and future-proof. Pasting the full YML is one of the cleanest ways if the simple two fields feel limited.

## Testing Your Amplify Deployment (Right Now)

Since your app is already pushed and set up in Amplify:

1. **Find your current Amplify URL**:
   - Go to the AWS Amplify Console > your app.
   - On the overview page, look for the "Hosting" section or the branch (usually "main" or "master").
   - Click the link — it will be something like `https://main.<random-id>.amplifyapp.com` or `https://<branch>.d<id>.amplifyapp.com`.
   - Open in incognito to bypass cache.

2. **Run these tests**:
   - Dark modern theme loads.
   - Hero video plays the approved animation (red EKG on M, green electricity following PCB traces on G, etc.).
   - Video loops, muted, background covers properly.
   - "Explore the Mark" scrolls to the logo section.
   - Links to LinkedIn/Facebook work.
   - Browser console (F12) has no 404 errors for the .mp4 or .png.
   - Mobile/responsive test (video still works, readable).
   - Video loads at reasonable speed (~1.5 MB file).

3. **Check build**:
   - In Amplify app > "Builds" or "Hosting" tab, confirm the latest push has a green success.
   - If red, click the build to see logs.

4. **Pre-DNS email test**:
   - Send/receive tests to `info@amdgtechnologies.com` and `mpeaton@amdgtechnologies.com` to confirm Google Workspace still works.

**Tip:** Keep using this Amplify URL for testing until the custom domain is fully live and SSL issued.

## (Duplicate section removed - see the detailed "Adding Your Custom Domain" instructions and the "Testing Your Amplify Deployment" section above for current guidance)

**Only do this after the Amplify URL tests above pass cleanly.**

1. In Amplify Console:
   - Open your app.
   - Left menu: **Domain management** → **Add domain**.
   - Enter `amdgtechnologies.com` → Continue.

2. Amplify will show steps:
   - **Verification records** (usually 1-2 CNAMEs like `_acme-challenge....`).
   - **Routing records** (CNAME for `www`, A records for the apex `@`).

3. Go to GoDaddy:
   - Domain → Manage DNS.
   - Add **exactly** the records Amplify listed.
   - **Do NOT delete or change** any existing MX, SPF, DKIM, DMARC, or other Google Workspace records.

4. Wait for DNS propagation (5 min – few hours):
   - Check with https://www.whatsmydns.net/ for both `amdgtechnologies.com` and `www.amdgtechnologies.com`.
   - Or `dig amdgtechnologies.com` and `dig www.amdgtechnologies.com`.

5. Back in Amplify:
   - Status should update to "Available".
   - Amplify auto-provisions free SSL (can take 5-60+ minutes). Watch the status.

6. (Strongly recommended) Set up apex redirect:
   - In Domain management for your domain → Edit.
   - Add redirect:
     - Source: `https://amdgtechnologies.com/*`
     - Target: `https://www.amdgtechnologies.com/:splat`
     - Type: 301

7. Final custom-domain tests:
   - Visit both https://www.amdgtechnologies.com and https://amdgtechnologies.com.
   - Run the full test checklist from the "Testing Your Amplify Deployment (Right Now)" section.
   - Re-confirm email still works perfectly.

**Safety net**: If DNS gets messed up, just remove the custom domain in Amplify (it reverts to the Amplify URL). Your email MX records are untouched as long as you only *added* records in GoDaddy.

## Quick Reference - What to Do Next (Current State)

- Test the current Amplify URL immediately (detailed checklist in "Testing Your Amplify Deployment (Right Now)").
- Once happy, go to Domain management in Amplify → Add domain.
- **Decline the Route 53 hosted zone creation.** Choose manual records at GoDaddy.
- Add **exactly** the records Amplify lists (preserve all Google Workspace MX etc. records).
- Wait for propagation + SSL.
- Set up apex redirect if desired.
- Re-test + update LinkedIn draft.

Future changes: just push to master — Amplify auto-deploys.

If you hit any error on the screen (especially the hosted zone prompt text), paste the exact options here and I'll give the precise click.
