local ok, nvtree = pcall(require, "nvim-tree")
if not ok then
    vim.notify("There is no nvim-tree")
    return
end

nvtree.setup({

})
