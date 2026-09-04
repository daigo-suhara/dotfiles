{ ... }:

{
  plugins.telescope = {
    enable = true;
    settings.defaults = {
      path_display = "smart";
      mappings.i = {
        "<C-k>" = "move_selection_previous";
        "<C-j>" = "move_selection_next";
      };
    };
  };
}
