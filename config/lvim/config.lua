--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
-- vim.opt.relativenumber = true

-- colorscheme
--
-- lvim.colorscheme = "darkplus"
-- lvim.colorscheme = "gruvbox"
lvim.colorscheme = "tomorrow"
-- lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "system76"
-- lvim.colorscheme = "tomorrow"
--lvim.colorscheme = "habamax"
-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "github"
-- lvim.colorscheme = "aurora"
--
-- Statusline
-- lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.style = "lvim"
-- lvim.builtin.lualine.style = "none"
--
-- reload
reload "usr.colorizer.lua"
--
lvim.transparent_window = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.normal_mode["<S-j>"] = ":HopWord<cr>"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

vim.opt.backspace = vim.opt.backspace + { "nostop" } -- Don't stop backspace at insert
vim.opt.clipboard = "unnamedplus"                    -- Connection to the system clipboard
vim.opt.cmdheight = 0                                -- hide command line unless needed
vim.opt.completeopt = { "menuone", "noselect" }      -- Options for insert mode completion
vim.opt.copyindent = true                            -- Copy the previous indentation on autoindenting
vim.opt.cursorline = true                            -- Highlight the text line of the cursor
vim.opt.cursorcolumn = true                          -- Highlight the current column
vim.opt.expandtab = true                             -- Enable the use of space in tab
vim.opt.fileencoding = "utf-8"                       -- File content encoding for the buffer
vim.opt.fillchars = { eob = " " }                    -- Disable `~` on nonexistent lines
vim.opt.history = 100                                -- Number of commands to remember in a history table
vim.opt.ignorecase = true                            -- Case insensitive searching
vim.opt.laststatus = 3                               -- globalstatus
vim.opt.lazyredraw = true                            -- lazily redraw screen
vim.opt.mouse = "a"                                  -- Enable mouse support
vim.opt.number = true                                -- Show numberline
vim.opt.preserveindent = true                        -- Preserve indent structure as much as possible
vim.opt.pumheight = 10                               -- Height of the pop up menu
vim.opt.relativenumber = true                        -- Show relative numberline
vim.opt.scrolloff = 8                                -- Number of lines to keep above and below the cursor
vim.opt.shiftwidth = 4                               -- Number of space inserted for indentation
vim.opt.showmode = false                             -- Disable showing modes in command line
vim.opt.showtabline = 2                              -- always display tabline
vim.opt.sidescrolloff = 8                            -- Number of columns to keep at the sides of the cursor
vim.opt.signcolumn = "yes"                           -- Always show the sign column
vim.opt.smartcase = true                             -- Case sensitivie searching
vim.opt.splitbelow = true                            -- Splitting a new window below the current one
vim.opt.splitright = true                            -- Splitting a new window at the right of the current one
vim.opt.swapfile = false                             -- Disable use of swapfile for the buffer
vim.opt.tabstop = 4                                  -- Number of space in a tab
vim.opt.termguicolors = true                         -- Enable 24-bit RGB color in the TUI
vim.opt.timeoutlen = 300                             -- Length of time to wait for a mapped sequence
vim.opt.undofile = true                              -- Enable persistent undo
vim.opt.updatetime = 300                             -- Length of time to wait before triggering the plugin
vim.opt.wrap = true                                  -- Disable wrapping of lines longer than the width of window
vim.opt.writebackup = false                          -- Disable making a backup before overwriting a file
vim.opt.foldmethod = "manual"                        -- folding set to "expr" for treesitter based folding
vim.opt.cmdheight = 2                                -- more space in the neovim command line for displaying messages
vim.opt.cmdheight = 2                                -- more space in the neovim command line for displaying messages
vim.opt.breakindent = true
vim.opt.textwidth = 150
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hlsearch = true


-- colorcolumn
vim.api.nvim_set_option_value("colorcolumn", "100", {})

-- global
-- vim.go.acd = true -- open terminal in the same path

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode[">b"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<b"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<leader>c"] = ":bdelete<CR>"
lvim.keys.normal_mode["<leader>C"] = ":BufferLinePickClose<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true -- (default: false)
lvim.builtin.terminal.active = true

lvim.plugins = {
    {
        "metakirby5/codi.vim",
        cmd = "Codi",
    },

    { "lunarvim/colorschemes" },
    { "folke/tokyonight.nvim" },
    { "lunarvim/darkplus.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "lunarvim/github.nvim" },
    { "Mofiqul/dracula.nvim" },
    { "barrett-ruth/live-server.nvim" },
    {
        "turbio/bracey.vim",
        cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
        build = "npm install --prefix server",
    },

    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end,
    },
    --
    --
    -- ranger file manager
    -- {
    --     "kevinhwang91/rnvimr",
    --     cmd = "RnvimrToggle",
    --     config = function()
    --         vim.g.rnvimr_draw_border = 1
    --         vim.g.rnvimr_pick_enable = 1
    --         vim.g.rnvimr_bw_enable = 1
    --     end,
    -- },
    ----
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },


    -- For markdown-preview
    --
    --

    {
        "iamcco/markdown-preview.nvim",
        -- run = "cd app && npm install",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },

    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,             -- Function to run after the scrolling animation ends
            })
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },

}

-- Run ColorizerToggle for hexa
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = { "*" },
--     command = "ColorizerToggle",
--     command = "source ~/.config/lvim/ftplugin/colorizer.lua",
-- })

-- Hexa color
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*" },
    command = "ColorizerToggle",
})

-- Python files
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = { "*.py" },
--     command = "source ~/.config/lvim/ftplugin/py.lua",
-- })

-- Run Bash File
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.sh" },
    command = "source ~/.config/lvim/ftplugin/sh.lua",
})
--
-- Run markdown File
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.md" },
    command = "source ~/.config/lvim/ftplugin/md.lua",
})

-- Run groff to generate pdf file
-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = { "*.ms" },
--     command = "source ~/.config/lvim/ftplugin/ms.lua",
-- })
