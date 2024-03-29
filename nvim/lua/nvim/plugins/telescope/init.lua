local actions = require('telescope.actions')
local themes = require('telescope.themes')

require("telescope").setup {
  defaults = themes.get_dropdown {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    file_sorter = require "telescope.sorters".get_fzy_sorter,
    file_ignore_patterns = {},
    path_display = {'absolute'},
    -- path_display = {'tail'},
    layout_config = {
      height = 0.4,
    },
    color_devicons = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

M = {}

M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "< VimRC >",
    cwd = "$HOME/.config/nvim",
  })
end

M.git_branches = function()
  require("telescope.builtin").git_branches({
    attach_mappings = function(_, map)
      map('i', '<c-d>', actions.git_delete_branch)
      map('n', '<c-d>', actions.git_delete_branch)
      return true
    end
  })
end

local opt = {noremap = true, silent = true}

-- mappings
vim.api.nvim_set_keymap("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fo", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fg", [[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>km", [[<Cmd>lua require('telescope.builtin').keymaps()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>fG", [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>gc", [[<Cmd>lua require('nvim.plugins.telescope').git_branches()<CR>]], opt)
vim.api.nvim_set_keymap("n", "<Leader>vrc", [[<Cmd>lua require('nvim.plugins.telescope').search_dotfiles()<CR>]], opt)
-- Formattting, TODO: check the diffrence between this and lsp but fomatting function
-- vim.api.nvim_set_keymap("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)
-- vim.api.nvim_set_keymap("v", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)

-- highlights

local cmd = vim.cmd

cmd "hi TelescopeBorder   guifg=#2a2e36"
cmd "hi TelescopePromptBorder   guifg=#2a2e36"
cmd "hi TelescopeResultsBorder  guifg=#2a2e36"
cmd "hi TelescopePreviewBorder  guifg=#525865"

return M
