return {
  'akinsho/toggleterm.nvim',
  version = "*",

  config = function ()
    require("toggleterm").setup({
      open_mapping = [[<C-t>]],
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 0,
      },
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end
      },
    })
  end
}

