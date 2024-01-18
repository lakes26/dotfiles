local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local wk = require('which-key')

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
            },
        },
        -- TODO: figure out how to make this better
        -- doesn't show the directory structure at all
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
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
            follow = true,
            hidden = true,
        },

        live_grep = {
            follow = true,
            hidden = true,
        }
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

vim.keymap.set('n', '<leader>fd', builtin.find_files, {})     -- "find files"
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})      -- "find grep"
vim.keymap.set('n', '<leader>ft', builtin.git_files, {})      -- "find git"
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})        -- "find buffers"
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})      -- "find help"
vim.keymap.set('n', '<leader>fp', builtin.diagnostics, {})    -- "find problems"
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {}) -- "find references"

wk.register({
    f = {
        d = 'telescope.builtin.find_files',
        g = 'telescope.builtin.live_grep',
        t = 'telescope.builtin.git_files',
        b = 'telescope.builtin.buffers',
        h = 'telescope.builtin.help_tags',
        p = 'telescope.builtin.diagnostics',
        r = 'telescope.builtin.lsp_references',
    },
}, { prefix = '<leader>' })
