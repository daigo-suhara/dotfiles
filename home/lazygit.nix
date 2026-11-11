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
      git.diffRenderers = [ { command = "delta --paging=never"; } ];
      git.commit.signOff = true;
    };
  };
}
