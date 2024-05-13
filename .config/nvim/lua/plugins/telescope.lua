return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.6',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function(_, opts)
        local actions = require("telescope.actions")
        return {
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-n>"] = function(...) return actions.cycle_history_next(...) end,
                        ["<C-p>"] = function(...) return actions.cycle_history_prev(...) end,
                    },
                },
                path_display = { "truncate" },
                layout_config = {
                    horizontal = {
                        width = 0.9,
                        preview_cutoff = 60,
                    },
                },
                file_ignore_patterns = {
                    ".git/",
                }
            },
            pickers = {
                find_files = {
                    follow = true,
                    hidden = true,
                },
                live_grep = {
                    follow = true,
                    hidden = true,
                }
            },
        }
    end,
    keys = {
        { "<leader>s",  desc = "Search (Telescope)" },
        { "<leader>sc", function() require('telescope.builtin').find_files({}) end,                                     desc = "Search for files in current directory" },
        { "<leader>sb", function() require('telescope.builtin').buffers({}) end,                                        desc = "Search for files in opened buffers" },
        { "<leader>sg", function() require('telescope.builtin').live_grep({}) end,                                      desc = "Search for string in files" },
        { "<leader>sG", function() require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') }) end, desc = "Search for current word in files" },
        { "<leader>sh", function() require('telescope.builtin').help_tags({}) end,                                      desc = "Search help" },
        { "<leader>sd", function() require('telescope.builtin').diagnostics({}) end,                                    desc = "Search diagnostics" },
        { "<leader>sr", function() require('telescope.builtin').lsp_references({}) end,                                 desc = "Search LSP references" },
        { "<leader>st", function() require('telescope.builtin').git_files({}) end,                                      desc = "Search git repository" },
    },
}
