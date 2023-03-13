set exrc
set mouse=a
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nohlsearch
set hidden
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=16
set signcolumn=yes
set colorcolumn=100
set number
set termguicolors
set encoding=UTF-8
set relativenumber
set background=dark

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'romgrk/barbar.nvim'

Plug 'nvim-telescope/telescope.nvim'

" Cosmetics
Plug 'vim-airline/vim-airline'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'morhetz/gruvbox'

"Autocomplete, utils...
Plug 'neovim/nvim-lspconfig'
Plug 'm4xshen/autoclose.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'fedepujol/move.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'kevinoid/vim-jsonc'

"go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

highlight Normal guifg=none

let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

:command WQ wq
:command Wq wq
:command W w
:command Q q

let mapleader = " "

source ~/.config/nvim/plugins/nav.vim
source ~/.config/nvim/plugins/nvimlsp.vim

" Move lines config
nnoremap <leader>j :MoveLine(1)<CR>
nnoremap <leader>k :MoveLine(-1)<CR>

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>


let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

let g:completion_matching_strategy_list = ["exact","substring","fuzzy"]

" vim-go
let g:go_highlight_extra_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
nnoremap <leader>gfs :GoFillStruct<cr>

" Buffers (tabs) navigation
nnoremap <C-n> :BufferPrevious<CR>
nnoremap <C-m> :BufferNext<CR>
nnoremap <C-x> :BufferClose<CR>

vmap <leader>yy :!xclip -f -sel clip<cr>

" Tree
nnoremap <M-f> :Explore<CR>

lua << EOF
require("autoclose").setup({})
EOF
