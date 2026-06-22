{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core tools
    ansible
    terraform
    kubernetes-helm

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

    # AI / assistant tools
    gemini-cli
    claude-code

    # Build and language tooling
    clang-tools
    gcc
    ccache
    cmake
    ninja
    ac-library
    python3Packages.online-judge-tools
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
  ];
}
