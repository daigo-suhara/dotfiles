{ ... }:

{
  plugins.snacks = {
    enable = true;
    settings = {
      dashboard = {
        enabled = true;
        sections = [
          { section = "header"; }
          {
            icon = " ";
            title = "Projects";
            section = "projects";
            indent = 2;
            padding = 1;
          }
        ];
      };
      gitbrowse.enabled = true;
      image.enabled = true;
      indent = {
        enabled = true;
        indent.char = "┊";
        scope.enabled = false;
        animate.enabled = false;
      };
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
