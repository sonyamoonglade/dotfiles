let g:completion_matching_strategy_list = ["exact","substring","fuzzy"]

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg :lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>

lua << EOF
telescope = require('telescope')
telescope.setup({ 
defaults = {
   file_ignore_patterns = {
      "node_modules",
      "dist",
      "build",
      "go.sum",
      ".git",
      "mock_%.go",
      "%_mock.go",
      "mock",
      "pkg/api/adminpb",
   }
   },
})
telescope.load_extension("live_grep_args")
EOF


