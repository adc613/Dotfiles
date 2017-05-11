" Adam Collins
" adc613@gmail.com
" Welcome to my beautiful and continuously evolving .vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let path="~/.config/nvim/bundle"
call plug#begin(path)

Plug 'bling/vim-airline'                  " Status bar
Plug 'mkitt/tabline.vim'
Plug 'Townk/vim-autoclose'                " Automatically closes parenthesis and quores
Plug 'VundleVim/Vundle.vim'               " Plugin manager
Plug 'docunext/closetag.vim'              " Closes html tags when I type </
Plug 'nvie/vim-flake8'                    " Python lynter
"Plug 'rstacruz/sparkup'                   " Cool plugin never learned how to use it though
Plug 'scrooloose/nerdtree'                " File explorer
Plug 'scrooloose/nerdcommenter'           " Easy commenting and uncommenting
Plug 'tpope/vim-fugitive'                 " Git integration
Plug 'tpope/vim-surround'                 " Allows easy surrounding of words and text in quotes and such
Plug 'godlygeek/tabular'                  " Don't know what this is or how it got here
"Plug 'plasticboy/vim-markdown'            " Markdown plugin, not sure if it does anything
Plug 'suan/vim-instant-markdown'          " Allows me to view my markdwon edits in chrome as it happens
Plug 'tpope/vim-obsession'                " Maintains vim sessions through a system reboot
Plug 'simeji/winresizer'                  " Easy window resizing
Plug 'jelera/vim-javascript-syntax'       " JavaScript syntax highlighting
Plug 'pangloss/vim-javascript'            " Javascript indenting
Plug 'nathanaelkane/vim-indent-guides'    " Javascript indenting
Plug 'vim-scripts/RangeMacro'             " Easily applies macro to a range of lines
Plug 'mxw/vim-jsx'                        " JSX highlighting
Plug 'isRuslan/vim-es6'                   " ES6 highlighting
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }                   " Fuzzy file finder
"Plug 'junegunn/fzf.vim'                   " Aallows for FZF to be opened inside of vim
Plug 'SirVer/ultisnips'                   " Gotta love your snippets
Plug 'neomake/neomake'                    " Async job handling (for linters, replaces Syntastic)
Plug 'vim-airline/vim-airline-themes'     " Adds a directory of Airline Themes
Plug 'honza/vim-snippets'                 " more snippets
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }   " javascript code alyser
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] } " deopplet compatibility i think
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] } " javascript code complete

"Solidity
Plug 'tomlion/vim-solidity'

"Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'thinca/vim-ref'
Plug 'awetzel/elixir.nvim', { 'do': 'yes \| ./install.sh' }

" java plugins
Plug 'artur-shaik/vim-javacomplete2'      " java autocomplete

function! DoRemote(arg)
UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }     " Async autocomplete

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

set softtabstop=4
set relativenumber " enables relative number
set number  " shows the number of current line
set autoindent "automatically indents
set tabstop=4
set shiftwidth=4
set expandtab
set tw=0   "width of the document (used by GD)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80 " colors 80th collumn
set ignorecase "ignore case in search
set smartcase  "becomes case sensitive once you use a case
set hlsearch "highlights search
set incsearch "searches while typing
set foldmethod=indent


" turns on highlighted syntax not sure what the other shit does
filetype indent on
syntax on
autocmd! bufwritepost init.vim source %

" allows me to copy and past outside of terminal
set clipboard=unnamed

let mapleader = "\<space>"


" resize panes
nnoremap <silent> <Leader>+ :resize +5 <CR>
nnoremap <silent> <Leader>= :resize -5 <CR>


" move between tabs wit , M or N ( left and right respectively)
map <C-n> <esc>:tabnext<CR>
map <C-p> <esc>:tabprevious<CR>

" Alphabetically sort lines of code in visual mode
vnoremap <Leader>a :sort<CR>

" allows me edit the tabs in blocks of code
vnoremap < <gv
vnoremap > >gv

" easier formatting of paragraphs remaps when you go above 80 characters
vmap Q gq
nmap Q gqap


" remove search highlted words
nnoremap <CR> :noh <cr>

" Neomake settings
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter * Neomake

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

autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal tw=0

" Change indentation for html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal tw=0

" close tag for html plugin
autocmd FileType html let b:closetag_html_style=1

" Spell checking in html files
autocmd FileType html setlocal spell spelllang=en_us


" Powerline fonts
if has("gui_running")
        let s:uname = system("uname")
        if s:uname == "Darwin\n"
                set guifont=Inconsolata\ for\ Powerline
        endif
endif

" Powerline
let g:Powerline_symbols = 'unicode'
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set nocompatible
set laststatus=2

" Color scheme in ~/.vim/colors/
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'


" javascript settingS
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2

" yaml settings
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" markdown settings
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown setlocal spell spelllang=en_us

" winresizer plugin mapping
let g:winresizer_start_key='<Leader>r'

" vim-mardown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" function to let me do math in vim
vnoremap ;bc "ey:call CalcBC()<CR>
function! CalcBC()
  let has_equal = 0
  " remove newlines and trailing spaces
  let @e = substitute (@e, "\n", "", "g")
  let @e = substitute (@e, '\s*$', "", "g")
  " if we end with an equal, strip, and remember for output
  if @e =~ "=$"
    let @e = substitute (@e, '=$', "", "")
    let has_equal = 1
  endif
  " sub common func names for bc equivalent
  let @e = substitute (@e, '\csin\s*(', "s (", "")
  let @e = substitute (@e, '\ccos\s*(', "c (", "")
  let @e = substitute (@e, '\catan\s*(', "a (", "")
  let @e = substitute (@e, "\cln\s*(", "l (", "")
  " escape chars for shell
  let @e = escape (@e, '*()')
  " run bc, strip newline
  let answer = substitute (system ("echo " . @e . " \| bc -l"), "\n", "", "")
  " append answer or echo
  if has_equal == 1
    normal `>
    exec "normal a" . answer
  else
    echo "answer = " . answer
  endif
endfunction

" FZF settings
" This is the default extra key bindings
"let g:fzf_action = {
  "\ 'ctrl-t': 'tab split',
  "\ 'ctrl-x': 'split',
  "\ 'ctrl-v': 'vsplit' }

"" Default fzf layout
"" - down / up / left / right
"let g:fzf_layout = { 'down': '~40%' }

"" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }

"" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
  "\ 'bg':      ['bg', 'Normal'],
  "\ 'hl':      ['fg', 'Comment'],
  "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  "\ 'hl+':     ['fg', 'Statement'],
  "\ 'info':    ['fg', 'PreProc'],
  "\ 'prompt':  ['fg', 'Conditional'],
  "\ 'pointer': ['fg', 'Exception'],
  "\ 'marker':  ['fg', 'Keyword'],
  "\ 'spinner': ['fg', 'Label'],
  "\ 'header':  ['fg', 'Comment'] }

"" [Files] Extra options for fzf
""         e.g. File preview using CodeRay (http://coderay.rubychan.de/)
"let g:fzf_files_options =
  "\ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

"" [Buffers] Jump to the existing window if possible
"let g:fzf_buffers_jump = 1

"" [[B]Commits] Customize the options used by 'git log':
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"" [Tags] Command to generate tags file
"let g:fzf_tags_command = 'ctags -R'

"" [Commands] --expect expression for directly executing the command
"let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"nnoremap <silent> <C-c> :Files<CR>
"nnoremap <silent> <leader>a :Buffers<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources={}
let g:deoplete#sources._=['buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:tern#command = ['tern']
let g:tern#arguments = ['-persistent']

let g:acp_enableAtStartup = 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir="/Users/AdamC/.config/nvim/"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsUsePythonVersion = 3

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical" Enable snipMate compatibility feature.

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'luna'

hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" move between pane using control keys and H,J,K,L
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <BS> <C-W><C-H>                " There's a bug with neovim <C-H> return <BS> this is my hack-around


" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)

" File exploring settings
set hidden
set path+=**
set path-=**/node_modules/*
set wildmenu
set wildignore+=**/node_modules/*

" File exploring shortcuts
nnoremap <Leader>ft  :NERDTreeToggle<cr>
nnoremap <Leader>f<space>  :NERDTreeToggle<cr>
nnoremap <Leader>ff  :find \c
nnoremap <Leader>fb  :ls<CR>:b 
nnoremap <Leader>fs  :vsplit<CR>:find \c
nnoremap <Leader>fi  :split<CR>:find \c

" live substitue
set inccommand=split
