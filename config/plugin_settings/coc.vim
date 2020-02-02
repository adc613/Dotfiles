" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" navigate diagnostics
nnoremap <Leader>kp <Plug>(coc-diagnostic-prev)
nnoremap <Leader>kn <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nnoremap <Leader>kd <Plug>(coc-definition)
nnoremap <Leader>ky <Plug>(coc-type-definition)
nnoremap <Leader>ki <Plug>(coc-implementation)
nnoremap <Leader>kr <Plug>(coc-references)
" Fix autofix problem of current line
nmap <leader>kf  <Plug>(coc-fix-current)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Using CocList
" Show all diagnostics
nnoremap <leader>kla  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <leader>kle  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <leader>klc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <leader>klo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <leader>kls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <leader>klj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <leader>klk  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <leader>klp  :<C-u>CocListResume<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

