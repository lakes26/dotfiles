return {
    'catppuccin/nvim', name ='catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            -- TODO: setup catppuccin
        })
        
        vim.cmd.colorscheme "catppuccin"
    end,
}
