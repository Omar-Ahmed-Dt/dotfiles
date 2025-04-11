return {

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- Go LSP
    {
        "ray-x/go.nvim",
        dependencies = { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()' -- Install binaries
    },

    -- Autocompletion (nvim-cmp already in NVChad, just extend)
    {
        "hrsh7th/cmp-nvim-lsp",
        event = "InsertEnter"
    },

    {
        "nvimtools/none-ls.nvim", -- new fork of null-ls
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.null_ls")
        end,
    },

    -- markdown-preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_auto_start = 0
        end,
    },

    -- markdown preview live
    {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown", -- Load only for Markdown files
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Requires Tree-sitter
    config = function()
      require("render-markdown").setup({
        -- Optional configuration (defaults are fine for basic use)
        enabled = true, -- Enable rendering by default
        render_modes = { "n", "v" }, -- Render in normal and visual modes
      })
    end,
  },

}
