-- These are in the after directory to have unified lsp keymaps across work and personal machines
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "[G]o to [D]efinition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to [D]eclaration" })
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "[G]o to [I]mplementation" })
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "[G]o to [R]eferences" })
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definition<CR>", { desc = "[G]o to [T]ype definition" })
vim.keymap.set("n", "gk", vim.lsp.buf.hover, { desc = "Hover" })

vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame" })

vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })

