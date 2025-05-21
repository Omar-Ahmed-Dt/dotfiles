-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	-- theme = "gruvbox",
    theme = "seoul256_dark",
    transparency = true,

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
        -- CursorLine={
        --     bg = "white",
        -- },
	},
}

-- statusline
M.ui = {
    -- top bar(tabufline)
    tabufline = {
        order = { "treeOffset", "buffers", "tabs" },  -- removed "btns" 
   },

    statusline = {
      theme = "default",  -- can be: "default", "vscode", "vscode_colored", "minimal"
    
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "arrow", -- only affects default/minimal themes
      order = nil,
      modules = nil,
    },
    nvimtree = {
        enabled = false,
    }
} 

-- Dashboard
M.nvdash = {
    load_on_startup = true,
    header = {
    "██╗  ██╗███████╗██████╗  █████╗ ",
    "██║  ██║██╔════╝██╔══██╗██╔══██╗",
    "███████║█████╗  ██████╔╝███████║",
    "██╔══██║██╔══╝  ██╔══██╗██╔══██║",
    "██║  ██║███████╗██║  ██║██║  ██║",
    "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝",
    "                               ",
  },

}

-- Terminal
-- M.term = {
--     winopts = { number = false, relativenumber = false },
--     sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
--     float = {
--       relative = "editor",
--       row = 0.3,
--       col = 0.25,
--       width = 0.5,
--       height = 0.4,
--       border = "single",
--     },
-- }

-- the command :W that writes the current buffer using sudo.-
vim.api.nvim_create_user_command("W", function()
  vim.cmd('silent! write !sudo tee % > /dev/null')
  vim.cmd('edit!')
end, {})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "<C-p>", ":MarkdownPreview<CR>", { noremap = true, silent = true, buffer = true })
  end,
})


return M
