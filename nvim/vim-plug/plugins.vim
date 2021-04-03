" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Theme related
    Plug 'joshdick/onedark.vim'
    Plug 'colepeters/spacemacs-theme.vim'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " Vim Surround
    Plug 'tpope/vim-surround'
    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'stsewd/fzf-checkout.vim'
    " Extra spicy repeat
    Plug 'tpope/vim-repeat'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Vim DevIcons
    Plug 'ryanoasis/vim-devicons'
    " Indent object
    Plug 'michaeljsmith/vim-indent-object'
    " Commenting
    Plug 'tpope/vim-commentary'
    " Official vim plugin for ReScript.
    Plug 'rescript-lang/vim-rescript'
    Plug 'matze/vim-move'
    " Show white space
    Plug 'ntpeters/vim-better-whitespace'
    " Multi cursor
    Plug 'mg979/vim-visual-multi'
    " Quote as a text obj
    Plug 'kana/vim-textobj-user'
    Plug 'beloglazov/vim-textobj-quotes'
    " Easy split/join
    Plug 'AndrewRadev/splitjoin.vim'
    "Highlight color
    Plug 'norcalli/nvim-colorizer.lua'
    " Lazygit integration
    Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
    " Easy-align
    Plug 'junegunn/vim-easy-align'
    " Remainder to replace this with built-in function later
    Plug 'machakann/vim-highlightedyank'
    " Fancy start screen
    Plug 'mhinz/vim-startify'

call plug#end()
