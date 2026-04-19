# claude-config

Cross-device sync for Claude Code setup: agents, skills, hooks, and shared config.

## What's in here
- `agents/` — the 14-person team (Finn, Ben, Dana, Max, Quinn, Cody, Uma, Ivy, Remy, Sage, Mara, Devon, Parker, Nova)
- `CLAUDE.md` — my 8 standing rules (GitHub as source of truth, Supabase only, etc.), auto-loaded in every Claude session
- `commands/` — custom slash commands (e.g. `/onboard <repo-name>` to set up a project on a fresh device)
- `hooks/` — session start/end hooks that auto git pull / push every project
- `skills/` — shared skills (future)
- `bootstrap.sh` — one-command setup for a new Mac

## Setting up on a new Mac (realistic, ~15 min total)

**1. Install Claude Code** — download from claude.ai/download, log in.

**2. Install Node.js LTS** — download the `.pkg` from [nodejs.org](https://nodejs.org), double-click, next→next→done. (Required for any of your projects to `npm install` or run locally. Claude can't install this for you — macOS needs your password.)

**3. Clone + bootstrap this repo:**
```bash
cd ~ && git clone https://github.com/chrisdell88/claude-config.git && cd claude-config && bash bootstrap.sh
```

The script:
1. Symlinks `claude-config/agents/` → `~/.claude/agents/`
2. Symlinks `claude-config/CLAUDE.md` → `~/.claude/CLAUDE.md` (8 standing rules, auto-loaded every session)
3. Symlinks `claude-config/commands/` → `~/.claude/commands/` (slash commands like `/onboard`)
4. Installs auto git pull/push hooks
5. Clones every project repo into `~/Projects/`

**4. Per-project setup — in Claude Code, for each project you want to work on:**
```
/onboard <project-name>
```
(e.g. `/onboard mockx`)

This pulls Vercel env vars, runs `npm install`, verifies DB connection, and reports status. First project takes ~2 min (includes one-time Vercel CLI login via browser); each additional project ~30 sec.

**That's it.** After this, any session on any device: start with `"pick up where we left off on <project>"` and Claude has full context.

## Updating agents across devices
After editing an agent file on any device:
```bash
cd ~/claude-config && git add -A && git commit -m "update agents" && git push
```
Then on any other device:
```bash
cd ~/claude-config && git pull
```

Symlinks mean the change propagates automatically — no copying needed.
