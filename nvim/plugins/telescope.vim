" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 3
let g:completion_matching_strategy_list = ["exact","substring","fuzzy"]

lua << EOF
telescope = require('telescope')
telescope.setup{ file_ignore_patterns = {"node_modules", "dist"}, }
EOF


