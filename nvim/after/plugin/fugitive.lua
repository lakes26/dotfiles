local wk = require('which-key')

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

wk.register({
    g = {
        s = 'vim.cmd.Git',
    },
}, { prefix = '<leader>' })
