# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Nix flake-based macOS system configuration using nix-darwin and home-manager. It manages dotfiles and system settings declaratively across multiple machines (personal and work).

## Key Commands

```bash
# Rebuild system after changes (shell alias defined in zsh config)
switch

# Manual rebuild (replace 'personal' with host key from hosts.nix)
sudo darwin-rebuild switch --flake ~/code/personal/notfiles#personal

# Bootstrap a new machine
nix run nix-darwin -- switch --flake github:greg-cook/notfiles#HOSTNAME
```

There are no test or lint commands - this is infrastructure configuration, not application code.

## Architecture

**Entry point**: `flake.nix` defines inputs (nixpkgs, nix-darwin, home-manager, nix-homebrew) and generates `darwinConfigurations` for each host.

**Multi-machine support**: `hosts.nix` defines machine-specific settings (hostname, username, git identity, SSH keys, extra packages). Each host key (e.g., `work`, `personal`) becomes a flake output.

**Module structure**:
- `modules/darwin/` - System-level: Homebrew packages, system preferences, users, networking
- `modules/home/` - User-level: Shell config (zsh), programs (git, neovim, mise), dotfiles
- `modules/home/programs/` - Individual program configurations

**Configuration flow**: flake.nix → hosts.nix (per-machine) → darwin modules + home-manager modules

**Key files**:
- `modules/darwin/homebrew.nix` - Homebrew brews and casks
- `modules/darwin/system-defaults.nix` - macOS preferences (dock, finder, keyboard)
- `modules/home/programs/zsh.nix` - Shell aliases and oh-my-zsh setup
- `modules/home/programs/git.nix` - Git config with SSH signing
- `modules/home/programs/mise.nix` - Language version management (Go, Node, Python, Ruby, Terraform)

## Adding a New Machine

1. Add an entry to `hosts.nix` with the required fields
2. Run `nix run nix-darwin -- switch --flake .#NEWHOST`

## Nix Conventions

- `hostConfig` is passed via `specialArgs` to access machine-specific values
- Home-manager users cannot have dots in names (e.g., `greg.cook` becomes `gregcook`)
- Homebrew is managed declaratively via nix-homebrew
