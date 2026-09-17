{ ... }:

{
  plugins.snacks = {
    enable = true;
    settings = {
      dashboard = {
        enabled = true;
        sections = [
          { section = "header"; }
        ];
      };
      explorer = {
        enabled = true;
        replace_netrw = true;
        trash = true;
      };
      gitbrowse.enabled = true;
      image.enabled = true;
      indent.enabled = true;
      input.enabled = true;
      notifier.enabled = true;
      picker = {
        enabled = true;
        formatters.file.icon_width = 3;
        sources.explorer.layout.layout.position = "right";
      };
      scroll.enabled = true;
      scope.enabled = true;
      terminal = {
        enabled = true;
        win.border = "rounded";
        win.position = "float";
        win.wo.winbar = "";
      };
      toggle.enabled = true;
    };
  };
}
