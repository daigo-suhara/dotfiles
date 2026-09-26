{ ... }:

{
  enable = true;
  defaultEditor = true;
  globals = { mapleader = " "; maplocalleader = ","; netrw_liststyle = 3; };
  opts = {
    fileencoding = "utf-8"; swapfile = false; hidden = true; autochdir = true;
    clipboard = "unnamedplus"; cmdheight = 0; showcmd = true; laststatus = 0;
    fillchars = { stl = "─"; stlnc = "─"; }; statusline = " "; ruler = false;
    hlsearch = false; incsearch = true; matchtime = 1; termguicolors = true;
    shiftwidth = 4; tabstop = 4; expandtab = true; autoindent = true; smartindent = true;
    number = true; cursorline = false; relativenumber = false; wrap = true;
    showtabline = 0; visualbell = true; showmatch = true; list = true; scrolloff = 15;
    winblend = 0; pumblend = 0; signcolumn = "yes"; winborder = "rounded";
  };
  colorschemes.github-theme.enable = true;
  colorscheme = "github_dark_default";
  extraConfigVim = ''
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NormalNC guibg=NONE ctermbg=NONE
    highlight NormalFloat guibg=NONE ctermbg=NONE
    highlight StatusLine guifg=#58A6FF guibg=NONE gui=NONE cterm=NONE
    highlight StatusLineNC guifg=#58A6FF guibg=NONE gui=NONE cterm=NONE
    highlight WinSeparator guifg=#58A6FF
    highlight VertSplit guifg=#58A6FF
    highlight FloatBorder guifg=#58A6FF guibg=NONE ctermfg=Blue ctermbg=NONE
    augroup NixvimBorders
      autocmd!
      autocmd ColorScheme * highlight! Normal guibg=NONE ctermbg=NONE
      autocmd ColorScheme * highlight! NormalNC guibg=NONE ctermbg=NONE
      autocmd ColorScheme * highlight! NormalFloat guibg=NONE ctermbg=NONE
      autocmd ColorScheme * highlight! PmenuSel guifg=#FFFFFF guibg=#30363D ctermfg=White ctermbg=DarkGray
      autocmd ColorScheme * highlight! StatusLine guifg=#58A6FF guibg=NONE gui=NONE cterm=NONE
      autocmd ColorScheme * highlight! StatusLineNC guifg=#58A6FF guibg=NONE gui=NONE cterm=NONE
      autocmd ColorScheme * highlight! WinSeparator guifg=#58A6FF
      autocmd ColorScheme * highlight! VertSplit guifg=#58A6FF
      autocmd ColorScheme * highlight! FloatBorder guifg=#58A6FF guibg=NONE ctermfg=Blue ctermbg=NONE
    augroup END
    highlight Pmenu guibg=NONE ctermbg=NONE
    highlight PmenuSel guifg=#FFFFFF guibg=#30363D ctermfg=White ctermbg=DarkGray
    highlight CmpNormal guibg=NONE ctermbg=NONE
    highlight TermNormal guibg=NONE ctermbg=NONE
    highlight TermNormalNC guibg=NONE ctermbg=NONE
  '';
}
