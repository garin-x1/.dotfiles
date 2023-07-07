local ok, cmp = pcall(require, "cmp")
if not ok then
    vim.notify("There is no nvim-cmp")
    return
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
    vim.notify("There is no luasnip")
    return
end

local ok, lspkind = pcall(require, "lspkind")
if not ok then
    vim.notify("There is no lspkind")
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip'},
        { name = 'buffer' },
        { name = 'path' }
    }),
    formatting = {
        format = lspkind.cmp_format({
            width_text = false,
            maxwidth = 50,
            ellipsis_char = "...",
        })
    }
})

vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]]
