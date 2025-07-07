-- Adam Collins
-- adc613@gmail.com
-- Welcome to my .vimrc

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("user.core")
require("config.lazy")

vim.cmd('set notimeout')
vim.opt.encoding = 'utf-8'

require("user.keymap_core")
