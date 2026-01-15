#!/bin/bash
set -e

echo "Setting up Python development environment..."

# ─────────────────────────────────────────────────────────────
# Fix permissions on mounted credential directories
# ─────────────────────────────────────────────────────────────
echo "Configuring credential mounts..."

if [ -d "$HOME/.ssh" ]; then
  chmod 700 "$HOME/.ssh" 2>/dev/null || true
  chmod 600 "$HOME/.ssh"/* 2>/dev/null || true
  chmod 644 "$HOME/.ssh"/*.pub 2>/dev/null || true
fi

if [ -d "$HOME/.gnupg" ]; then
  chmod 700 "$HOME/.gnupg" 2>/dev/null || true
fi

# ─────────────────────────────────────────────────────────────
# Claude Code config symlink
# Mount goes to ~/.claude-host, symlink ~/.claude points to it
# This ensures Claude Code finds the config from your local profile
# ─────────────────────────────────────────────────────────────
echo "Linking Claude config..."

if [ -d "$HOME/.claude-host" ]; then
  rm -rf "$HOME/.claude" 2>/dev/null || true
  ln -sf "$HOME/.claude-host" "$HOME/.claude"
  echo "  Linked ~/.claude -> ~/.claude-host"
fi

# ─────────────────────────────────────────────────────────────
# Install Claude Code CLI
# ─────────────────────────────────────────────────────────────
echo "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code

# ─────────────────────────────────────────────────────────────
# Python tooling (uv for fast package management)
# ─────────────────────────────────────────────────────────────
echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo ""
echo "Setup complete!"
echo ""
echo "Quick reference:"
echo "  claude        - Start Claude Code AI assistant"
echo "  uv init       - Initialize a new Python project"
echo "  uv add <pkg>  - Add a dependency"
echo "  uv run <cmd>  - Run a command in the venv"
echo ""
