-- Adam Collins
-- adc613@gmail.com
-- Welcome to my .vimrc

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

print("super sanity check!")
require("user.core")
require("config.lazy")

vim.cmd('set notimeout')
vim.opt.encoding = 'utf-8'


-- Auto load language specific files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local _status, _error = pcall(require, "languages." .. ft)
  end
})

require("user.keymap_core")
