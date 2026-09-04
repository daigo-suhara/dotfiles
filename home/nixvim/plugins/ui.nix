{ ... }:

{
  plugins = {
    web-devicons.enable = true;
    lualine.enable = true;
    which-key = { enable = true; settings.triggers = [ { __unkeyed-1 = "<auto>"; mode = "n"; } ]; };
    noice.enable = true;
    notify = { enable = true; settings.background_colour = "#000000"; };
    dashboard.enable = true;
    fidget.enable = true;
    colorizer = { enable = true; settings.user_default_options = { RGB = true; RRGGBB = true; names = false; RRGGBBAA = false; rgb_fn = false; hsl_fn = false; css = false; css_fn = false; mode = "background"; }; };
    hlchunk.enable = true;
    transparent = { enable = true; settings = { groups = [ "Normal" "NormalNC" "Comment" "Constant" "Special" "Identifier" "Statement" "PreProc" "Type" "Underlined" "Todo" "String" "Function" "Conditional" "Repeat" "Operator" "Structure" "LineNr" "NonText" "SignColumn" "CursorLine" "CursorLineNr" "StatusLine" "StatusLineNC" "EndOfBuffer" "BufferLineFill" "BufferLineBackground" ]; extra_groups = [ "NormalFloat" "FloatBorder" "Pmenu" "CmpNormal" "TermNormal" "TermNormalNC" ]; }; };
  };
}
