return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "smartpde/tree-sitter-cpp-google",
      config = function ()
        require("tree-sitter-cpp-google").setup()
      end,
    },
  },

  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
        "gitignore",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
