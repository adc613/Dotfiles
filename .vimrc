set shiftwidth=4 
set softtabstop=4 
set number "show line numbers
set autoindent "automatically indents
set tabstop=4
set expandtab
set tw=79   "width of the document (used by GD)
set nowrap  " don't automatically wrap on load
set fo-=t   "don't automatically wrap text when typing
set colorcolumn=80
set ignorecase "ignore case in search
set smartcase  "becomes case sensitive once you use a case 
set hlsearch "highlights search
set incsearch "searches while typing

" Spell checking
setlocal spell spelllang=en_us

" turns on highlighted syntax not sure what the other shit does
filetype indent on
syntax on
autocmd! bufwritepost .vimrc source %

" Highlighting colors
hi Search ctermbg=Cyan ctermfg=white
hi Comment cterm=bold
hi ErrorMsg ctermbg=White ctermfg=Red
hi SpellBad ctermbg=White ctermfg=Red

" allows me to copy and past outside of terminal
set clipboard=unnamed

let mapleader = ","

" move between pane using control keys and H,J,K,L 
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h

" move between tabs wit , M or N ( left and right respectively)
map <C-n> <esc>:tabprevious<CR>
map <C-m> <esc>:tabnext<CR>

" allows me to alphabetically sort lines of code in visual mode
vnoremap <Leader>a :sort<CR>

" allows me edit the tabs in blocks of code 
vnoremap < <gv 
vnoremap > >gv

" easier formatting of paragraphs remaps when you go above 80 characters
vmap Q gq
nmap Q gqap

"Executes a package that allows easy installation VIM plugins easily
" execute pathogen#infect()

" Short to open NERDTree
" map <C-f>  :NERDTree<cr>

nnoremap <CR> :noh

"Syntastic recommended settings 
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_python_exec = '/usr/local/bin/python3'

" let g:syntastic_html_tidy_exec = 'tidy5'
" Flake8 (PEP8) syntax linter
" autocmd FileType python map <buffer> <C-c> :call Flake8()<CR>

" Change indentation for html
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" close tag for html
" autocmd FileType html let b:closetag_html_style=1
" autocmd FileType html source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

