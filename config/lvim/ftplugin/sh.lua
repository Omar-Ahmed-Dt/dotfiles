vim.cmd("nnoremap <C-p> :w <bar> !./%<CR>")
vim.cmd("nnoremap <C-i> :w <bar>terminal ./%<CR>")
vim.cmd("nnoremap <C-;> :w <bar> TermExec cmd='./%'<CR>")
