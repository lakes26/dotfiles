return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { "Trouble", "TroubleToggle"},
    keys = {
        { "<leader>d", desc = "Diagnostics (Trouble)" },
        { "<leader>dw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        { "<leader>dd", "<cmd>Trouble document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
        { "<leader>dl", "<cmd>Trouble loclist<cr>", desc = "Location List (Trouble)" },
        { "<leader>dq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
}
