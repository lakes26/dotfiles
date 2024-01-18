require("config.remap")
require("config.set")
require("config.lazy")

local wk = require("which-key")

wk.register({
    ["<leader>pv"] = "File explorer",
    ["<leader>y"] = "Copy to system clipboard",
    ["<leader>Y"] = "Copy line to system clipboard",
    ["<leader>d"] = "Delete to void register",
    ["<C-f>"] = "Tmux sessionizer",
    ["<leader>fo"] = "Format the current buffer using LSP",
    ["<leader>s"] = "Subsitute the current word in buffer",
    ["<leader>mx"] = "Make current file executable",
})
