{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Daigo Suhara";
    userEmail = "suharadaigo@gmail.com";
    
    extraConfig = {
      core = {
        autocrlf = false;
        filemode = false;
      };
      color.ui = true;

      # Google Source Credential Helpers
      # Uncomment and add others if needed.
      # "credential \"https://chromium.googlesource.com\"" = {
      #   helper = [ "" "luci" ];
      #   useHttpPath = true;
      # };
    };
  };
}

