{ ... }:

{
  keymaps = [
    # Navigation
    { mode = "n"; key = "j"; action = "gj"; }
    { mode = "n"; key = "k"; action = "gk"; }
    { mode = "n"; key = "<S-j>"; action = "<C-d>"; }
    { mode = "n"; key = "<S-k>"; action = "<C-u>"; }
    { mode = "n"; key = "f"; action = "<cmd>HopWord<CR>"; options.desc = "Hop word"; }

    # Editing
    { mode = "i"; key = "jj"; action = "<Esc>"; options.silent = true; }
    { mode = "n"; key = "<leader>nh"; action = ":nohl<CR>"; options.desc = "Clear search highlights"; }
    { mode = "n"; key = "<leader>w"; action = ":wq<CR>"; options.desc = "Save and exit"; }
    { mode = "n"; key = "<leader>q"; action = ":qa<CR>"; options.desc = "Quit Neovim"; }

    # Windows
    { mode = "n"; key = "<leader>sv"; action = "<C-w>v"; options.desc = "Split vertically"; }
    { mode = "n"; key = "<leader>sh"; action = "<C-w>s"; options.desc = "Split horizontally"; }
    { mode = "n"; key = "<leader>se"; action = "<C-w>="; options.desc = "Equalize windows"; }
    { mode = "n"; key = "<leader>sx"; action = "<cmd>close<CR>"; options.desc = "Close window"; }
    { mode = [ "n" "t" ]; key = "<C-h>"; action = "<cmd>wincmd h<CR>"; }
    { mode = [ "n" "t" ]; key = "<C-j>"; action = "<cmd>wincmd j<CR>"; }
    { mode = [ "n" "t" ]; key = "<C-k>"; action = "<cmd>wincmd k<CR>"; }
    { mode = [ "n" "t" ]; key = "<C-l>"; action = "<cmd>wincmd l<CR>"; }

    # Files and registers
    { mode = "n"; key = "<Tab>"; action = "<cmd>BufferLineCycleNext<CR>"; options.desc = "Next buffer"; }
    { mode = "n"; key = "<S-Tab>"; action = "<cmd>BufferLineCyclePrev<CR>"; options.desc = "Previous buffer"; }
    { mode = "n"; key = "<leader>e"; action = "<cmd>Yazi<CR>"; options.desc = "Yazi"; }
    { mode = "n"; key = "<leader>ff"; action = "<cmd>lua Snacks.picker.files()<CR>"; options.desc = "Files"; }
    { mode = "n"; key = "<leader>fr"; action = "<cmd>lua Snacks.picker.recent()<CR>"; options.desc = "Recent files"; }
    { mode = "n"; key = "<leader>fb"; action = "<cmd>lua Snacks.picker.buffers()<CR>"; options.desc = "Buffers"; }
    { mode = "n"; key = "<leader>fs"; action = "<cmd>lua Snacks.picker.grep()<CR>"; options.desc = "Grep"; }
    { mode = "n"; key = "<leader>fc"; action = "<cmd>lua Snacks.picker.grep_word()<CR>"; options.desc = "Grep word"; }
    { mode = "n"; key = "<leader>r"; action = "<cmd>lua Snacks.picker.registers()<CR>"; options.desc = "Registers"; }
    { mode = "n"; key = "<leader>mp"; action = "<cmd>Markview splitToggle<CR>"; options.desc = "Markdown preview"; }

    # Terminal and tools
    { mode = [ "n" "t" ]; key = "<C-t>"; action = "<cmd>lua Snacks.terminal.toggle()<CR>"; }
    { mode = "n"; key = "<leader>lg"; action = "<cmd>lua Snacks.terminal.toggle('lazygit')<CR>"; options.desc = "Lazygit"; }
    { mode = "n"; key = "<leader>ld"; action = "<cmd>lua Snacks.terminal.toggle('lazydocker')<CR>"; options.desc = "Lazydocker"; }

    # GitHub
    { mode = "n"; key = "<leader>gi"; action = "<cmd>Octo issue list<CR>"; options.desc = "GitHub issues"; }
    { mode = "n"; key = "<leader>gn"; action = "<cmd>Octo issue create<CR>"; options.desc = "New GitHub issue"; }
    { mode = "n"; key = "<leader>gp"; action = "<cmd>Octo pr list<CR>"; options.desc = "GitHub pull requests"; }
    { mode = [ "n" "x" ]; key = "<leader>gb"; action = "<cmd>lua Snacks.gitbrowse()<CR>"; options.desc = "Git browse"; }

    # Testing and debugging
    { mode = "n"; key = "<leader>tn"; action = "<cmd>lua require('neotest').run.run()<CR>"; options.desc = "Test nearest"; }
    { mode = "n"; key = "<leader>tf"; action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>"; options.desc = "Test file"; }
    { mode = "n"; key = "<leader>tt"; action = "<cmd>lua require('neotest').run.run(vim.fn.getcwd()); require('neotest').summary.open()<CR>"; options.desc = "Test suite"; }
    { mode = "n"; key = "<leader>tl"; action = "<cmd>lua require('neotest').run.run_last()<CR>"; options.desc = "Test last"; }
    { mode = "n"; key = "<leader>to"; action = "<cmd>lua require('neotest').output.open({ enter = true })<CR>"; options.desc = "Test output"; }
    { mode = "n"; key = "<leader>ts"; action = "<cmd>lua require('neotest').summary.toggle()<CR>"; options.desc = "Test summary"; }
    { mode = "n"; key = "<leader>tc"; action = "<cmd>Coverage<CR>"; options.desc = "Show coverage"; }
    { mode = "n"; key = "<leader>tC"; action = "<cmd>CoverageClear<CR>"; options.desc = "Clear coverage"; }
    { mode = "n"; key = "<leader>dv"; action = "<cmd>DapViewOpen<CR>"; options.desc = "Debug view"; }

    # Terminal mode
    { mode = "t"; key = "<Esc>"; action = "<C-\\><C-n>"; }
    { mode = "t"; key = "<C-w>"; action = "<C-\\><C-n><C-w>"; }
  ];
}
