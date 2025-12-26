require "nvchad.options"
local opt = vim.opt

-- Horizontal and vertical crosshair
opt.cursorline = true           -- Highlight the line
opt.cursorcolumn = true         -- Highlight the column
opt.cursorlineopt = 'number,line'
vim.cmd [[
  highlight CursorLine guibg=#2c2c2c
  highlight CursorColumn guibg=#2c2c2c
  "highlight CursorLine guibg=#5f5f5f
  "highlight CursorColumn guibg=#5f5f5f
]]

-- Optional: extra guide line for max width (like column 120)
opt.colorcolumn = "100"
opt.textwidth = 100
opt.wrap = true
opt.linebreak = true

-- Other good UX defaults
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- show the filename
opt.winbar = "%f" 
opt.clipboard = ""
