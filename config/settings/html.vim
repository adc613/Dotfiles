" Change indentation for html
setlocal shiftwidth=2 tabstop=2 softtabstop=2
setlocal tw=0

" Spell checking in html files
setlocal spell spelllang=en_us
nnoremap <buffer> <LocalLeader>fv :edit ~/.config/nvim/config/settings/html.vim<CR>
