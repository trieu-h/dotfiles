local cmd = vim.cmd
local g = vim.g

require("nvim-tree.events").on_nvim_tree_ready(function()
    vim.cmd("NvimTreeRefresh")
end)

g.nvim_tree_side = "left"
g.nvim_tree_width = 30
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_tab_open = 1
g.nvim_tree_allow_resize = 1

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
 default = '',
 symlink = '',
 git = {
   unstaged = "✗",
   staged = "✓",
   unmerged = "",
   renamed = "➜",
   untracked = "★",
   deleted = "",
   ignored = "◌"
   },
 folder = {
   arrow_open = "",
   arrow_closed = "",
   default = "",
   open = "",
   empty = "",
   empty_open = "",
   symlink = "",
   symlink_open = "",
   },
   lsp = {
     hint = "",
     info = "",
     warning = "",
     error = "",
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

