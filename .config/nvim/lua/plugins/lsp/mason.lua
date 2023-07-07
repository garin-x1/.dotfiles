local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify("There is no lspconfig")
  return
end

local ok, mason = pcall(require, "mason")
if not ok then
  vim.notify("There is no mason.nvim")
  return
end

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  vim.notify("There is no mason.nvim")
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

local servers = {
  "clangd", "rust_analyzer",
  "lua_ls", "bashls",
  "pyright",
  "html", "cssls", "tailwindcss",
  "quick_lint_js", "tsserver",
  "jsonls", "yamlls", "marksman",
  -- "prettier",
  -- "mypy", "ruff",
}

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers
})

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr}
  -- if client.server_capabilities.documentFormattingProvider then
  --     vim.api.nvim_command [[augroup Format]]
  --     vim.api.nvim_command [[autocmd! * <buffer>]]
  --     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.formatting_seq_sync()]]
  --     vim.api.nvim_command [[augroup END]]
  -- end

  local keymaps = vim.keymap.set
  --local lspbuf = vim.lsp.buf
  keymaps('n', "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymaps('n', "<leader>ga", "<cmd>Lspsaga code_action<CR>", opts)
  keymaps('n', "<leader>gg", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  --keymaps('n', "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymaps('n', "[d", "<cmd>Lspsaga diagnostics_jump_prev<CR>", opts)
  keymaps('n', "]d", "<cmd>Lspsaga diagnostics_jump_next<CR>", opts)

  keymaps('n', '<leader>gp', '<cmd>Lspsaga preview_defintion<cr>', opts)
  keymaps('n', "<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  --keymaps('n', "<leader>gD", lspbuf.declaration, opts)
  keymaps('n', "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  --keymaps('n', "<leader>gi", lspbuf.implementation, opts)
  keymaps('n', "<leader>gr", require("telescope.builtin").lsp_references, opts)
  keymaps('n', "<leader>K", "<cmd>Lspsaga hover_doc<CR>", opts)
  if client.name == "tsserver" then
    keymaps("n", "<leader>rf", ":TypescriptRenameFile")
  end
end

local capabilities = cmp_lsp.default_capabilities();
local util = require("lspconfig/util")

for _, server in pairs(servers) do
  lspconfig[server].setup{
    capabilities = capabilities,
    on_attach = on_attach
  }
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"}
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
})

lspconfig.lua_ls.setup{
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true),
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
        checkThirdParty = false
      }
    }
  }
}

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        allFeatures = true,
      }
    }
  }
})

require("rust-tools").setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities
  }
})

-- 
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
