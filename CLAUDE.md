# Standing rules — Chris Dell's workflow across all projects

I work across 4 devices (iMac at home, 2 MacBook Airs for travel, iPhone) and need to switch between any of them mid-project without losing a step. I am non-technical — you handle ALL technical execution.

These rules apply to every project, every session, on any device.

## 1. Source of truth = GitHub
- Every project has a GitHub repo under `chrisdell88` that is the ONLY canonical copy of code, docs, and config.
- Local folders on any machine are disposable mirrors. Wiping them and `git clone`-ing should bring everything back exactly.

## 2. Session protocol
- **Start:** `git pull` before doing anything.
- **End:** commit and push every change. Never leave uncommitted work on a single machine.
- If you see uncommitted local changes at session start, ask before touching them.

## 3. Database = cloud only
- Use **Supabase** (cloud Postgres) for all databases. Never SQLite or local Postgres.
- DB connection strings live in env vars on Vercel + Supabase dashboards, never in a file on disk.

## 4. Hosting = Vercel (or Netlify)
- Auto-deploy from GitHub on every push to `main`.
- Production URL is always the source of truth for "what is live."

## 5. Secrets
- API keys and credentials live in Vercel and Supabase dashboards, never in any committed file.
- `.env.example` files (committed) document which env vars exist.
- `.env` files (with real values) are gitignored.

## 6. Phone editing
- I must be able to view/edit anything from my phone via:
  (a) GitHub mobile app
  (b) github.dev in Safari (full VS Code in browser)
  (c) messaging Claude directly
- Never design a workflow that requires a desktop.

## 7. MEMORY.md
- Every project has `MEMORY.md` at the repo root documenting: current state, recent decisions, in-progress work, blockers, what's next.
- Update at end of every session.
- Committed to GitHub so it travels with the project.

## 8. New device onboarding
- To work on a project from a fresh machine, I should only need to:
  1. Install Claude Code (or open Claude on phone)
  2. Be logged into GitHub
  3. Tell Claude the repo name
- That's it. No other manual setup.
- Per-device runtime setup (Node, `.env`) is your responsibility to handle when the device is first used for a given project — see the `/onboard` slash command.

## Conflict resolution
If any of these rules conflict with a specific project's `CLAUDE.md`, ASK ME before deviating — don't silently override either.
