return {
 {
   'bling/vim-airline',
   dependencies = {'vim-airline/vim-airline-themes'},
   config = function()
     vim.cmd([[
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
     ]])
   end,
 },
 {'mkitt/tabline.vim'},                  -- Displays window tabs
 {'Townk/vim-autoclose'},                -- Automatically closes parenthesis and quores
 {'docunext/closetag.vim'},              -- Closes html tags when I type </
 {'scrooloose/nerdcommenter'},           -- Easy commenting and uncommenting
 {'tpope/vim-fugitive'},                 -- Git integration
 {'tpope/vim-surround'},                 -- Allows easy surrounding of words and text in quotes and such
 {'godlygeek/tabular'},                  -- Don't know what this is or how it got here
 {
   'simeji/winresizer',
   lazy = false,
   config = function()
     vim.cmd([[
       let g:winresizer_start_key='<Leader>r'
     ]])
   end
 },
 {'vim-scripts/RangeMacro'},             -- Easily applies macro to a range of lines
 {'SirVer/ultisnips'},                   -- Gotta love your snippets
 {'honza/vim-snippets'},                 -- more snippets
 {
   'mbbill/undotree',
   config = function ()
    vim.keymap.set('n', '<Leader>u', ':UndotreeToggle<CR>', { desc = "Open undo tree" })
   end,
 },                    -- A plugin for visualizing VIM's undo/redo tree
 {'mhinz/vim-signify'},                  -- Version control visualization
 {'jparise/vim-graphql'},                -- GrqphQL highlighting
 -- JavaScript
 {'jelera/vim-javascript-syntax'}, -- JavaScript syntax highlighting
 {'pangloss/vim-javascript'},    -- JavaScript indenting
 {'isRuslan/vim-es6'},                -- ES6 highlighting
 {'nathanaelkane/vim-indent-guides'}, -- Indenting
}
