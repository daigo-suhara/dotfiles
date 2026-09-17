{ ... }:

{
  plugins.snacks = {
    enable = true;
    settings = {
      dashboard = {
        enabled = true;
        preset.keys = [
          { icon = " "; key = "f"; desc = "Find files"; action = "<leader>ff"; }
          { icon = " "; key = "e"; desc = "Explorer"; action = "<leader>e"; }
          { icon = " "; key = "q"; desc = "Quit"; action = ":qa"; }
        ];
        sections = [
          { section = "header"; }
          { section = "keys"; gap = 1; padding = 1; }
        ];
      };
      explorer = {
        enabled = true;
        replace_netrw = true;
        trash = true;
      };
      indent.enabled = true;
      input.enabled = true;
      notifier.enabled = true;
      picker = {
        enabled = true;
        formatters.file.icon_width = 3;
        sources.explorer.layout.layout.position = "right";
      };
      scroll.enabled = true;
      terminal.enabled = true;
      toggle.enabled = true;
    };
  };
}
