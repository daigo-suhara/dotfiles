{ ... }:

{
  plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = true;
      columns = [ "icon" ];
      delete_to_trash = true;
      skip_confirm_for_simple_edits = true;
      prompt_save_on_select_new_entry = true;
      cleanup_delay_ms = 2000;
      constrain_cursor = "editable";
      view_options = { show_hidden = true; natural_order = true; case_insensitive = false; sort = [ [ "type" "asc" ] [ "name" "asc" ] ]; };
      win_options = { wrap = false; signcolumn = "no"; cursorcolumn = false; foldcolumn = "0"; spell = false; list = false; conceallevel = 3; concealcursor = "nvic"; };
      keymaps = { "g?" = "actions.show_help"; "<CR>" = "actions.select"; "<C-v>" = "actions.select"; "<C-h>" = "actions.select"; "<C-t>" = "actions.select"; "<C-p>" = "actions.preview"; "<C-c>" = "actions.close"; "<C-l>" = "actions.refresh"; "-" = "actions.parent"; "_" = "actions.open_cwd"; "gs" = "actions.change_sort"; "gx" = "actions.open_external"; "g." = "actions.toggle_hidden"; "g\\" = "actions.toggle_trash"; };
    };
  };
}
