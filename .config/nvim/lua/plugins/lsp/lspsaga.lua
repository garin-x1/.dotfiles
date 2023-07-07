local ok, saga = pcall(require, "lspsaga")
if not ok then
    vim.notify("There is no lspsaga")
    return
end

saga.setup({
    server_filetype_map = {},
    move_in_saga = { prev = "<C-k>", next = "<C-j>"},
    finder_action_keys = {
        open = "<CR>",
    },
    definition_action_keys = {
        edit = "<CR>",
    },
    ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "💡",
        -- incoming = " ",
        -- outgoing = " ",
        -- code_action = "",
        incoming = "",
        outgoing = "",
        hover = ' ',
        kind = {},
    },
})


-- local opts = { noremap = true, silent = true}
-- local keymaps = vim.keymap.set
-- local lspbuf = vim.lsp.buf
-- vim.keymap.set('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
-- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
-- vim.keymap.set('n', '<leader>gd', '<cmd>Lspsaga lsp_finder<cr>', opts)
-- vim.keymap.set('n', '<C-k>', '<cmd>Lspsaga signature_help<cr>', opts)
-- vim.keymap.set('n', '<leader>gp', '<cmd>Lspsaga preview_defintion<cr>', opts)
-- vim.keymap.set('n', '<leader>gr', '<cmd>Lspsaga rename<cr>', opts)
-- vim.keymap.set('n', '<leader>gg', '<cmd>Lspsaga show_line_diagnostics<cr>',opts)

-- keymaps('n', '<leader>ga', '<cmd>Lspsaga code_action<cr>', opts)
-- keymaps('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
-- keymaps('n', '<leader>ga', '<cmd>Lspsaga code_action<CR>', opts)
-- keymaps('n', '<leader>gg', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
--keymaps('n', '<leader>d', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
-- keymaps('n', '[d', '<cmd>Lspsaga diagnostics_jump_prev<CR>', opts)
-- keymaps('n', ']d', '<cmd>Lspsaga diagnostics_jump_next<CR>', opts)
--
-- keymaps('n', '<leader>gp', '<cmd>Lspsaga preview_defintion<cr>', opts)
-- keymaps('n', '<leader>gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
--keymaps('n', '<leader>gD', lspbuf.declaration, opts)
-- keymaps('n', '<leader>gd', '<cmd>Lspsaga peek_definition<CR>', opts)
--keymaps('n', '<leader>gi', lspbuf.implementation, opts)
-- keymaps('n', '<leader>gr', require('telescope.builtin').lsp_references, opts)
-- keymaps('n', '<leader>K', '<cmd>Lspsaga hover_doc<CR>', opts)
