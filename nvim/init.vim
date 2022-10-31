set exrc
set mouse=a
set tabstop=3 softtabstop=3
set shiftwidth=3
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
set scrolloff=8
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

Plug 'preservim/nerdtree'
Plug 'romgrk/barbar.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Cosmetics
Plug 'vim-airline/vim-airline'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'morhetz/gruvbox'

" JS/ts Stuff..
Plug 'prettier/vim-prettier', {
   \ 'do': 'yarn install --frozen-lockfile --production',
   \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'yaml', 'html'] }
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mattn/emmet-vim'
 

"Autocomplete, utils...
Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'kosayoda/nvim-lightbulb'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'fedepujol/move.nvim'
Plug 'mfussenegger/nvim-jdtls'

"go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"rust
Plug 'simrat39/rust-tools.nvim'
call plug#end()

highlight Normal guifg=none

let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

:command WQ wq
:command Wq wq
:command W w
:command Q q

let mapleader = " "

source ~/.config/nvim/plugins/nav.vim
source ~/.config/nvim/plugins/nvimlsp.vim

" Move lines config
nnoremap <A-j> :MoveLine(1)<CR>
nnoremap <A-k> :MoveLine(-1)<CR>

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

lua << EOF
require('telescope').load_extension("fzf")
EOF


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


" NERDTree
nnoremap <A-f> :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

nnoremap <leader>1 <cmd>BufferGoto 1<cr>
nnoremap <leader>2 <cmd>BufferGoto 2<cr>
nnoremap <leader>3 <cmd>BufferGoto 3<cr>
nnoremap <leader>4 <cmd>BufferGoto 4<cr>
nnoremap <leader>5 <cmd>BufferGoto 5<cr>
nnoremap <leader>6 <cmd>BufferGoto 6<cr>

" Prettier
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_files = ["/home/aalexandrovich/.prettierrc"]

" let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Auto import
if !executable('ctags')
    let g:gutentags_dont_load = 1
endif

" TS/TSX
let g:typescript_ignore_browserwords = 1

" filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F

lua << EOF
require'colorizer'.setup()
EOF

" clipboard
vmap <leader>yy :!xclip -f -sel clip<cr>

