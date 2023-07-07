local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    vim.notify("there is no lspconfig")
    return
end
local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
    vim.notify("there is no lspconfig")
    return
end
local ok, typescript = pcall(require, "typescript")
if not ok then
    vim.notify("there is no lspconfig")
    return
end
