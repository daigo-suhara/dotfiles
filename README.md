# Dotfiles managed by Nix

This repository contains my personal macOS (Apple Silicon) configuration, managed with **Nix**, **nix-darwin**, and **Home Manager**.

## 🛠 Installation & Usage
1. **Install Nix**
   Use nix-installer

   ```bash
   curl -fsSL https://install.determinate.systems/nix | sh -s -- install
   ```

2. **Clone the repository:**
   It is recommended to clone this into `~/dotfiles` as the configuration currently assumes this path for symlinking certain config directories.

   ```bash
   git clone https://github.com/daigo-suhara/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

3. **Apply the configuration:**
   ```bash
   nix run .#update
   ```

## 🔄 Updating

To update the tools and configuration:

1. **Update Flake inputs (e.g., nixpkgs):**
   ```bash
   nix run .#update
   ```
