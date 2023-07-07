local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    vim.notify("There is no Comment.nvim")
    return
end

comment.setup({
    ---Add a space b/w comment and the line
    padding = true,

    ---Whether the cursor should stay at its position
    sticky = true,

    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '<leader>/c',
        ---Block-comment toggle keymap
        block = '<leader>.c',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = '<leader>/',
        ---Block-comment keymap
        block = '<leader>.',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = '<leader>/O',
        ---Add comment on the line below
        below = '<leader>/o',
        ---Add comment at the end of line
        eol = '<leader>/A',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
})
