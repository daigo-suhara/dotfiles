# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles managed with **Nix flakes**, **nix-darwin** (macOS), **NixOS**, and **Home Manager**. Targets macOS (Apple Silicon) as primary, with Linux (x86_64 and aarch64) support.

## Key Commands

```bash
# Apply all updates (flake lock + system + home-manager)
nix run .#update

# Apply only nix-darwin (macOS) without updating flake inputs
sudo --preserve-env=NIX_CONFIG,HOME nix run nix-darwin -- switch --flake .#daigo-suhara --impure

# Apply home-manager standalone (Linux generic)
home-manager switch --flake .#linux-x86   # or linux-arm

# Rebuild NixOS
sudo nixos-rebuild switch --flake .#nixos-x86   # or nixos-arm

# Check flake structure without building
nix flake show
nix flake check
```

## Architecture

```
flake.nix               # Entry point — defines all outputs
vars/default.nix        # Username, email, full name (shared across all configs)

hosts/
  darwin/macbook/       # nix-darwin macOS system config (dock, keyboard, Homebrew casks)
  nixos/generic/        # NixOS system config + hardware

modules/
  common/theme.nix      # Stylix theming (Catppuccin Mocha, JetBrainsMono Nerd Font)
  darwin/               # macOS-specific modules
  nixos/                # NixOS-specific modules

home/
  base/                 # Shared Home Manager programs (imported by darwin & linux)
    nvim/               # Neovim: symlinks ~/dotfiles/config/nvim (live edits, no rebuild needed)
    git/                # git config + commit template symlink
    zsh/                # zsh + oh-my-zsh, aliases, plugins
    wezterm/            # WezTerm terminal config
    lazygit/            # Lazygit config
  darwin/               # macOS home (imports base)
  linux/                # Linux home (imports base + GNOME)

config/
  nvim/                 # Neovim config (Lua, lazy.nvim) — symlinked, editable without rebuild
  wezterm/              # WezTerm config
```

## How Configuration Flows

1. `flake.nix` reads `vars/default.nix` for identity, then wires hosts + home together.
2. **macOS**: `darwinConfigurations.daigo-suhara` → `hosts/darwin/macbook/` (system) + `home/darwin/` (user).
3. **Linux**: `nixosConfigurations.nixos-*` → `hosts/nixos/generic/` (system, embeds home-manager) OR standalone `homeConfigurations.linux-*`.
4. `home/darwin/` and `home/linux/` both import `home/base/` which imports all per-program modules.
5. Theme is applied via **Stylix** in `modules/common/theme.nix`, imported by both darwin and nixos host configs.

## Editing Notes

- **Neovim config** (`config/nvim/`) is symlinked at activation time — changes take effect immediately without running `nix run .#update`.
- **Adding a package**: add to `home/base/default.nix` (all platforms) or platform-specific `home/darwin/` / `home/linux/`.
- **Adding a Homebrew cask** (macOS GUI apps): edit `hosts/darwin/macbook/default.nix` under `homebrew.casks`.
- **`isDarwin` flag** is passed as `extraSpecialArgs` and used in modules that need platform-conditional logic (e.g., Stylix cursor config).
- `homebrew.onActivation.cleanup = "zap"` — Homebrew packages not listed in config will be removed on activation.
