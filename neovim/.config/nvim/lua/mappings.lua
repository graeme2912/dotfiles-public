require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<c-P>",
  "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<leader>dd", function() require("trouble").toggle() end)
map("n", "<leader>dw", function() require("trouble").toggle("workspace_diagnostics") end)
map("n", "<leader>dx", function() require("trouble").toggle("document_diagnostics") end)
map("n", "<leader>dq", function() require("trouble").toggle("quickfix") end)
map("n", "<leader>dl", function() require("trouble").toggle("loclist") end)
map("n", "gR", function() require("trouble").toggle("lsp_references") end)

map("n", "<M-p>", function() require("fzf-lua").live_grep() end)
