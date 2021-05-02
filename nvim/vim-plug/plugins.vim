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
    Plug 'kyazdani42/nvim-tree.lua'

    " Highlight other use of words under cursor
    Plug 'RRethy/vim-illuminate'

    " Theme
    Plug 'tiagovla/tokyodark.nvim'

    " Status line
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    " Highlight color
    Plug 'norcalli/nvim-colorizer.lua'

    " Lsp related
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-media-files.nvim'

    """"VimL Plugins""""

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Theme related
    Plug 'colepeters/spacemacs-theme.vim'
    Plug 'matsuuu/pinkmare'
    Plug 'junegunn/seoul256.vim'
    Plug 'tpope/vim-surround'
    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'stsewd/fzf-checkout.vim'
    " Extra spicy repeat
    Plug 'tpope/vim-repeat'
    " Vim DevIcons
    Plug 'ryanoasis/vim-devicons'
    " Indent object
    Plug 'michaeljsmith/vim-indent-object'
    "" Commenting
    Plug 'tpope/vim-commentary'
    "" Official vim plugin for ReScript.
    " Plug 'rescript-lang/vim-rescript'
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
    " Remainder to replace this with built-in function later
    Plug 'machakann/vim-highlightedyank'
call plug#end()
