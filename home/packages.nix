{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core tools
    ansible
    terraform

    # Editor and search tooling
    ripgrep
    eza
    fd
    jq
    git
    gh
    gh-dash

    # Containers
    docker-compose
    lazydocker
    devpod
    k9s
    kubectl
    kubectx
    kind
    kubernetes-helm
    kustomize

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
  ];
}
