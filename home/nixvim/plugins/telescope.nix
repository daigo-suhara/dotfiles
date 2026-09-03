{ ... }:

{
  plugins.telescope = {
    enable = true;
    settings.defaults = {
      path_display = "smart";
      mappings.i = {
        "<C-k>" = "require('telescope.actions').move_selection_previous";
        "<C-j>" = "require('telescope.actions').move_selection_next";
      };
    };
  };
}
