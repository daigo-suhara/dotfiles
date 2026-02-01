{ config, pkgs, ... }:

{
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
        cat = "bat";
    };

    initContent = ''
      export PATH="/Volumes/CrucialX9/Dev/depot_tools:$PATH"
      bindkey '^F' autosuggest-accept
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ffb6c1'
    '';
  };
}
