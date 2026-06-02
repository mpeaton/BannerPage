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

### Adding Your Custom Domain (amdgtechnologies.com from GoDaddy)

1. In your Amplify app, go to **Domain management** → **Add domain**.
2. Enter `amdgtechnologies.com`.
3. Amplify will:
   - Verify domain ownership (you'll get a CNAME record to add at GoDaddy for verification).
   - Provide the DNS records you need to add at GoDaddy.
4. **Important for your Google Workspace email:**
   - **Do NOT change your nameservers at GoDaddy.**
   - Add only the specific records Amplify asks for (usually a CNAME for `www` pointing to the Amplify domain, and verification CNAMEs).
   - Your existing MX records for Google Workspace (for mpeaton@ and info@) must stay exactly as they are.
5. For the apex domain (`amdgtechnologies.com` without www):
   - Amplify will give you instructions. If GoDaddy doesn't support the required record type easily, a common pattern is:
     - Make `www.amdgtechnologies.com` the primary.
     - Set up a redirect from the root to www (Amplify can help, or use GoDaddy's domain forwarding as a temporary measure).
   - Once added, Amplify provisions a free SSL cert automatically.

6. Wait for DNS propagation (usually 5-30 minutes, up to a few hours).
7. In Amplify, enable "HTTPS" (it should be automatic) and set your preferred domain (www or non-www).

### Testing Email After Domain Changes
After adding the DNS records:
- Send a test email to both `mpeaton@amdgtechnologies.com` and `info@amdgtechnologies.com`.
- Send from those addresses too.
- If email breaks, double-check that you didn't accidentally modify the MX records.

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
   - Because we committed `amplify.yml` in the repo, Amplify should auto-detect it and pre-fill:
     - **Frontend build command**: `echo "Static assets ready for deployment"`  
       (or you can leave this field blank — the `amplify.yml` takes precedence for static sites)
     - **Build output directory**: `html`
   - If the fields are editable / you see an "Override build settings" option, set them exactly as above.
   - Save and deploy. First build usually takes 1-3 minutes.

   **Key point**: This site is 100% static (no package.json, no build tools). The only thing Amplify needs to know is "serve everything from the `html/` folder". The `amplify.yml` we added makes this explicit and future-proof.

4. **Add custom domain**
   - In the app dashboard: Domain management (left sidebar) → Add domain.
   - Type `amdgtechnologies.com` and continue.
   - Amplify will:
     - Ask you to add verification CNAME records at GoDaddy (usually 1-2 records like `_xxxx.amdgtechnologies.com`).
     - Once verified, show the records for `www` (CNAME to your Amplify domain) and possibly apex.
   - Go to your GoDaddy DNS manager and add **exactly** those records (do not touch the existing MX records for Google Workspace).

5. **Wait for propagation + SSL**
   - Amplify will issue a free SSL certificate (can take 5-30 mins).
   - You can choose the default domain (www or non-www) in the domain settings.

6. **(Optional but recommended) Add redirect for apex → www**
   - In Amplify: Domain management → your domain → Edit → Add redirect rule:
     - Source: `https://amdgtechnologies.com`
     - Target: `https://www.amdgtechnologies.com`
     - Type: 301 (permanent)

7. **Test**
   - Visit https://www.amdgtechnologies.com
   - Verify the animation plays, links work.
   - Send/receive test emails to confirm Google Workspace is untouched.

**Tip:** You can also connect a custom domain later. The Amplify-provided URL (e.g. main.dxxxx.amplifyapp.com) is always available for testing.

## Files Ready for Amplify
- `amplify.yml` (root) — configuration for static hosting.
- `html/` folder — everything Amplify needs to publish (index.html + resources/ with final MP4 and PNG poster).
- The video and poster are already optimized in size for web delivery.

## Next Steps
1. Push the code to a Git repository (GitHub recommended).
2. Go to AWS Amplify Console and connect the repo (or use manual deploy for testing).
3. Add your custom domain `amdgtechnologies.com` in Amplify.
4. Add the DNS records Amplify provides to your GoDaddy DNS settings.
5. Once live, update the LinkedIn post draft and announce.

The site is ready. The animation (with red EKG on M and green electricity on G) will be served efficiently.

If you run into any specific step (e.g. exact DNS records from Amplify, or issues with apex domain), paste the details here and I'll help troubleshoot immediately.
