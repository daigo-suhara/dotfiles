{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core tools
    ansible
    terraform

    # Editor and search tooling
    neovim
    ripgrep
    eza
    fd
    jq
    git
    gh

    # Containers
    docker-compose
    lazydocker
    devpod
    k9s
    kubernetes-helm

    # Security
    rustscan
    nmap

    # AI
    gemini-cli
    claude-code

    # Build and language tooling
    clang-tools
    gcc
    ccache
    cmake
    ninja
    gettext
    buf
    python3
    grpc-tools
    go
    nodejs
    sqlc

    # Terminal utilities
    bat
    delta
    btop
    gping
    yazi
    firebase-tools

    # Neovim tooling
    lua-language-server
    rust-analyzer
    intelephense
    nil
    pyright
    vtsls
    typescript
    vscode-langservers-extracted
    emmet-ls
    gopls
    delve
    stylua
    black
    isort
    biome
  ];
}
