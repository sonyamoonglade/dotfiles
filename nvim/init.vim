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
set scrolloff=50
set number
set termguicolors
set encoding=UTF-8
set relativenumber
set background=dark
set mmp=500000
language en_US

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

Plug 'nvim-telescope/telescope.nvim'

" Cosmetics
Plug 'tribela/vim-transparent'

Plug 'mbbill/undotree'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }

"Autocomplete, utils...
Plug 'fedepujol/move.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'm4xshen/autoclose.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'tpope/vim-commentary'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }

"ai
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

"go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

highlight Normal guifg=none

colorscheme catppuccin

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Wa wa 
:command WA wa 
:command E NvimTreeToggle
nnoremap <A-f> :NvimTreeToggle<cr>

let mapleader = " "

" Move lines config
nnoremap <leader>j :MoveLine(1)<CR>
nnoremap <leader>k :MoveLine(-1)<CR>

" codeium 
nnoremap <leader>we :CodeiumEnable<cr>
nnoremap <leader>cd :CodeiumDisable<cr>

" vim-go
let g:go_highlight_extra_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_metalinter_command = 'golangci-lint'
nnoremap <leader>gfs :GoFillStruct<cr>
nnoremap <leader>gl :GoMetaLinter<cr>
nnoremap <leader>gv :GoVet<cr>
nnoremap <leader>cc :GoCallers<cr>
nnoremap <leader>rr :GoReferrers<cr>

noremap <leader>d :bdelete<cr>
nnoremap <leader>n :bn<cr>

vmap <leader>yy :!xclip -f -sel clip<cr>
set clipboard+=unnamedplus

let g:context_filetype_blacklist = [".jsx", ".tsx"]

let g:prettier#exec_cmd_path="/usr/local/bin/prettier"
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat_config_files = ["~/.prettierrc"]
nnoremap <leader>p :PrettierAsync<cr>

" hide folders from nerd tree
let g:netrw_list_hide= 'node_modules,./node_modules,.git,./.git'
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" remap to copy and then paste multiple times
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

"harpoon
nnoremap <leader>m :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>l :lua require("harpoon.ui").toggle_quick_menu()<cr>

nnoremap <space><space> :w<cr>

source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/nvimlsp.vim

lua << EOF
require("autoclose").setup({})
require("harpoon").setup({
   menu = {
      width = 100
   }
})
require("move").setup({})
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
     enable = false,
  },
  trash = {
    cmd = "gio trash",
  },
  update_focused_file = {
     enable = true,
  }
})
EOF
hi link markdownError NONE

