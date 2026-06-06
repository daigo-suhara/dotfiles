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

    # AI / assistant tools
    gemini-cli
    claude-code

    # Build and language tooling
    ccache
    cmake
    ninja
    gettext
    python3
    grpc-tools
    go
    nodejs
    protobuf
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
