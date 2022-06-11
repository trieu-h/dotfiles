require("toggleterm").setup()

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

function toggle_lazygit()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lz", "<cmd>lua toggle_lazygit()<CR>", {noremap = true, silent = true})
