-- Better nav for omnicomplete
vim.cmd 'inoremap <expr> <c-j> ("\\<C-n>")'
vim.cmd 'inoremap <expr> <c-k> ("\\<C-p>")'

-- Remap escape
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true, silent = true })

-- Tab switch buffer
vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- <TAB>: completion.
-- vim.cmd('inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"')

-- Better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- Insert newline by pressing enter
vim.api.nvim_set_keymap("n","<S-CR>", "O<Esc>", { silent = true })
vim.api.nvim_set_keymap("n","<CR>", "o<Esc>", { silent = true })

-- Disable highlight after searching
vim.api.nvim_set_keymap("n","<ESC><ESC>", ":nohl<CR>", { silent = true })

-- Resize with arrows
if vim.fn.has "mac" == 1 then
  vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })
else
  vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })
end

-- QuickFix
vim.api.nvim_set_keymap("", "<leader>q", ":call QuickFixToggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]q", ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[q", ":cprev<CR>", { noremap = true, silent = true })

-- Expand-region remap
vim.cmd 'map K <Plug>(expand_region_expand)'
vim.cmd 'map J <Plug>(expand_region_shrink)'
