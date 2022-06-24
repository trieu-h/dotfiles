-- -- Disable highlight after searching
-- vim.api.nvim_set_keymap("n","<ESC><ESC>", ":nohl<CR>", { silent = true })

vim.api.nvim_set_keymap("n","<S-CR>", "O<Esc>", { silent = true })
vim.api.nvim_set_keymap("n","<CR>", "o<Esc>", { silent = true })

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-k>", ":resize -2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":resize +2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", ":vertical resize -2<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":vertical resize +2<CR>", { silent = true })

-- QuickFix
vim.api.nvim_set_keymap("", "<leader>q", ":call QuickFixToggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", { noremap = true, silent = true })

-- Maximizer plugin
vim.api.nvim_set_keymap("n", "<F3>", ":MaximizerToggle<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<F3>", ":MaximizerToggle<CR>gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<F3>", "<C-o>:MaximizerToggle<CR>", { noremap = true, silent = true })
