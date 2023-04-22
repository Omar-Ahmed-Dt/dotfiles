-- create a file at $LUNARVIM_CONFIG_DIR/after/ftplugin/py.lua
-- vim.cmd(":setlocal autochdir")
vim.cmd("nnoremap <C-p> :w <bar> !python3 %<CR>")
vim.cmd("nnoremap <C-'> :w <bar>terminal python3 %<CR>")
vim.cmd("nnoremap <C-;> :w <bar> TermExec cmd='python3 %'<CR>")
-- 
-- Run selection lines 
vim.cmd("nnoremap <C-.> :w <bar> :ToggleTermSendCurrentLine<CR>")
vim.cmd("vnoremap <C-.> :'<,'>ToggleTermSendVisualLines<CR>")

-- open ipython in terminal 
vim.cmd("nnoremap <C-i> :TermExec cmd='ipython'<CR>")
