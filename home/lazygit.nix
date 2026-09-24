{ ... }:

{
  # Lazygit workflow customizations
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        nerdFontsVersion = "3";
        showFileIcons = true;
      };
      git.pagers = [ { pager = "delta --paging=never"; } ];
      git.commit.signOff = true;
    };
  };
}
