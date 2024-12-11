-- Adam Collins
-- adc613@gmail.com
-- Welcome to my .vimrc
require("config.lazy")

vim.cmd('set notimeout')
vim.opt.encoding='utf-8'

vim.cmd([[
" top level settings modules
source ~/.config/nvim/config/settings/general.vim

" file specific settings
autocmd FileType css source ~/.config/nvim/config/settings/css.vim
autocmd FileType html source ~/.config/nvim/config/settings/html.vim
autocmd FileType markdown source ~/.config/nvim/config/settings/markdown.vim
autocmd FileType python source ~/.config/nvim/config/settings/python.vim
autocmd FileType javascript source ~/.config/nvim/config/settings/javascript.vim
autocmd FileType elixir source ~/.config/nvim/config/settings/elixir.vim
autocmd FileType latex source ~/.config/nvim/config/settings/latex.vim

]])
