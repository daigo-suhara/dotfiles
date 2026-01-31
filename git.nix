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

      # Google Source Credential Helpers
      # Uncomment and add others if needed.
      # "credential \"https://chromium.googlesource.com\"" = {
      #   helper = [ "" "luci" ];
      #   useHttpPath = true;
      # };
    };
  };
}

