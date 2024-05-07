return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        require('nvim-autopairs').setup({
            -- TODO: Setup autopairs
        })
    end
}
