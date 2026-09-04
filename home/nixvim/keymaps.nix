{ ... }:

{
  keymaps = [
    { mode = "n"; key = "j"; action = "gj"; }
    { mode = "n"; key = "k"; action = "gk"; }
    { mode = "i"; key = "jj"; action = "<Esc>"; options.silent = true; }
    { mode = "n"; key = "<leader>nh"; action = ":nohl<CR>"; options.desc = "Clear search highlights"; }
    { mode = "n"; key = "<leader>w"; action = ":wq<CR>"; options.desc = "Save and exit"; }
    { mode = "n"; key = "q"; action = ":q<CR>"; options.desc = "Exit"; }
    { mode = "n"; key = "<S-j>"; action = "<C-d>"; }
    { mode = "n"; key = "<S-k>"; action = "<C-u>"; }
    { mode = "n"; key = "<leader>sv"; action = "<C-w>v"; }
    { mode = "n"; key = "<leader>sh"; action = "<C-w>s"; }
    { mode = "n"; key = "<leader>se"; action = "<C-w>="; }
    { mode = "n"; key = "<leader>sx"; action = "<cmd>close<CR>"; }
    { mode = [ "n" "t" ]; key = "<C-h>"; action = "<cmd>wincmd h<CR>"; }
    { mode = [ "n" "t" ]; key = "<C-j>"; action = "<cmd>wincmd j<CR>"; }
    { mode = [ "n" "t" ]; key = "<C-k>"; action = "<cmd>wincmd k<CR>"; }
    { mode = [ "n" "t" ]; key = "<C-l>"; action = "<cmd>wincmd l<CR>"; }
    { mode = [ "n" "t" ]; key = "<C-t>"; action = "<cmd>ToggleTerm<CR>"; }
    { mode = "n"; key = "<leader>t"; action = "<cmd>ToggleTerm direction=float<CR>"; }
    { mode = "n"; key = "<leader>lg"; action = "<cmd>2TermExec cmd='lazygit; exit' direction=float<CR>"; }
    { mode = "n"; key = "<leader>ld"; action = "<cmd>TermExec cmd='lazydocker' direction=float<CR>"; }
    { mode = "n"; key = "-"; action = "<cmd>Oil<CR>"; }
    { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<CR>"; }
    { mode = "n"; key = "<leader>fr"; action = "<cmd>Telescope oldfiles<CR>"; }
    { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<CR>"; }
    { mode = "n"; key = "<leader>fs"; action = "<cmd>Telescope live_grep<CR>"; }
    { mode = "n"; key = "<leader>fc"; action = "<cmd>Telescope grep_string<CR>"; }
    { mode = "t"; key = "<Esc>"; action = "<C-\\><C-n>"; }
    { mode = "t"; key = "<C-w>"; action = "<C-\\><C-n><C-w>"; }
    { mode = "n"; key = "f"; action = "<cmd>HopWord<CR>"; options.desc = "Hop word"; }
  ];
}
