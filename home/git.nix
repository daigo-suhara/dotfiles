{ user, ... }:

{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      side-by-side = true;
      syntax-theme = "GitHub Dark";
    };
  };

  programs.git = {
    enable = true;
    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    settings = {
      user = {
        name = user.userfullname;
        email = user.useremail;
      };
      core = {
        autocrlf = false;
        filemode = false;
      };
      format.signOff = true;
      pull.rebase = true;
      color.ui = true;
    };
  };
}
