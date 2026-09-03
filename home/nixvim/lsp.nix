{ ... }:

{
  lsp.keymaps = [
    { key = "<leader>rn"; lspBufAction = "rename"; }
    { key = "gr"; action = "<cmd>Telescope lsp_references<CR>"; }
    { key = "gI"; action = "<cmd>Telescope lsp_implementations<CR>"; }
    { key = "gd"; action = "<cmd>Telescope lsp_definitions<CR>"; }
    { key = "gD"; lspBufAction = "declaration"; }
    { key = "<leader>ds"; action = "<cmd>Telescope lsp_document_symbols<CR>"; }
    { key = "<leader>ws"; action = "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>"; }
    { key = "gt"; action = "<cmd>Telescope lsp_type_definitions<CR>"; }
    { key = "K"; lspBufAction = "hover"; }
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

