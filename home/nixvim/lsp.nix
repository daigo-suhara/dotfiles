{ ... }:

{
  lsp.keymaps = [
    { key = "<leader>ca"; lspBufAction = "code_action"; options.desc = "Code action"; }
    { key = "<leader>cr"; lspBufAction = "rename"; options.desc = "Rename symbol"; }
    { key = "<leader>cd"; action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>"; options.desc = "Definitions"; }
    { key = "<leader>cD"; lspBufAction = "declaration"; options.desc = "Declaration"; }
    { key = "<leader>ci"; action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>"; options.desc = "Implementations"; }
    { key = "<leader>cR"; action = "<cmd>lua Snacks.picker.lsp_references()<CR>"; options.desc = "References"; }
    { key = "<leader>ct"; action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>"; options.desc = "Type definitions"; }
    { key = "<leader>cs"; action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>"; options.desc = "Document symbols"; }
    { key = "<leader>cS"; action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>"; options.desc = "Workspace symbols"; }
    { key = "<leader>ch"; lspBufAction = "hover"; options.desc = "Hover"; }
  ];
  plugins.lsp = {
    enable = true;
    servers = {
      lua_ls = { enable = true; package = null; };
      rust_analyzer = { enable = true; package = null; installCargo = false; installRustc = false; };
      intelephense = { enable = true; package = null; };
      nil_ls = { enable = true; package = null; };
      gopls = { enable = true; package = null; };
      clangd = { enable = true; package = null; };
      pyright = { enable = true; package = null; };
      vtsls = { enable = true; package = null; };
      eslint = { enable = true; package = null; };
      emmet_ls = { enable = true; package = null; };
      biome = { enable = true; package = null; };
    };
  };
}
