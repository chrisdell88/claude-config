# claude-config

Cross-device sync for Claude Code setup: agents, skills, hooks, and shared config.

## What's in here
- `agents/` — the 14-person team (Finn, Ben, Dana, Max, Quinn, Cody, Uma, Ivy, Remy, Sage, Mara, Devon, Parker, Nova)
- `CLAUDE.md` — my 8 standing rules (GitHub as source of truth, Supabase only, etc.), auto-loaded in every Claude session
- `commands/` — custom slash commands (e.g. `/onboard <repo-name>` to set up a project on a fresh device)
- `hooks/` — session start/end hooks that auto git pull / push every project
- `skills/` — shared skills (future)
- `bootstrap.sh` — one-command setup for a new Mac

## Setting up on a new Mac (iMac, MacBook #1, MacBook #2)
```bash
cd ~ && git clone https://github.com/chrisdell88/claude-config.git && cd claude-config && bash bootstrap.sh
```

That's it. The script:
1. Symlinks `claude-config/agents/` → `~/.claude/agents/`
2. Installs the auto git pull/push hooks
3. Clones every project repo into `~/Projects/`

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
