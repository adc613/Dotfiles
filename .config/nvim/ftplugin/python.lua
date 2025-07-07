vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

vim.keymap.set('n', '<LocalLeader>fv', ':edit ~/.config/nvim/config/settings/python.vim<CR>',
  { desc = "Modify python settings", buffer = true })
