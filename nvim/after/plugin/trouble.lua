local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
vim.keymap.set("n", "gr", function() require("trouble").open("lsp_references") end, opts)
