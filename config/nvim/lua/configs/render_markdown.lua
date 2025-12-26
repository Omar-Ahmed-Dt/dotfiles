-- -- ~/.config/nvim/lua/configs/render_markdown.lua
local M = {}

M.setup = function()
  require("render-markdown").setup({

    enabled = true,
    render_modes = { "n", "v" },

    -- Headings
    heading = {
      enabled = true,
      icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
    },

    -- Bullets
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
    },

    -- Checkboxes
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 " },
      checked = { icon = "󰄵 " },
    },

    -- Blockquotes
    quote = {
      enabled = true,
      icon = "▍",
    },

    -- Code blocks
    code = {
      enabled = true,
      style = "language",
    },

    -- Links
    link = {
      enabled = true,
      icon = "󰌷 ",
    },
  })
end

return M

