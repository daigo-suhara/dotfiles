{ ... }:

{
  # Zsh and directory navigation
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      ls = "eza";
      cat = "bat";
      grep = "rg";
      top = "btop";
      ping = "gping";
      lg = "lazygit";
      ld = "lazydocker";
      lq = "lazysql";
      v = "nvim";
      reload = "exec $SHELL -l";
    };

    # Extra configuration
    initContent = ''
      export PATH="/Volumes/CrucialX9/Dev/depot_tools:$PATH"

      bindkey '^F' autosuggest-accept
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ffb6c1'
    '';
  };
}
