require('nvim.keymappings')
require('nvim.themes')
require('nvim.plugins.colorizer')
require('nvim.plugins.statusline')
require('nvim.plugins.lsp')  -- Remember to install language servers via npm // TODO: Make a script to automate this process
require('nvim.plugins.treesitter')
require('nvim.plugins.telescope')
require('nvim.plugins.compe')
require('nvim.plugins.filetree')
require('nvim.plugins.diffview')
require('nvim.plugins.slime')
require('nvim-autopairs').setup()
require("lspkind").init()
require('numb').setup{
  show_numbers = true, -- Enable 'number' for the window while peeking
  show_cursorline = true -- Enable 'cursorline' for the window while peeking
}
