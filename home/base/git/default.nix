{ config, pkgs, ... }:

let
  vars = import ../../../vars/default.nix;
in
{
  programs.git = {
    enable = true;
    signing.format = null;
    settings = {
      user = {
        name = vars.userfullname;
        email = vars.useremail;
      };
      core = {
        autocrlf = false;
        filemode = false;
      };
      commit = {
        template = "~/.gitmessage";
      };
      color.ui = true;
    };
  };

  home.file.".gitmessage".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.gitmessage";
}

