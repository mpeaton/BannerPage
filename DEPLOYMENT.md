# Hosting & Deployment Guide for AMDG Technologies Site

## Current Site
- Pure static site (HTML + CSS + JS + one video + one image).
- Main file: `html/index.html`
- Assets live in `html/resources/` (including the final animation `amdg-animation-final.mp4` and poster).
- The animation is the hero and the star of the site.

**No server-side code is required.** Any static hosting solution will work perfectly.

## Recommended Hosting: AWS Amplify (Static Hosting)

This project is configured for AWS Amplify. This choice keeps everything in the AWS ecosystem for future apps, services, or expansions.

### Why AWS Amplify
- Integrates with existing AWS accounts.
- Simple managed experience for static sites (comparable to Netlify/Vercel).
- Automatic global CDN via CloudFront.
- Generous free tier suitable for this site, with headroom for growth.
- Built-in CI/CD when connected to a Git repository.
- Straightforward custom domain support with free managed SSL certificates (via ACM).
- Path to add backend capabilities (API, auth, database, functions) later within the same project.
- `amplify.yml` is committed in the project root to declare the static nature and output directory.

**amplify.yml** (committed in root):
Declares a pure static site with publish directory `html/` (containing `index.html` and `resources/`).

### Detailed Steps to Deploy with AWS Amplify

#### Option 1: Connect Git Repository (Recommended for ongoing development)
This project is on GitHub at the configured remote (branch: `master`).

The repository is prepared with:
- `amplify.yml`
- Site content in `html/`
- `DEPLOYMENT.md`, top-level `README.md`, etc.
- `.gitignore` (excludes design history, legacy configs, etc. to keep deploys clean)

1. Ensure changes are committed and pushed:
   ```bash
   git add .
   git commit -m "Prepare for AWS Amplify + update site with final animation"
   git push origin master
   ```

2. In the AWS Amplify Console (https://console.aws.amazon.com/amplify/):
   - Click "New app" → "Host web app".
   - Connect the Git provider and select the repository and `master` branch.
3. Amplify detects `amplify.yml` and auto-configures:
   - Build settings from the file.
   - Publish directory: `html`
4. Review and click "Save and deploy". The first build deploys automatically.
5. After deploy, note the generated Amplify URL (e.g. `https://main.xxxxx.amplifyapp.com`).

**Note:** If the publish directory is not detected, set it manually to `html` in the app settings.

#### Option 2: Manual Deploy (Drag & Drop / ZIP)
1. In Amplify Console: New app → Deploy without Git.
2. Upload the entire `html/` folder (or a zip of its contents).
3. Name the app and deploy.
4. Note: Git-connected deploys are preferred for updates (push to trigger rebuilds).

### Adding a Custom Domain — Important: Manual DNS Records Only (Protect Email)

**Critical: Do not create a Route 53 hosted zone if the domain's DNS and email (e.g. MX records) are managed at an external registrar such as GoDaddy.**

When adding a custom domain in Amplify:

AWS often prompts with an option to "Create a hosted zone in Route 53" or similar ("Let Amplify manage your DNS with Route 53").

**Do NOT select this.**

Selecting it would:
- Provision a Route 53 hosted zone.
- Provide new nameserver values.
- Require updating nameservers at the registrar.
- Risk breaking email delivery (MX, SPF, DKIM, DMARC, etc.) unless every email-related record is manually and correctly recreated in Route 53. This is error-prone.

**Correct choice on the domain addition screen:**

Select the manual option, such as:
- "I'll add the records myself"
- "Manage DNS at my current registrar"
- "Add records manually"
- Any path that avoids creating a hosted zone or changing nameservers at the registrar.

Amplify will then display the precise list of records required (typically verification CNAMEs, a CNAME for `www`, and possibly A/ALIAS records for the apex).

**At the domain registrar:**

1. Add **only** the records listed by Amplify. Match record type, name/host, and value exactly.
2. Do **not** delete or modify any existing records — especially MX records (and related SPF/DKIM) that support email services.
3. Save changes.

Amplify monitors for propagation and will proceed to issue the certificate once the records are live.

**Subdomain mapping and SSL screen (after entering the root domain):**

- Map the desired subdomains (e.g. `www`) to the target branch (typically `master`).
- Use the apex redirect checkbox if a redirect from the naked domain to `www` (or vice versa) is desired.
- For SSL: select **Amplify managed certificate** (recommended). This provisions a free certificate in ACM, handles validation via the DNS records, and auto-renews.
- Avoid the "Custom SSL certificate" option unless an existing ACM certificate is already prepared for import.

After configuration, click "Add domain".

Amplify will then present the exact DNS records to add at the registrar. Add them (as the indicated types, usually CNAME), return to Amplify, and wait for verification.

This process results in the custom domain serving with HTTPS.

### Recommended DNS Strategy (Keep DNS at Registrar)

- Retain nameserver management at the original registrar (e.g. GoDaddy). This protects any existing email configuration (MX records and related).
- Add *only* the specific A/CNAME records that Amplify provides for domain verification and routing.
- Configure `www` as the primary hostname via its CNAME.
- For the apex/naked domain:
  - Add any A records provided by Amplify, or
  - Use registrar domain forwarding (e.g. forward apex to `www`) as a simple solution.
- After domain verification in Amplify, optionally configure a 301 redirect from apex to www under Domain management → Edit for a clean canonical experience.

### Propagation and Verification Phase (After Adding Records at the Registrar)

After the required records are added at the registrar, the system enters the propagation and verification phase.

**Monitor propagation:**

- Use https://www.whatsmydns.net/ — check both the apex and `www` subdomains.
- Look for resolution changing to Amplify/CloudFront targets (instead of registrar defaults or parking pages).

- CLI checks (repeat periodically):
  ```bash
  dig +short www.amdgtechnologies.com
  dig +short amdgtechnologies.com
  dig amdgtechnologies.com
  ```
  - Successful propagation shows the Amplify target values.

- Typical propagation: 5–30 minutes, but can extend to hours based on TTLs and caching. Monitor until consistent.

**Once propagation is confirmed (new targets visible on whatsmydns for both names):**

1. Return to the Amplify Console for the app → **Domain management**.
2. Domain status should advance from "Pending verification" (or equivalent) to **"Available"**.
3. Amplify automatically provisions the free managed SSL certificate.
   - Provisioning typically takes 5–60+ minutes.
   - Status transitions: "Pending validation" → "Issued".
   - No manual intervention required for validation (it uses the added DNS records).

**Production verification (once status is "Issued", domain resolves, and HTTPS is active):**

1. Browse (use incognito to avoid cache):
   - https://www.amdgtechnologies.com
   - https://amdgtechnologies.com (if apex configured or forwarded)

2. Verification checklist:
   - Dark modern theme and hero video load; the approved animation plays as full-bleed background.
   - Animation content: A (pulsing semantic/network), M (**red** EKG trace), D (compass), G (**green** electricity tracing PCB paths).
   - Video loops cleanly, muted, good performance.
   - "Explore the Mark" scrolls to the quadrant explanations.
   - Footer links (LinkedIn, Facebook) function.
   - Browser console (F12) shows no 404s or load errors for video/poster assets.
   - Responsive behavior on mobile viewports.
   - Video asset size (~1.5 MB) loads promptly.

3. Email round-trip verification (perform after any DNS modification):
   - Send test messages **to** the configured addresses (e.g. `info@...` and primary contact address).
   - Send from those addresses as well.
   - Confirm successful delivery both directions with no bounces or delays.
   - If email is impacted: inspect the registrar DNS immediately for unintended MX changes and revert. The site remains accessible via the Amplify URL in the interim.

**Safety net:**

- If post-propagation or SSL issues arise, remove the custom domain mapping in Amplify (Domain management). The app instantly falls back to the `*.amplifyapp.com` URL.
- Email configuration is preserved provided only additive records were introduced at the registrar (no nameserver swap or MX deletions).

**After successful verification:**

- Update `linkedin-post-draft.md` with the live custom domain URL(s).
- Future site updates: `git push` to the tracked branch triggers automatic Amplify rebuild and deploy via `amplify.yml`.

The site is now served publicly on the custom domain(s) over HTTPS with the approved animation as the hero.

### Updating the Live Site
- Git-connected: push changes to the tracked branch; Amplify automatically rebuilds and deploys.
- Video and poster assets reside in `html/resources/` and are served via the CDN.

### Future-Proofing for Apps/Services
To add backend capabilities later:
- Within the same Amplify app/project, add:
  - APIs (GraphQL via AppSync or REST via API Gateway + Lambda)
  - Authentication (Cognito)
  - Databases (e.g. DynamoDB)
  - Lambda functions
  - Additional frontend hosting as needed
Everything remains under one project and AWS account.

### DNS Strategy (Keep DNS at Original Registrar)
- Continue managing DNS at the registrar (e.g. GoDaddy) to safeguard email records (MX and ancillary).
- Introduce only the A/CNAME records supplied by Amplify.
- Avoid switching nameservers to AWS/Route 53 unless prepared to replicate the entire email record set (MX/SPF/DKIM/etc.) exactly in the new zone.

### Cost Estimate
- Amplify static hosting for low-traffic sites: typically $0 on the free tier.
- Custom domain + managed SSL: free.
- Data transfer: minimal for this asset-light site.
- Backend additions (if any) scale with usage; base hosting remains low-cost to start.

### Files Prepared for Amplify
- `amplify.yml` — root (declares static site and `html` output).
- `html/index.html` + `html/resources/` — complete site assets including the approved animation.

### Post-Deployment
- Update announcement drafts (e.g. `linkedin-post-draft.md`) with the final live URL once verified.
- Optionally add an apex-to-www (or www-to-apex) 301 redirect in Amplify under Rewrites and redirects.
- Use the Amplify console for monitoring (analytics and logs available for static apps).

---

## Other Options (for reference)

### Firebase Hosting
Viable alternative in the Google ecosystem. This guide focuses on Amplify per the project's AWS preference.

### GoDaddy Hosting
Not recommended for performance and cost reasons compared to dedicated static hosts/CDNs.

### S3 + CloudFront
Provides more manual control but requires additional steps for custom domains, SSL, and CI/CD. Use only if Amplify's managed workflow is explicitly undesired.

Older sections below may be referenced if switching approaches later.

## Quick DNS + Email Reminder
- Retain DNS management at the registrar (never change nameservers for this domain while email is configured there).
- This safeguards MX and related records for email services.
- Amplify supplies only the supplemental CNAME (and any A) records needed for the custom domain + verification.
- Always re-verify email delivery after registrar DNS modifications.

## Detailed AWS Amplify Console Steps

1. Sign in to the AWS Console → locate Amplify → open Amplify Hosting.

2. Create a new app
   - Choose "New app" → "Host web app" (or "Deploy without Git" for an initial test).
   - For Git-backed: authorize the provider, select the repository and branch (`master`).
   - Amplify should discover the committed `amplify.yml`.

3. Review / confirm build settings
   - With `amplify.yml` present in the repo, settings are typically detected automatically.
   - On the build settings screen (or via "Override build settings"):
     - **Frontend build command**: `echo "Static assets ready for deployment"` (or leave blank; the YML takes precedence)
     - **Build output directory**: `html`
   - Match the values exactly if overriding.
   - If a full YAML build spec editor is available ("Edit" link or YAML view), the entire contents of `amplify.yml` may be pasted there for explicit configuration. This is valid and recommended when the simple fields feel insufficient.
   - Save and deploy. Initial builds usually complete in 1–3 minutes.

   **Note**: The site is purely static. Amplify only needs to know to serve the contents of the `html/` directory. The committed `amplify.yml` documents this explicitly.

## Testing an Amplify Deployment

1. Locate the active Amplify URL
   - In the app overview, find the "Hosting" section or branch entry.
   - Open the generated URL (e.g. `https://main.<id>.amplifyapp.com` or branch variant).
   - Prefer incognito to skip local cache.

2. Execute verification steps
   - Confirm dark theme and hero video playback (approved animation with red EKG on M, green trace-following on G, etc.).
   - Verify smooth looping, muted audio, proper background coverage.
   - Test scroll link to "Explore the Mark".
   - Confirm external links (LinkedIn, Facebook).
   - Inspect console (F12) for missing asset 404s.
   - Validate responsive layout and acceptable video load time (~1.5 MB).

3. Inspect build status
   - In the app's Builds or Hosting tab, ensure the latest run succeeded (green).
   - Review logs on any failure.

4. Email sanity check (pre-custom-domain)
   - Exercise send/receive for all configured addresses to confirm email infrastructure is unaffected.

**Recommendation**: Continue using the Amplify-provided URL for testing until the custom domain + SSL are fully issued and validated.

## Adding the Custom Domain (After Initial Amplify URL Validation)

Perform these steps only after the Amplify URL passes the checklist cleanly.

1. In the Amplify Console for the app:
   - Left navigation: **Domain management** → **Add domain**.
   - Enter the root domain (e.g. `amdgtechnologies.com`) and continue.

2. Amplify presents the records to add:
   - Verification records (CNAMEs, often ACME challenge records).
   - Routing records (CNAME for `www`; A/ALIAS for apex `@`).

3. At the domain registrar:
   - Navigate to DNS management for the domain.
   - Create **exactly** the records Amplify enumerated.
   - **Do not delete or alter** existing MX, SPF, DKIM, DMARC, or other email-supporting records.

4. Allow time for propagation (minutes to hours):
   - Validate via https://www.whatsmydns.net/ (check apex + www).
   - Or use `dig` for the names.

5. Return to Amplify Domain management:
   - Status should reach "Available".
   - SSL provisioning begins automatically (monitor status; 5–60+ minutes typical).

6. (Recommended) Configure apex redirect for canonical hostname:
   - Domain management → Edit for the domain.
   - Add 301 redirect rule, e.g.:
     - Source: `https://amdgtechnologies.com/*`
     - Target: `https://www.amdgtechnologies.com/:splat`

7. Final validation on custom domain(s):
   - Visit both apex and www variants.
   - Re-run the full test checklist.
   - Re-confirm email round-trips.

**Safety net**: Removing the custom domain in Amplify instantly restores the Amplify URL. Email records remain safe when only additive changes were made at the registrar.

## Quick Reference

- Validate the initial Amplify URL with the checklist.
- Proceed to Domain management → Add domain only after success.
- **Decline Route 53 hosted zone creation**; choose manual record addition at the registrar.
- Add precisely the records Amplify specifies; leave all pre-existing email records untouched.
- Wait for propagation, then for SSL issuance.
- Optionally add apex redirect.
- Re-test fully; update any announcement drafts with live URLs.

Ongoing updates: push to the deployment branch — Amplify handles the rest via the committed `amplify.yml`.
