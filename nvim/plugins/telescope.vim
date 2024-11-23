" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 3
let g:completion_matching_strategy_list = ["exact","substring","fuzzy"]

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

lua << EOF
telescope = require('telescope')
telescope.setup{ file_ignore_patterns = {"node_modules", "dist", "build", "go.mod", "go.sum", ".git"}, }
EOF


