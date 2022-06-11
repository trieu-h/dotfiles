local cmd = vim.cmd
local g = vim.g

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    cmd  = nil,
    args = {}
  },

  view = {
    width = 30,
    height = 10,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

-- Mappings for nvimtree
local opts = {
    noremap = true,
    silent = true
}

vim.api.nvim_set_keymap(
    "n",
    "<leader>e",
    ":NvimTreeToggle<CR>",
    opts
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>re",
    ":NvimTreeFocus<CR>",
    opts
)

