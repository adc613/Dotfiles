set shiftwidth=4 
set softtabstop=4 
set relativenumber " enables relative number
set number " shows the number of the current line
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
autocmd FileType html setlocal spell spelllang=en_us

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

" Removes highlighting around searched words
nnoremap <CR> :noh
