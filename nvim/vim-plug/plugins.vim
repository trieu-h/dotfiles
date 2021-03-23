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
    " One Dark Theme
    Plug 'joshdick/onedark.vim'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " Vim Surround
    Plug 'tpope/vim-surround'
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
    " Fern
    Plug 'lambdalisue/fern.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'lambdalisue/fern-renderer-devicons.vim'

call plug#end()
