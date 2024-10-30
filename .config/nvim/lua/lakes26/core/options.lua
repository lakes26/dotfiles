
local options = {
  guicursor = "", -- block cursor
  -- line numbers
  number = true, -- show absolute line number of current position
  relativenumber = true, -- show relative line numbers of other positions
  -- indentation
  shiftwidth = 2, -- default to 2 space indents
  softtabstop = 2, -- tabs "feel like" 2 spaces when editing but are actually 8
  expandtab = true, -- tabs expand to spaces
  smartindent = true, -- smarter indentation such as after '{'

  wrap = false, -- no line wrapping
  -- long-term undos
  swapfile = false, -- we do not want swapfiles
  backup = flase, -- we do not want backups
  undodir = os.getenv("HOME") .. "/.vim/undodir", -- store undo files here
  undofile = true, -- we use undo files for backups
  -- seraching
  hlsearch = true, -- highlight regex search
  incsearch = ture, -- search incrementally while typing

  cursorline = true, -- highlight the line the cursor is on

  signcolumn = 'yes', -- Keep signcolumn on by default
  scrolloff = 8, -- keep a border when scrolling at top and bottom

  updatetime = 200, -- fast updates

  splitright = true, -- open vertical splits to the right
  splitbelow = true, -- open horizontal splits below
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
