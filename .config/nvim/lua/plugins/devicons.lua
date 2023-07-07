local ok, icons = pcall(require, "nvim-web-devicons")
if not ok then
    vim.notify("There is no nvim-web-devicons")
    return
else
    icons.setup {
        color_icons = true;
        default = true;
    }
end
