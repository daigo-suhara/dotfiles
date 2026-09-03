{ ... }:

{
  enable = true;
  defaultEditor = true;
  globals = { mapleader = " "; maplocalleader = ","; netrw_liststyle = 3; };
  opts = {
    fileencoding = "utf-8"; swapfile = false; hidden = true; autochdir = true;
    clipboard = "unnamedplus"; cmdheight = 0; showcmd = true; laststatus = 3;
    fillchars = { stl = "─"; stlnc = "─"; }; statusline = "─"; ruler = false;
    hlsearch = false; incsearch = true; matchtime = 1; termguicolors = true;
    shiftwidth = 4; tabstop = 4; expandtab = true; autoindent = true; smartindent = true;
    number = true; cursorline = false; relativenumber = false; wrap = false;
    showtabline = 0; visualbell = true; showmatch = true; list = true; scrolloff = 15;
    winblend = 0; pumblend = 0; signcolumn = "yes"; winborder = "rounded";
  };
  colorschemes.github-theme.enable = true;
  colorscheme = "github_dark_default";
  extraConfigVim = ''
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NormalFloat guibg=NONE ctermbg=NONE
    highlight FloatBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    highlight TelescopeBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    highlight TelescopePromptBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    highlight TelescopeResultsBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    highlight TelescopePreviewBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    highlight NoiceCmdlinePopupBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    highlight NoicePopupmenuBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    highlight WhichKeyBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    highlight CmpBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    augroup NixvimBorders
      autocmd!
      autocmd ColorScheme * highlight! PmenuSel guifg=#FFFFFF guibg=#30363D ctermfg=White ctermbg=DarkGray
      autocmd ColorScheme * highlight! FloatBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
      autocmd ColorScheme * highlight! TelescopeBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
      autocmd ColorScheme * highlight! TelescopePromptBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
      autocmd ColorScheme * highlight! TelescopeResultsBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
      autocmd ColorScheme * highlight! TelescopePreviewBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
      autocmd ColorScheme * highlight! NoiceCmdlinePopupBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
      autocmd ColorScheme * highlight! NoicePopupmenuBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
      autocmd ColorScheme * highlight! WhichKeyBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
      autocmd ColorScheme * highlight! CmpBorder guifg=#A5D6FF guibg=NONE ctermfg=LightBlue ctermbg=NONE
    augroup END
    highlight Pmenu guibg=NONE ctermbg=NONE
    highlight PmenuSel guifg=#FFFFFF guibg=#30363D ctermfg=White ctermbg=DarkGray
    highlight CmpNormal guibg=NONE ctermbg=NONE
    highlight TermNormal guibg=NONE ctermbg=NONE
    highlight TermNormalNC guibg=NONE ctermbg=NONE
    augroup NixvimTerminalCleanup
      autocmd!
      autocmd WinClosed * if winnr('$') == 1 && &buftype ==# 'terminal' | quit | endif
    augroup END
  '';
}
