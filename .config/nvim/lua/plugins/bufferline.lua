local ok, buffertab = pcall(require, "bufferline")
if not ok then
    vim.notify("There is no bufferline plugin")
    return
end

buffertab.setup{
    options = {
        -- close_command = "Bdelete! %d",
        -- close_command = "BufDel",
        --mode = 'tabs',
        -- separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        offsets = { { filetype = "NvimTree", text = "Explorer", padding = 1 } },
    },
    highlights = {
        separator = {
            guifg = '#073642',
            guibg = '#002b36',
        },
        separator_selected = {
            guifg = '#073642'
        },
        background = {
            guifg = '#657b83',
            guibg = '#002b36'
        },
        buffer_selected = {
            guifg = '#fdf6e3',
            gui = 'bold'
        },
        fill = {
            guibg = '#073642'
        }
    }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
