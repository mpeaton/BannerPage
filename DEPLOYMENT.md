# Hosting & Deployment Guide for AMDG Technologies Site

## Current Site
- Pure static site (HTML + CSS + JS + one video + one image).
- Main file: `html/index.html`
- Assets live in `html/resources/` (including the final animation `amdg-animation-final.mp4` and poster).
- The animation is the hero and the star of the site.

**No server-side code is required.** Any static hosting solution will work perfectly.

## Recommended Hosting: AWS Amplify (Static Hosting)

This project uses AWS Amplify for hosting. The choice keeps the site (and any future apps/services) inside the AWS ecosystem.

### Why AWS Amplify
- Works entirely inside your existing AWS account.
- Very easy for static sites (similar experience to Netlify or Vercel).
- Automatic global CDN (CloudFront under the hood).
- Generous free tier — plenty for this site and room to grow.
- Built-in CI/CD when you connect a Git repo.
- Easy custom domain + free managed SSL certificate.
- When you're ready to add backend (API, auth, database, Lambda, etc.) later, it is seamless in the same Amplify project.
- `amplify.yml` is already committed in the root.

**amplify.yml** (committed in root):
Tells Amplify this is a pure static site and the publish directory is `html/` (where `index.html` + `resources/` live).

### Detailed Steps to Deploy with AWS Amplify

#### Option 1: Connect Git Repository (Recommended)
This project lives on GitHub: https://github.com/mpeaton/BannerPage (branch: `master`).

The repo is already prepared with:
- `amplify.yml`
- The site in `html/`
- This `DEPLOYMENT.md`, top-level `README.md`, etc.
- `.gitignore` (excludes design history under logos/, old Netlify/Vercel configs, legacy Python files, etc. so deploys stay clean)

1. Commit and push your changes (including any updates to the site or docs):
   ```bash
   git add .
   git commit -m "Prepare for AWS Amplify + update site with final animation"
   git push origin master
   ```

2. Go to the AWS Amplify Console: https://console.aws.amazon.com/amplify/
3. Click "New app" → "Host web app".
4. Connect your Git provider (GitHub) and select the `mpeaton/BannerPage` repository + `master` branch.
5. Amplify should detect the `amplify.yml` and auto-configure:
   - Build settings from the file
   - Publish directory: `html`
6. Review and click "Save and deploy". It will build and deploy automatically.
7. Once deployed you'll get a URL like `https://main.xxxxx.amplifyapp.com`.

**Note:** If Amplify doesn't auto-detect the publish dir, manually set it to `html` in the app settings after creation.

#### Option 2: Manual Deploy (Drag & Drop / ZIP — for quick testing)
1. In Amplify Console: New app → Deploy without Git.
2. Drag and drop the entire `html/` folder (or zip its contents and upload).
3. Name your app and deploy.
4. Note: For ongoing work, Git-connected is much better — just push to trigger new builds.

### Adding a Custom Domain — Important: Manual DNS Records Only (Protect Email)

**Critical: Do not let Amplify create a Route 53 hosted zone if your domain's DNS (and especially email MX records) are managed at an external registrar such as GoDaddy.**

When you add a custom domain in Amplify and enter your domain (e.g. `amdgtechnologies.com`), AWS will often prominently offer to "Create a hosted zone in Route 53" or "Let Amplify manage your DNS with Route 53".

**Do NOT choose this option.**

It would:
- Create a new hosted zone in Route 53.
- Give you new nameserver values.
- Require you to change the nameservers at your registrar (GoDaddy).
- Almost certainly break email (Google Workspace or other) unless you perfectly recreate every MX, SPF, DKIM, DMARC, etc. record in Route 53. This is risky and error-prone.

**Correct action:**

Choose the manual path instead:
- "I'll add the records myself"
- "Manage DNS at my current registrar"
- "Add records manually"
- Or any option that does *not* involve creating a Route 53 hosted zone or changing your registrar's nameservers.

Amplify will then show the exact records you need to add (usually 1-2 verification CNAMEs for ACM, a CNAME for `www`, and possibly A records for the apex).

**At your domain registrar (e.g. GoDaddy):**

1. Go to DNS management for the domain.
2. Add **only** the new records Amplify listed. Copy type, name, and value exactly.
3. **Do not delete or change** any existing records — particularly the MX records (and SPF/DKIM) that power your email.
4. Save.

Amplify will detect the records after propagation and issue the SSL certificate.

**On the subdomain mapping + SSL screen:**

- Map subdomains (such as `www`) to the `master` branch (or your current deployment branch).
- Enable the apex redirect checkbox if you want the naked domain to redirect to `www` (recommended for a clean canonical URL).
- For the SSL certificate: select **Amplify managed certificate** (the recommended/free option). It will automatically create and validate a certificate in ACM using the DNS records you add, and handle renewal.
- Do not choose "Custom SSL certificate" unless you already have one prepared in ACM.

After filling in the mappings, click **Add domain** at the bottom.

Amplify will display the specific DNS records (CNAMEs) that you must now add at your registrar. Add them, then return to Amplify to let it verify.

Once verified, your custom domain will serve the site over HTTPS.

### Recommended DNS Strategy (Keep DNS at Your Registrar)

- Keep nameserver management at your current registrar (GoDaddy in this case). This protects existing email (MX records etc.).
- Add *only* the A/CNAME records that Amplify gives you for the custom domain and verification.
- Make `www` the primary (add its CNAME).
- For the apex (`amdgtechnologies.com`):
  - Add any A records Amplify provides, **or**
  - Use simple domain forwarding at the registrar (forward the root to `www`).
- After the domain is verified in Amplify, you can add a 301 redirect from apex to www (Domain management → Edit) for a clean experience.

### After Adding Records at Your Registrar (Propagation & Verification)

Once the records are added at the registrar:

**Monitor propagation:**

- Primary tool: https://www.whatsmydns.net/
  - Check **both** `amdgtechnologies.com` and `www.amdgtechnologies.com`.
  - Watch for the values to change to Amplify / CloudFront targets (instead of the registrar's default or parking page).

- Command line (run every 10-15 minutes):
  ```bash
  dig +short www.amdgtechnologies.com
  dig +short amdgtechnologies.com
  dig amdgtechnologies.com
  ```
  - You should eventually see the Amplify target in the output.

- Propagation usually takes 5–30 minutes but can take a few hours depending on TTLs. Be patient.

**When propagation succeeds (whatsmydns shows the new Amplify targets for both names):**

1. Go back to the Amplify Console → your app → **Domain management**.
2. The status for the domain (and www) should change from "Pending verification" to **"Available"**.
3. Amplify will automatically start provisioning the free managed SSL certificate.
   - This can take 5–60+ minutes.
   - Watch the status — it goes "Pending validation" → "Issued".
   - No extra action needed; validation uses the DNS records you added.

**Test when fully live (status "Issued", HTTPS works, green/available):**

1. Open in a browser (incognito recommended to bypass cache):
   - https://www.amdgtechnologies.com
   - https://amdgtechnologies.com (if you set up apex forwarding or the A record)

2. Full production checklist:
   - Dark modern theme loads and the hero video plays the final approved animation as full-bleed background.
   - Animation details: A with pulsing semantic network, M with **red** EKG trace, D with compass, G with **green** electricity animating along the PCB traces.
   - Video loops smoothly, muted, performs well.
   - "Explore the Mark" link scrolls to the logo meaning sections.
   - Bottom links (LinkedIn, Facebook) work.
   - No console errors (F12 → Console) — especially no 404s for the .mp4 or poster .png.
   - Responsive on mobile (video adapts, text readable).
   - The ~1.5 MB video loads at a reasonable speed.

3. **Critical: email verification** (do this after any DNS change):
   - Send test emails **to** the addresses on the domain (info@amdgtechnologies.com and mpeaton@amdgtechnologies.com).
   - Send emails **from** them too.
   - Confirm full round-trip works with no delivery problems.
   - If email breaks: immediately check GoDaddy DNS (you may have touched an MX record by accident). Revert if needed. The site will still be reachable at the Amplify URL.

**Safety net:**
- If anything looks wrong after propagation or SSL, you can remove the custom domain in Amplify (Domain management → remove). The site instantly falls back to your `*.amplifyapp.com` URL.
- Email should be unaffected because you only *added* records at the registrar (you never changed nameservers or deleted MX records).

**Once everything passes:**
- Update `linkedin-post-draft.md` with the live custom domain URL(s).
- Post the announcement (attach the final video + poster).
- Future updates: just `git push origin master` — Amplify will automatically build and deploy using `amplify.yml`.

The animation and site should now be publicly live on your custom domain(s) with proper HTTPS.

### Updating the Live Site
- With Git connected: just push changes. Amplify will redeploy automatically.
- The video (`amdg-animation-final.mp4`) and poster are in `html/resources/` and will be served efficiently via the CDN.

### Future-Proofing for Apps/Services
When you want to add backend later:
- In the same Amplify app you can add:
  - API (GraphQL or REST with AppSync or API Gateway + Lambda)
  - Authentication (Cognito)
  - Database (DynamoDB, etc.)
  - Functions
  - Hosting for multiple frontends if needed
All under one project and one billing account.

### DNS Strategy (Keep DNS at Your Registrar)
- Manage DNS at your registrar (GoDaddy) to protect your Google Workspace email configuration.
- Only add the A/CNAME records that Amplify tells you to add.
- Do not point nameservers to AWS/Route 53 unless you are prepared to fully manage DNS (including recreating all Google Workspace records in Route 53).

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
Still viable since the domain has Google Business / Workspace, but since AWS was chosen for ecosystem consistency we're focusing on Amplify.

### GoDaddy Hosting
Not recommended (more expensive, less performant).

### S3 + CloudFront (more manual control)
Only if you specifically want to avoid Amplify's managed experience. More steps for custom domain and SSL.

See older sections below if you ever want to switch approaches.

## Quick DNS + Email Reminder
- Keep your DNS management at GoDaddy (do not change nameservers).
- This protects your existing Google Workspace email configuration (MX records for mpeaton@ and info@).
- Amplify will tell you exactly which additional CNAME records to add at GoDaddy for the custom domain and verification.
- Test email thoroughly after adding records.

## Detailed AWS Amplify Console Steps

1. Sign in to the AWS Console → search for "Amplify" → open Amplify Hosting.

2. Create a new app
   - "New app" → "Host web app" (or "Deploy without Git" for a quick test).
   - If using Git: authorize your Git provider, select the repo and `master` branch.
   - Amplify should detect the `amplify.yml` file you committed.

3. Review build settings
   - Because `amplify.yml` is in the repo, Amplify will usually auto-detect it.
   - On the "Build settings" screen it will likely show (or you can set via "Override build settings"):
     - **Frontend build command**: `echo "Static assets ready for deployment"` (or leave the field blank — the amplify.yml takes precedence)
     - **Build output directory**: `html`
   - Accept the detected values or override to match exactly.
   - If you see a full YAML editor / "Edit" link for the build spec (common on this screen), you can paste the entire content of your local `amplify.yml` file there. That's perfectly valid and explicit. Just copy the whole file and paste it in.
   - Save and deploy. First build usually takes 1-3 minutes.

   **Key point**: This site is 100% static (no package.json, no build tools). The only thing Amplify needs to know is "serve everything from the `html/` folder". The `amplify.yml` we added makes this explicit and future-proof. Pasting the full YML is one of the cleanest ways if the simple two fields feel limited.

## Testing an Amplify Deployment

1. Find your current Amplify URL
   - In the app overview, look for the "Hosting" section or the branch (usually "master").
   - Click the link (something like `https://main.<random-id>.amplifyapp.com`).
   - Open in incognito to bypass cache.

2. Run the basic tests
   - Dark modern theme loads.
   - Hero video plays the approved animation (red EKG on M, green electricity following PCB traces on G, etc.).
   - Video loops, muted, background covers properly.
   - "Explore the Mark" scrolls to the logo section.
   - Links to LinkedIn/Facebook work.
   - Browser console (F12) has no 404 errors for the .mp4 or .png.
   - Mobile/responsive test (video still works and is readable).
   - Video loads at a reasonable speed (~1.5 MB file).

3. Check the build
   - In the app > "Builds" or "Hosting" tab, confirm the latest push succeeded (green).
   - If red, click the build to see logs.

4. Pre-DNS email test
   - Send/receive tests to `info@amdgtechnologies.com` and `mpeaton@amdgtechnologies.com` to confirm Google Workspace still works.

**Tip:** Keep using the Amplify URL for testing until the custom domain is fully live with SSL issued.

## Adding the Custom Domain (After Amplify URL Tests Pass)

Only do this after the Amplify URL tests above pass cleanly.

1. In the Amplify Console:
   - Open your app.
   - Left menu: **Domain management** → **Add domain**.
   - Enter `amdgtechnologies.com` → Continue.

2. Amplify will show the records it needs:
   - **Verification records** (usually 1-2 CNAMEs like `_acme-challenge....`).
   - **Routing records** (CNAME for `www`, A records for the apex `@`).

3. At your registrar (GoDaddy):
   - Domain → Manage DNS.
   - Add **exactly** the records Amplify listed.
   - **Do NOT delete or change** any existing MX, SPF, DKIM, DMARC, or other Google Workspace records.

4. Wait for DNS propagation (5 min – a few hours):
   - Check with https://www.whatsmydns.net/ for both `amdgtechnologies.com` and `www.amdgtechnologies.com`.
   - Or use `dig amdgtechnologies.com` and `dig www.amdgtechnologies.com`.

5. Back in Amplify:
   - Status should update to "Available".
   - Amplify auto-provisions the free SSL (can take 5-60+ minutes). Watch the status.

6. (Strongly recommended) Set up apex redirect:
   - In Domain management for your domain → Edit.
   - Add a 301 redirect:
     - Source: `https://amdgtechnologies.com/*`
     - Target: `https://www.amdgtechnologies.com/:splat`

7. Final custom-domain tests:
   - Visit both https://www.amdgtechnologies.com and https://amdgtechnologies.com.
   - Run the full test checklist.
   - Re-confirm email still works perfectly.

**Safety net**: If DNS gets messed up, just remove the custom domain in Amplify (it reverts to the safe Amplify URL). Your email MX records are untouched as long as you only *added* records at the registrar.

## Quick Reference — Current Flow

- Test the current Amplify URL first (checklist above).
- Once happy, go to Domain management in Amplify → Add domain.
- **Decline the Route 53 hosted zone creation.** Choose manual records at your registrar.
- Add **exactly** the records Amplify lists (preserve all existing MX etc. records).
- Wait for propagation + SSL.
- Set up apex redirect if desired.
- Re-test + update the LinkedIn draft with the live URL.

Future changes: just push to master — Amplify auto-deploys via the committed `amplify.yml`.

## Troubleshooting: 403 CloudFront "Bad request" error on custom domain

This is the exact error you are seeing:

```
403 ERROR
The request could not be satisfied.
Bad request. We can't connect to the server for this app or website at this time. There might be too much traffic or a configuration error. ...
Generated by cloudfront (CloudFront)
```

**This is expected / normal behavior while you are still at the SSL provisioning stage in Amplify.**

### Why it happens
- When you add a custom domain, Amplify creates (or reuses) a CloudFront distribution specifically for `amdgtechnologies.com` / `www.amdgtechnologies.com`.
- That CloudFront distro is configured to only serve the app once the associated ACM SSL certificate is fully validated and "Issued".
- Until then (even if your DNS records have propagated and www points at a cloudfront.net name), CloudFront returns this 403 "Bad request" for requests to the custom domain aliases.
- The generic "we can't connect... configuration error" message is CloudFront's way of saying the distribution isn't ready to handle this domain + cert combination yet.
- Your recent DNS check shows:
  - `www.amdgtechnologies.com` → `d3mw4qklyxtpnp.cloudfront.net.` (and CloudFront IPs) → correctly pointing at Amplify's CloudFront.
  - `amdgtechnologies.com` (apex) → still Google IPs (34.49..., 216.239...) → apex records/forwarding at GoDaddy have not been updated to Amplify targets yet (or are using Google forwarding).

The Amplify preview URL (the `*.amplifyapp.com` one) bypasses the custom domain CloudFront entirely and always works.

### What to do right now
1. **Use the Amplify app URL for testing** (this is the important one):
   - Go to the AWS Amplify Console → your app overview.
   - Copy the URL shown under "Hosting" or the branch (e.g. `https://main.<something>.amplifyapp.com`).
   - Open it in incognito. This should show the current site (with the hero button removed and animation tweaks from the latest push). It has full HTTPS already.

2. Monitor progress in Amplify:
   - App → **Domain management**.
   - Wait for the domain row(s) to show status **Available**.
   - Then watch the SSL certificate status: it will say something like "Pending validation" and then flip to **Issued**.
   - This is the stage you're in — no action needed from you.

3. Double-check the validation records (critical for SSL):
   - In Amplify Domain management, note the exact verification CNAME records (they start with `_acme-challenge` or a long hash like `_b1ae...`).
   - Check them at https://www.whatsmydns.net/ (select the record type CNAME). They must resolve to the target Amplify/CloudFront value from multiple locations.
   - The regular www/apex records are for traffic; these validation ones unlock the cert.

   **Common GoDaddy gotcha that causes "still verifying ownership" for hours even after you "added" the records** (exactly the situation here):
   - When adding the long validation CNAME in GoDaddy, the **Host** field must contain *only* the prefix up to (and including) the relevant subdomain, e.g. for a www domain: `_b1aec88806a78c3afae3d69f6cb3b937.www`
   - **Do NOT paste the full name** that includes `.amdgtechnologies.com` into the Host field. If you do, GoDaddy creates the record at the wrong location (`...www.amdgtechnologies.com.amdgtechnologies.com` — the "double" name).
   - The correct name Amplify expects will then return NXDOMAIN, so verification never completes.
   - Fix: In GoDaddy DNS, delete the bad long validation record (the one whose Host contains the full domain), then re-add with Host exactly as shown in Amplify (stop before `.amdgtechnologies.com`).
   - After saving in GoDaddy, wait 1-2 min and re-check on whatsmydns.net for the *exact* name Amplify wants. It must show the AWS target.
   - Then return to the Amplify page — it should detect it and advance "Verifying domain ownership..." / Domain activation.

   In your current zone file + live DNS: the www + www.www routing records are correct and live (pointing at the right cloudfront.net), but the validation record at the name Amplify is showing in the UI is NXDOMAIN (not present). The doubled-name version of the validation record *does* exist and points to the right place — clear sign the Host field was over-copied. Fix the Host and re-add as described.

4. Once "Issued":
   - The custom domain should begin working within a few minutes (CloudFront propagates the cert association).
   - Test both https://www.amdgtechnologies.com and the apex (after you sort apex DNS/forwarding).

5. For the apex domain (`amdgtechnologies.com`):
   - Amplify usually provides specific A records or a target to point the naked domain to.
   - Alternative (simplest, often recommended): In GoDaddy, set up domain forwarding for the apex/root to forward to `www.amdgtechnologies.com` (permanent 301 if possible).
   - Then in Amplify, after domain is live, you can add the apex → www redirect rule as described in the steps above.

### If it's taking a very long time
- After the status is "Available" for >2–3 hours and SSL is still not Issued:
  - Remove the custom domain in Amplify (Domain management → ... → Remove).
  - Re-add the domain. This often generates fresh validation records and restarts the ACM process cleanly.
- The site remains fully available on the Amplify URL the whole time.
- Your email is unaffected.

### Other notes
- The Request ID in the error (e.g. `2YxOb2R6kDGy2J5LnkvR1YpbbINS8RH0HOdXcy3PNQq0q-RP335bMw==`) can be provided to AWS Support if you ever need to open a case, but it's not needed for normal waiting.
- Once the custom domain is live, future `git push` will update both the Amplify URL and the custom domain automatically.
- The latest code (hero cleanup) is already deployed to the Amplify side since the branch is up to date.

See also the official AWS page: https://docs.aws.amazon.com/amplify/latest/userguide/troubleshooting-custom-domains.html (covers Pending Verification, SSL issues, etc.).

This should resolve itself shortly. Keep an eye on the Domain management screen and let me know the exact status text if you want more targeted advice (e.g. "Available - Pending validation for 45 minutes"). In the meantime, share the Amplify preview URL if you want me to verify anything on the live version.
