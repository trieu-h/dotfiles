" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    """"Lua Plugins""""
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'nvim-neo-tree/neo-tree.nvim', {'branch': 'v2.x'}
    Plug 'MunifTanjim/nui.nvim'

    " Themes
    Plug 'trieu-h/fairyfloss.vim'

    " Status line
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
    Plug 'feline-nvim/feline.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Highlight color
    Plug 'norcalli/nvim-colorizer.lua'

    " Completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " Lsp related
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'sbdchd/neoformat'
    Plug 'onsails/lspkind-nvim'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'RRethy/vim-illuminate'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    " Autopair (, [, ...
    Plug 'windwp/nvim-autopairs'

    " Peek a line in advance
    Plug 'nacro90/numb.nvim'

    " Git stuff
    Plug 'sindrets/diffview.nvim'
    Plug 'lewis6991/gitsigns.nvim'

    """"VimL Plugins""""
    Plug 'tpope/vim-surround'

    " Git integration
    Plug 'stsewd/fzf-checkout.vim'

    " Extra spicy repeat
    Plug 'tpope/vim-repeat'

    " Vim DevIcons
    Plug 'ryanoasis/vim-devicons'

    " Indent object
    Plug 'michaeljsmith/vim-indent-object'

    "" Commenting
    Plug 'tpope/vim-commentary'

    " Rust
    Plug 'simrat39/rust-tools.nvim'
    Plug 'mfussenegger/nvim-dap'

    " Move lines
    Plug 'matze/vim-move'

    "" Show white space
    Plug 'ntpeters/vim-better-whitespace'

    "" Multi cursor
    Plug 'mg979/vim-visual-multi'

    " Quote as a text obj
    Plug 'kana/vim-textobj-user'
    Plug 'beloglazov/vim-textobj-quotes'

    " Easy split/join
    Plug 'AndrewRadev/splitjoin.vim'

    " Easy-align
    Plug 'junegunn/vim-easy-align'

    " Zoom on split
    Plug 'szw/vim-maximizer'

    " Other
    Plug 'jpalardy/vim-slime'

    "Better buffet deletion"
    Plug 'ojroques/nvim-bufdel'

    " Terminal
    Plug 'akinsho/toggleterm.nvim'

call plug#end()

let g:airline_theme='fairyfloss'
let g:airline#extensions#nvimlsp#enabled = 1
let airline#extensions#nvimlsp#error_symbol = 'E:'
let airline#extensions#nvimlsp#warning_symbol = 'W:'
