vim.g.mapleader = " " -- <space> as leader

-- Explore with netrw
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Clear highlighting
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Move highlighted lines in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Remembers cursor position when joining lines with 'J'
vim.keymap.set("n", "J", "mzJ`z")

-- In visual select mode, pastes while preserving register.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yanking to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- quickfix and location list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
