local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    go = { "gofmt", "goimports" }, -- 👈 These will autoformat Go
    lua = { "stylua" },
    -- add other languages here
  },

  format_on_save = function(bufnr)
    -- Enable autoformat on save for Go (and others)
    local filetype = vim.bo[bufnr].filetype
    return filetype == "go" or filetype == "lua"
  end,
})

