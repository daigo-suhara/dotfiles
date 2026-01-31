# Dotfiles managed by Nix

This repository contains my personal dotfiles and development environment configuration, managed using **Nix** and **Home Manager**. It ensures a reproducible setup across different machines, specifically targeting macOS (Apple Silicon) and Linux.

## 🚀 Features

- **Package Management**: All core CLI tools are installed via Nix.
- **Configuration Management**: Dotfiles for Neovim, WezTerm, Git, and Zsh are automatically linked and managed.
- **Reproducibility**: The exact same versions of tools and configurations can be deployed on any new machine with a single command.

## 📋 Prerequisites

Before using this configuration, ensure you have **Nix** installed.

### Install Nix

**Multi-user installation (Recommended):**
```bash
sh <(curl -L https://nixos.org/nix/install)
```

**Enable Flakes:**
If you are on a non-NixOS system, you may need to enable experimental features. Add the following to `/etc/nix/nix.conf` or `~/.config/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

## 🛠 Installation & Usage

1. **Clone the repository:**
   It is recommended to clone this into `~/dotfiles` as the configuration currently assumes this path for symlinking certain config directories.

   ```bash
   git clone https://github.com/daigo-suhara/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Apply the configuration:**

   Depending on your operating system, choose the appropriate flake output.

   **For macOS (Apple Silicon / aarch64):**
   ```bash
   nix run home-manager/master -- switch --flake .#suharadaigo
   ```
   *Subsequent updates can be applied with `home-manager switch --flake .#suharadaigo`*

   **For Linux (x86_64):**
   ```bash
   nix run home-manager/master -- switch --flake .#linux_user
   ```

## 📂 Directory Structure

- **`flake.nix`**: The entry point for the Nix setup. Defines the inputs (nixpkgs, home-manager) and the output configurations for different users/systems.
- **`home.nix`**: The main Home Manager configuration file. It:
  - Installs packages (`neovim`, `lazygit`, `ripgrep`, etc.).
  - Symlinks configuration directories (`nvim`, `wezterm`).
  - Sets environment variables.
  - Imports module-specific configs.
- **`git.nix`**: Git configuration (user details, aliases, credential helpers).
- **`zsh.nix`**: Zsh shell configuration, including plugins (Oh My Zsh) and init scripts.
- **`nvim/`**: Complete Neovim configuration (Lua based). Symlinked to `~/.config/nvim`.
- **`wezterm/`**: WezTerm configuration. Symlinked to `~/.config/wezterm`.

## 📦 Managed Tools

The following tools are installed and configured via this setup:

- **Core**: `git`, `zsh`
- **Editors**: `neovim` (with full Lua config)
- **Terminal**: `wezterm` (config managed)
- **Utilities**:
  - `lazygit` (Git TUI)
  - `ripgrep` (Fast grep alternative)
  - `fd` (Find alternative)
  - `jq` (JSON processor)
  - `tree`

## 🔄 Updating

To update the tools and configuration:

1. **Update Flake inputs (e.g., nixpkgs):**
   ```bash
   nix flake update
   ```

2. **Apply changes:**
   ```bash
   home-manager switch --flake .#suharadaigo
   ```
