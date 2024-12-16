-- Adam Collins
-- adc613@gmail.com
-- Welcome to my .vimrc

require("user.core")
require("config.lazy")

vim.cmd('set notimeout')
vim.opt.encoding='utf-8'


vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "python" then
      require("languages.python")
    elseif ft == "python" then
      require("languages.markdown")
    end
  end
})

require("user.keymap_core")
