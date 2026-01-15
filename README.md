# Python Project Template

VS Code devcontainer template for Python projects with Claude Code pre-configured.

## Features

- Python 3.12 with Pylance, Black, Ruff
- Claude Code CLI pre-installed
- uv for fast package management
- Mounts local credentials (~/.anthropic, ~/.claude, ~/.ssh, etc.)

## Usage

1. Copy `.devcontainer/` to your project
2. Open in VS Code and "Reopen in Container"
3. Run `claude` to start the AI assistant

## Prerequisites

On your **host machine**, ensure these exist:
- `~/.anthropic/` - Anthropic API credentials
- `~/.claude/` - Claude Code config
- `~/.ssh/` - SSH keys (optional)
