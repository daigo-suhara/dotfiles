{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Daigo Suhara";
        email = "suharadaigo@gmail.com";
      };
      core = {
        autocrlf = false;
        filemode = false;
      };
      color.ui = true;
    };
  };
}

