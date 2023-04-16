vim.cmd("nnoremap <C-p> :silent !groff -ms '%:p' -T pdf > '%:p:r'.pdf <CR>")
