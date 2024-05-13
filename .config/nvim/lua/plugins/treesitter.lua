return {
    --Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = "TSUpdate",
        lazy = true,
        opts = {
            ensure_installed = {
                "markdown",
                "markdown_inline",
            },
            sync_install = false,
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        },
        main = "nvim-treesitter.configs"
    },

    -- Treesitter Playground
    {
        "nvim-treesitter/playground"
    },
}
