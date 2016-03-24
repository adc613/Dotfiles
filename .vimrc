set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'Lokaltog/vim-powerline'
Plugin 'SirVer/ultisnips'
Plugin 'Townk/vim-autoclose'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'docunext/closetag.vim'
Plugin 'honza/vim-snippets'
Plugin 'nvie/vim-flake8'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set softtabstop=4 
set relativenumber " enables relative number
set number  " shows the number of current line 
set autoindent "automatically indents
set tabstop=4
set expandtab
set tw=79   "width of the document (used by GD)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=1000 " makes it way longer than it needs to be so that colorscheme takes up whole screen
autocmd FileType python set colorcolumn=80
set ignorecase "ignore case in search
set smartcase  "becomes case sensitive once you use a case 
set hlsearch "highlights search
set incsearch "searches while typing


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
set clipboard=unnamedplus

" use the mouse with a 
set mouse=a

let mapleader = ","

" move between pane using control keys and H,J,K,L 
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h

" move between tabs wit , M or N ( left and right respectively)
map <C-n> <esc>:tabprevious<CR>
map <C-m> <esc>:tabnext<CR>

" Alphabetically sort lines of code in visual mode
vnoremap <Leader>a :sort<CR>

" allows me edit the tabs in blocks of code 
vnoremap < <gv 
vnoremap > >gv

" easier formatting of paragraphs remaps when you go above 80 characters
vmap Q gq
nmap Q gqap

" Toggle NERDTree 
map <C-c>  :NERDTreeToggle<cr>

" remove search highlted words
nnoremap <CR> :noh

"Syntastic recommended settings 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_html_tidy_exec = 'tidy5'

" syntastic highlighting 
highlight SyntasticErrorSign guibg=#000000 guifg=#ffffff
highlight SyntasticWarningSign guibg=#000000 guifg=#ffffff
highlight SyntasticErrorLine guibg=#000000 guifg=#ffffff
highlight SyntasticWarningLine guibg=#000000 guifg=#ffffff
highlight SyntasticError guibg=#000000 guifg=#ffffff
highlight SyntasticWarning guibg=#000000 guifg=#ffffff

" Flake8- python syntax linter
autocmd VimEnter *.py call Flake8()
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_quickfix=0 " should remove quickfix menu but doesn't work
let g:flake8_show_in_gutter=1 " shows warning signs next to the number line

" Sets error markersfor all the differnt error types
let g:flake8_error_marker="EE" 
let g:flake8_warning_marker=">>"
let g:flake8_pyflake_marker=">>"
let g:flake8_complexity_marker=">>"
let g:flake8_naming_marker=">>"

" vim-flake8 plugin highlighting
highlight flake8_hi guibg=#000000 guifg=#ffffff
highlight link Flake8_Error         flake8
highlight link Flake8_Warning       flake8
highlight link Flake8_Complexity    flake8
highlight link Flake8_Naming        flake8
highlight link Flake8_PyFlake       flake8

" Change indentation for html
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" close tag for html plugin
autocmd FileType html let b:closetag_html_style=1

" Spell checking in html files
autocmd FileType html setlocal spell spelllang=en_us

" disables tab completion for you complete me
let g:ycm_key_list_select_completion=['<C-j>']
let g:ycm_key_list_previous_completion=['<C-k>']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" UltiSnips searches .vim/UltiSnips directory
let g:UltiSnipsSnippetDirectories=["/Users/AdamC/.vim/UltiSnips"]

" Powerline fonts
if has("gui_running")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
                set guifont=Inconsolata\ for\ Powerline
        endif
endif

" Powerline
let g:Powerline_symbols = 'unicode'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" Color scheme in ~/.vim/colors/
colorscheme mustang
