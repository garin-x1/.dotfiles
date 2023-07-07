local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    vim.notify("There is no nvim-treesitter")
    return
end

treesitter.setup{
    ensure_installed = {"c", "cpp", "rust", "zig",
                        "make", "markdown", "markdown_inline",
                        "lua", "bash", "python", "haskell",
                        "html", "css", "javascript", "typescript", "tsx",
                        "toml", "json", "yaml",
    },
    sync_install = true,
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}
