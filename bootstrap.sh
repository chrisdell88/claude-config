#!/usr/bin/env bash
set -euo pipefail

echo "🚀 Bootstrapping Claude Code config on this machine..."

# 1. Symlink agents
mkdir -p ~/.claude
if [ -d ~/.claude/agents ] && [ ! -L ~/.claude/agents ]; then
  echo "Backing up existing ~/.claude/agents to ~/.claude/agents.backup"
  mv ~/.claude/agents ~/.claude/agents.backup
fi
ln -sfn "$(pwd)/agents" ~/.claude/agents
echo "✅ agents symlinked"

# 2. Symlink global CLAUDE.md (8 standing rules, auto-loaded in every session)
if [ -f ~/.claude/CLAUDE.md ] && [ ! -L ~/.claude/CLAUDE.md ]; then
  echo "Backing up existing ~/.claude/CLAUDE.md to ~/.claude/CLAUDE.md.backup"
  mv ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup
fi
ln -sfn "$(pwd)/CLAUDE.md" ~/.claude/CLAUDE.md
echo "✅ global CLAUDE.md symlinked"

# 3. Symlink slash commands dir (/onboard, etc.)
if [ -d ~/.claude/commands ] && [ ! -L ~/.claude/commands ]; then
  echo "Backing up existing ~/.claude/commands to ~/.claude/commands.backup"
  mv ~/.claude/commands ~/.claude/commands.backup
fi
ln -sfn "$(pwd)/commands" ~/.claude/commands
echo "✅ slash commands symlinked"

# 4. Clone all projects
mkdir -p ~/Projects
cd ~/Projects
for repo in bracketx mockx birdiex pghsportsnews chrisdell-portfolio ledgerx fantasy-edge; do
  local_name=$repo
  [ "$repo" = "mockx" ] && local_name=mockx
  if [ ! -d "$local_name" ]; then
    echo "Cloning $repo → ~/Projects/$local_name"
    git clone "https://github.com/chrisdell88/$repo.git" "$local_name"
  else
    echo "$local_name already exists, skipping clone"
  fi
done

echo ""
echo "✅ All done. You now have:"
echo "   ~/.claude/agents/     (synced)"
echo "   ~/Projects/           (all 7 projects)"
echo ""
echo "Start any Claude Code session with: cd ~/Projects/<project> && claude"
