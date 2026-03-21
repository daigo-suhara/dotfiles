{ config, pkgs, ... }:

let
  vars = import ../../../vars/default.nix;
in
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = vars.userfullname;
        email = vars.useremail;
      };
      core = {
        autocrlf = false;
        filemode = false;
      };
      color.ui = true;
    };
  };
}

