local ok, colorizer = pcall(require, "colorizer")
if not ok then
    vim.notify("There is no nvim-colorizer")
    return
end

colorizer.setup{
    '*';
}
