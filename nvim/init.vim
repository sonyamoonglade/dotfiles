set exrc
set mouse=a
set tabstop=3 softtabstop=3
set shiftwidth=3
set expandtab
set nohlsearch
set hidden
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=20
set number
" set termguicolors
set encoding=UTF-8
set relativenumber
set background=dark

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'romgrk/barbar.nvim'

Plug 'nvim-telescope/telescope.nvim'

" Cosmetics
Plug 'tribela/vim-transparent'
Plug 'vim-airline/vim-airline'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }

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
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }


"go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

highlight Normal guifg=none

let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark = 'dark'
colorscheme gruvbox

" colorscheme catppuccin-mocha


:command WQ wq
:command Wq wq
:command W w
:command Q q

let mapleader = " "

source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/nvimlsp.vim

" Move lines config
nnoremap <leader>j :MoveLine(1)<CR>
nnoremap <leader>k :MoveLine(-1)<CR>

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

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

" autocmd BufWritePre *.js PrettierAsync
" let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat_config_files = ["~/.prettierrc"]
let g:prettie#exec_cmd_path="/home/aalexandrovich/.nvm/versions/node/v20.5.0/bin/prettier"
nnoremap <leader>p :PrettierAsync<cr>

lua << EOF
require("autoclose").setup({})
EOF



