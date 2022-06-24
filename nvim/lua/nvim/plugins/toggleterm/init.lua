require("toggleterm").setup({
  open_mapping = [[<c-`>]],
  hide_numbers = true,
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true ,
    direction = 'float',
    float_opts = {
      border = 'curved',
      width = 150,
      height = 90
    }
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-`<C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-`<C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-`<C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-`<C-n><C-W>l]], opts)
end

function toggle_lazygit()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lz", "<cmd>lua toggle_lazygit()<CR>", {noremap = true, silent = true})

