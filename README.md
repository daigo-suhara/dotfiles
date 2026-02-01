# Dotfiles managed by Nix

This repository contains my personal dotfiles and development environment configuration, managed using **Nix** and **Home Manager**. It ensures a reproducible setup across different machines, specifically targeting macOS (Apple Silicon) and Linux.

## 🚀 Features

- **Package Management**: All core CLI tools are installed via Nix.
- **Configuration Management**: Dotfiles for Neovim, WezTerm, Git, and Zsh are automatically linked and managed.
- **Reproducibility**: The exact same versions of tools and configurations can be deployed on any new machine with a single command.

## 📋 Prerequisites

Before using this configuration, ensure you have **Nix** installed.

### Install Nix

**Use nix-installer (Recommended):**
```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

## 🛠 Installation & Usage

1. **Clone the repository:**
   It is recommended to clone this into `~/dotfiles` as the configuration currently assumes this path for symlinking certain config directories.

   ```bash
   git clone https://github.com/daigo-suhara/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Apply the configuration:**
   ```bash
   nix run .#update
   ```


## 🔄 Updating

To update the tools and configuration:

1. **Update Flake inputs (e.g., nixpkgs):**
   ```bash
   nix run .#update
   ```
