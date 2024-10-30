return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon"):setup({})
    end,
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon file" },
        { "<C-h>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon quick menu" },
        { "<C-g>", function() require("harpoon"):list():select(1) end, desc = "Harpoon to file 1" },
        { "<C-j>", function() require("harpoon"):list():select(2) end, desc = "Harpoon to file 2" },
        { "<C-k>", function() require("harpoon"):list():select(3) end, desc = "Harpoon to file 3" },
        { "<C-x>", function() require("harpoon"):list():select(4) end, desc = "Harpoon to file 4" },
    },
}
