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
set colorcolumn=80
set number
set termguicolors
set encoding=UTF-8
set completeopt=menuone,noinsert,noselect
set relativenumber
set background=dark

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" JS/ts Stuff..
Plug 'prettier/vim-prettier', {
   \ 'do': 'yarn install --frozen-lockfile --production',
   \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'yaml', 'html'] }
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
 
Plug 'norcalli/nvim-colorizer.lua'

Plug 'jiangmiao/auto-pairs'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mfussenegger/nvim-jdtls'
Plug 'kosayoda/nvim-lightbulb'
Plug 'fedepujol/move.nvim'
call plug#end()

colorscheme gruvbox
highlight Normal guifg=none
let g:airline_theme='gruvbox'
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
:command WQ wq
:command Wq wq
:command W w
:command Q q

let mapleader = " "

" COMPLETION CONFIG
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
   expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    }),

    formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
      },
    },
  },
})

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

EOF



" END COMPLETION CONFIG

" Move lines config
nnoremap <A-j> :MoveLine(1)<CR>
nnoremap <A-k> :MoveLine(-1)<CR>

source ~/.config/nvim/plugins/nav.vim
source ~/.config/nvim/plugins/nvimlsp.vim

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

