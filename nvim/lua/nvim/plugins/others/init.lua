-- Start interactive EasyAlign in visual mode (e.g. vipga)
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {})

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {})

-- Better Whitespace Plugin
vim.g.better_whitespace_enabled = 1

-- Nvim-metals require this settings
vim.opt_global.shortmess:remove("F")
