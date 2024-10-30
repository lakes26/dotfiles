return {
  "mhinz/vim-signify",
  event = { "BufRead", "BufNewFile" },
  cmd = { "SignifyToggle", "SignifyEnable", "SignifyEnableAll" },
}
