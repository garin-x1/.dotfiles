local opts = { noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.localleader = " "

-- write/quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Change/Del Buffer/tab
keymap("n", "<leader>c", ":bdelete<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Change Split screen
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)

-- keymap("n", "<S-h>", "<C-w>h", opts)
-- keymap("n", "<S-l>", "<C-w>l", opts)
-- keymap("n", "<S-j>", "<C-w>j", opts)
-- keymap("n", "<S-k>", "<C-w>k", opts)

keymap("n", "<leader>v", "<C-w>v", opts)
keymap("n", "<leader>h", ":split<CR>", opts)

-- Resize split screen
keymap("n", "<A-J>", ":resize +1<CR>", opts)
keymap("n", "<A-K>", ":resize -1<CR>", opts)
keymap("n", "<A-H>", ":vertical resize +1<CR>", opts)
keymap("n", "<A-L>", ":vertical resize -1<CR>", opts)

keymap("n", "<leader>+", "<C-a>", opts)
keymap("n", "<leader>-", "<C-x>", opts)

keymap("i", "jk", "<ESC>", opts)

keymap("c", "jk", "<ESC>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Search and Replace
-- :{beginnum},{endnum}s#{before}#{after}#{command}
-- :'<,'>s#
-- :4,7s#\<two\>#vim#gic
-- :4,7s#two#vim#gi
-- :4,7s#\<two\>#vim#gi
-- ":%s#var#varepl#gi"
-- ":%s#var#varepl#g"
-- ":%s#var#varepl#g"
keymap("n", "<leader>t", ":'<,'>:s", opts)
-- keymap("n", "<leader>t", ":%s&", opts)
