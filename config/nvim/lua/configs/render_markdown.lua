require("render-markdown").setup({
  heading = {
    enabled = true,
    icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " }, -- Level 1 to 6
    highlight = {
      "MarkdownH1",
      "MarkdownH2",
      "MarkdownH3",
      "MarkdownH4",
      "MarkdownH5",
      "MarkdownH6",
    }, -- Optional: custom highlight groups per level
  },
  checkbox = {
    enabled = true,
    unchecked = { icon = "󰄱 ", hl = "Comment" },
    checked = { icon = "󰱒 ", hl = "String" },
  },
  bullet = {
    enabled = true,
    icons = { "•", "◦", "▪", "▫" },
    hl = "Function", -- single highlight group for all bullets
  },
  codeblock = {
    enabled = true,
    icon = "󰘚 ", -- shows before fenced code blocks (```), or leave nil
    hl = "Comment",
  },
  quote = {
    enabled = true,
    icon = "┃", -- replaces `>` in blockquotes
    hl = "SpecialComment",
  },
  emphasis = {
    enabled = true,
    italic = true,
    bold = true,
    strikethrough = true,
    hl = {
      italic = "Italic",
      bold = "Bold",
      strikethrough = "Comment",
    },
  },
})

