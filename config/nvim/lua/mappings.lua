require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

n = {
  -- ["<F5>"] = { function() require("dap").continue() end, "DAP Continue" },
  -- ["<F10>"] = { function() require("dap").step_over() end, "DAP Step Over" },
  -- ["<F11>"] = { function() require("dap").step_into() end, "DAP Step Into" },
  -- ["<F12>"] = { function() require("dap").step_out() end, "DAP Step Out" },
  -- ["<Leader>b"] = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
  -- ["<Leader>du"] = { function() require("dapui").toggle() end, "Toggle DAP UI" },
  -- ["<leader>mp"] = { "<cmd>Glow<CR>", "Markdown Preview with Glow" },
}

