return {

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- Terraform syntax highlighting and formatting
    {
        "hashivim/vim-terraform",
        ft = { "terraform", "tf", "hcl" },
        config = function()
            vim.g.terraform_fmt_on_save = 1
            vim.g.terraform_align = 1
        end,
    },

    -- Terraform LSP
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                terraformls = {}, -- use default settings for terraform-ls
            },
        },
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
                enabled = true,
                render_modes = { "n", "v" },
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "lua", "json", "http", "bash", "terraform", "hcl" -- added terraform & hcl
            },
        },
    },

    {
        "rest-nvim/rest.nvim",
        ft = { "http" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("rest-nvim").setup({
                result_split_horizontal = false,
                skip_ssl_verification = false,
                highlight = {
                    enabled = true,
                    timeout = 150,
                },
                result = {
                    show_url = true,
                    show_curl_command = true,
                    show_http_info = true,
                    show_headers = true,
                },
            })
        end,
    },

    {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "emmet-ls",
        "json-lsp",
        "prettier",
        "eslint-lsp",

        -- shell
        "bash-language-server",
        "shfmt",
        "shellcheck",

        -- python
        "pyright",
        "black",

        -- terraform
        "terraform-ls",

        -- ansible
        "ansible-language-server",
        -- docker
        "dockerfile-language-server"
      },
    },
  },
}
