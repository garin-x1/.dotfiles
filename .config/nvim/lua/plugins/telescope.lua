local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("There is no telescope plugin")
  return
end

local keymap = vim.keymap.set
local tbuiltin = require("telescope.builtin");
function TELESCOPE_BUFFER_DIR()
  return vim.fn.expand('%:p:h')
end
local opts = { noremap = true, silent = true }
keymap("n", "<leader>ff", tbuiltin.find_files, opts)
keymap("n", "<leader>fg", tbuiltin.live_grep, opts)
keymap("n", "<leader>fb", tbuiltin.buffers, opts)
keymap("n", "<leader>fh", tbuiltin.help_tags, opts)
keymap("n", "<leader>fs", '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = TELESCOPE_BUFFER_DIR(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40, width = 100 }})<cr>', opts)
keymap("n", "<leader>fw", '<cmd>lua require("telescope).extensions.git_worktree.git_worktrees()', opts)
-- keymap("n", "<leader>fs", require("telescope").extensions.file_browser.file_browser({ path = "%:p:h",
--     cwd = TELESCOPE_BUFFER_DIR(),
--     respect_git_ignore = false,
--     hidden = true,
--     grouped = true,
--     previewer = false,
--     initial_mode = "normal",
--     layout_config = { height = 40 }
-- }), opts)


local fb_actions = require("telescope").extensions.file_browser.actions
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function () vim.cmd('normal vdb') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function() vim.cmd('startinsert') end,
        }
      }
    }
  }
})

telescope.load_extension('file_browser')
telescope.load_extension("git_worktree")
