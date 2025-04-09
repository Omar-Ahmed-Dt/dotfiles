return {
    -- {
    --     "stevearc/conform.nvim",
    --     -- event = 'BufWritePre', -- uncomment for format on save
    --     opts = require "configs.conform",
    -- },

    -- These are some examples, uncomment them if you want to see them work!
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

      {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_auto_start = 0
        end,
    },


}
