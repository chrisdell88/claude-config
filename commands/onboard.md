---
description: Set up this device for a project. Clones repo if needed, installs deps, pulls env vars from Vercel, verifies everything works.
argument-hint: <repo-name>
---

Pick up the project `$ARGUMENTS` on this device. Repo is `github.com/chrisdell88/$ARGUMENTS`.

Run the full onboarding in order, non-interactively where possible. Follow my standing rules in `~/.claude/CLAUDE.md`.

### 1. Locate or clone the repo
- Target path: `~/Projects/$ARGUMENTS`
- If it exists: `cd` in and `git pull`
- If not: `git clone git@github.com:chrisdell88/$ARGUMENTS.git ~/Projects/$ARGUMENTS` (or via https if SSH fails)

### 2. Read project context
- Read `CLAUDE.md`, `MEMORY.md`, `README.md` (whichever exist)
- Run `git log --oneline -10`
- Summarize: what the project is, current state, what's in-progress, what's blocked

### 3. Detect the stack and install dependencies
- `package.json` → verify `node -v` works. If missing, STOP and tell me to install Node LTS from nodejs.org. If present, run `npm install`.
- `requirements.txt` / `pyproject.toml` → verify Python/uv, install deps
- Other stack → report it and wait for my guidance

### 4. Set up secrets via Vercel
Only if `.env.example` exists AND there's no `.env` yet:
- `npx --yes vercel@latest link --yes --project $ARGUMENTS`
- `npx --yes vercel@latest env pull .env --environment=production --yes`
- If the project isn't on Vercel or linking fails, STOP and ask me where secrets live

### 5. Verify it works
- If there's a DB connection, run one simple `SELECT COUNT(*)` to confirm connectivity
- Report what's live

### 6. Report back
- Project summary + current state
- Last session's in-progress work (from MEMORY.md + recent commits)
- What I should tackle first

### Rules
- Don't commit or push anything during onboarding
- Don't install anything globally without asking
- If you can't auto-pull a secret, tell me exactly what to paste and where
- If blocked, report the exact issue — don't guess

Start with step 1.
