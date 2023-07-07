local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- vim.cmd([[
--     augroup lazy_handle_event
--         autocmd!
--         autocmd BufWritePost plugman.lua source % | Lazy sync
--     augroup end
-- ]])

local plugins = {
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",

  "numToStr/Comment.nvim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "christoomey/vim-tmux-navigator",

  "glepnir/dashboard-nvim",
  "nvim-lualine/lualine.nvim",
  "akinsho/bufferline.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  -- "nvim-tree/nvim-tree.lua",
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup()
    end
  },
  {
    "dinhhuy258/git.nvim",
    config = function ()
      require("git").setup({
        keymap = {
          blame = "<leader>gb",
          browse = "<leader>go"
        }
      })
    end
  },
  {
    "ThePrimeAgen/git-worktree.nvim",
    config = function ()
      require("git-worktree").setup()
    end
  },

  "norcalli/nvim-colorizer.lua",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  {
    "barrett-ruth/live-server.nvim",
    build = 'npm install -g live-server',
    config = function ()
      require("live-server").setup({
        args = {"--port=7000", "--browser=firefox"}
      })
    end
  },

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "neovim/nvim-lspconfig",
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
  },
  "onsails/lspkind.nvim",
  "jose-elias-alvarez/typescript.nvim",

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    -- opts = function ()
    --   return require("plugins.rust-tools-conf")
    -- end,
    -- config = function (_, opts)
    --   require("rust-tools").setup(opts)
    -- end
  },

  {
    "mfussenegger/nvim-dap",
    -- config = function ()
    --   require("nvim-dap").setup()
    -- end
  },

  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },
{},

  "jose-elias-alvarez/null-ls.nvim",
  "MunifTanjim/prettier.nvim",

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  {
    "ellisonleao/gruvbox.nvim",
    config = function ()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })
      vim.cmd("colorscheme gruvbox")
    end,
    lazy = false,
    priority = 1000,
  },

  -- {
  --     "christoomey/vim-tmux-navigator",
  --     config = function()
  --         require("vim-tmux-navigator").setup()
  --     end,
  -- },

  -- {
  --     "connordeckers/tmux-navigator.nvim",
  --     config = function()
  --         require("tmux-navigator").setup{
  --             enable = true,
  --         }
  --     end
  -- },


  -- {
  --     "monsonjeremy/onedark.nvim",
  --     branch = "treesitter",
  --     config = function()
  --         require("onedark").setup({
  --             transparent = false,
  --             hideinactivestatusline = true,
  --             customtelescope = true,
  --         })
  --         vim.cmd("colorscheme onedark")
  --     end,
  --     lazy = false,
  --     priority = 1000,
  -- },

  -- {
  --     "svrana/neosolarized.nvim",
  --     dependencies = "tjdevries/colorbuddy.nvim",
  --     config = function()
  --         require("colorbuddy").setup()
  --         require("neosolarized").setup({
  --             comment_italics = true,
  --             background_set = false,
  --         })
  --         vim.cmd("colorscheme neosolarized")
  --     end,
  -- },

  -- {
  --     "Shatur/neovim-ayu",
  -- },

  -- {
  --     "arturgoms/moonbow.nvim",
  -- },

  -- {
  --     "maxmx03/dracula.nvim"
  -- },

  -- {
  --     "mofiqul/dracula.nvim",
  --     config = function()
  --         require("dracula").setup({
  --             transparent_bg = true,
  --         })
  --     end,
  -- },


  -- {
  --     "catppuccin/nvim",
  --     config = function ()
  --         require("catppuccin").setup({
  --             transparent_background = true,
  --         })
  --     end,
  -- },
}

require("lazy").setup(plugins, opts)

require("core")
require("plugins")
