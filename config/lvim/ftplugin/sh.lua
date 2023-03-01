vim.cmd("nnoremap <C-p> :w <bar> !sh %<CR>")
vim.cmd("nnoremap <C-i> :w <bar>terminal sh %<CR>")
vim.cmd("nnoremap <C-;> :w <bar> TermExec cmd='sh %'<CR>")

vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
--vim.opt.cmdheight = 1
