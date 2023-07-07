local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
    vim.notify("")
    return
end

autopairs.setup{}
