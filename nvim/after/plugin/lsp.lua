local lsp_zero = require('lsp-zero')
local wk = require('which-key')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    lsp_zero.default_keymaps({
        buffer = bufnr,
        exclude = { '<F2>', '<F3>', '<F4>' },
    })

    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

    wk.register({
        ['K'] = 'Hover',
        ['[d'] = 'Previous diagnostic',
        [']d'] = 'Next diagnostic',
        ['g'] = {
            r = 'Show references in telescope',
            d = 'Go to definition',
            D = 'Go to declaration',
            i = 'Go to implementation',
            o = 'Go to type definition',
            s = 'Signature help',
            l = 'Show diagnostic in floating window',
        },
        ['<leader>vca'] = 'Code actions',
        ['<leader>vr'] = {
            name = 'LSP',
            r = {
                name = 'References',
                r = 'Show references in quickfix',
                n = 'Rename symbol',
            },
        },
    })
end)

lsp_zero.nvim_workspace() -- Fix Undefined global 'vim'

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver' },
    handlers = {
        lsp_zero.default_setup,
        tsserver = function()
            require('lspconfig').tsserver.setup({
                single_file_support = false,
                on_attach = function(client, bufnr)
                    -- TODO configure tsserver
                    print('tsserver attached')
                end
            })
        end
    },
})

