return {
  'echasnovski/mini.ai',
  version = '*',
  config = function ()
    require("mini.ai").setup({
      n_lines = 500,
    })
  end
}
