local opts = { silent = true, noremap = true }
local wk = require('which-key')

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
vim.keymap.set("n", "gr", function() require("trouble").open("lsp_references") end, opts)

wk.register({
    ["<leader>xq"] = "TroubleToggle quickfix",
    ["gr"] = "Trouble open lsp_references",
})
