{ ... }:

{
  enable = true;
  defaultEditor = true;
  globals = { mapleader = " "; maplocalleader = ","; netrw_liststyle = 3; };
  opts = {
    fileencoding = "utf-8"; swapfile = false; hidden = true; autochdir = true;
    clipboard = "unnamedplus"; cmdheight = 0; showcmd = true; laststatus = 0;
    ruler = false;
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
    highlight FloatBorder guifg=#A5D6FF
    highlight WinSeparator guifg=#58A6FF
    highlight VertSplit guifg=#58A6FF
    function! s:link_float_borders() abort
      for group in ["TelescopeBorder", "TelescopePromptBorder", "TelescopeResultsBorder", "TelescopePreviewBorder", "NoiceCmdlinePopupBorder", "NoicePopupmenuBorder", "WhichKeyBorder", "CmpBorder"]
        execute "highlight! link " . group . " FloatBorder"
      endfor
    endfunction
    call s:link_float_borders()
    augroup NixvimBorders
      autocmd!
      autocmd ColorScheme * highlight! PmenuSel guifg=#FFFFFF guibg=#30363D ctermfg=White ctermbg=DarkGray
      autocmd ColorScheme * highlight! FloatBorder guifg=#A5D6FF
      autocmd ColorScheme * highlight! WinSeparator guifg=#58A6FF
      autocmd ColorScheme * highlight! VertSplit guifg=#58A6FF
      autocmd ColorScheme * call s:link_float_borders()
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
