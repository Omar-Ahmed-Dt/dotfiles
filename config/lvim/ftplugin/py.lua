-- create a file at $LUNARVIM_CONFIG_DIR/after/ftplugin/c.lua
vim.cmd("nnoremap <C-p> :w <bar> !python3 %<CR>")
vim.cmd("nnoremap <C-i> :w <bar>terminal python3 %<CR>")
vim.cmd("nnoremap <C-;> :w <bar> TermExec cmd='python3 %'<CR>")
