local ok, autotag = pcall(require, "nvim-ts-autotag")
if not ok then
    vim.notify("There is no nvim-ts-autotag")
    return
end

autotag.setup{}
