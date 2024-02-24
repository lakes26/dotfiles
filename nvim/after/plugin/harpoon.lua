local harpoon = require("harpoon")
local wk = require("which-key")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-s>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>nn", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>ee", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>ii", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>oo", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

wk.register({
    ["<leader>a"] = 'Append to harpoon list',
    ["<C-E>"] = 'Show harpoon list',

    ["<leader>nn"] = 'Goto 1st file in harpoon list',
    ["<leader>ee"] = 'Goto 2nd file in harpoon list',
    ["<leader>ii"] = 'Goto 3rd file in harpoon list',
    ["<leader>oo"] = 'Goto 4th file in harpoon list',

    ["<C-S-P>"] = 'Goto previous file in harpoon list',
    ["<C-S-N>"] = 'Goto next file in harpoon list',
})
