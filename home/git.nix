{ config, user, ... }:

{
  programs.git = {
    enable = true;
    signing.format = null;
    settings = {
      user = {
        name = user.userfullname;
        email = user.useremail;
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
