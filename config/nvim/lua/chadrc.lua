-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvbox",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = { load_on_startup = true }

-- the command :W that writes the current buffer using sudo.-
vim.api.nvim_create_user_command("W", "w !sudo tee % > /dev/null", { bang = true })

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "<C-p>", ":MarkdownPreview<CR>", { noremap = true, silent = true, buffer = true })
  end,
})


return M
