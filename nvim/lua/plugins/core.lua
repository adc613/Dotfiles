return {
  { 'Townk/vim-autoclose' }, -- Automatically closes parenthesis and quores
  {
    'docunext/closetag.vim',
    enabled = false,
  },                              -- Closes html tags when I type </
  { 'scrooloose/nerdcommenter' }, -- Easy commenting and uncommenting
  { 'tpope/vim-fugitive' },       -- Git integration
  { 'tpope/vim-surround' },       -- Allows easy surrounding of words and text in quotes and such
  { 'godlygeek/tabular' },        -- Don't know what this is or how it got here
  {
    'simeji/winresizer',
    lazy = false,
    config = function()
      vim.keymap.set('n', '<Leader>r', ':WinResizerStartResize<CR>', { desc = "Resize windows" })
    end
  },
  { 'vim-scripts/RangeMacro' }, -- Easily applies macro to a range of lines
  { 'SirVer/ultisnips' },       -- Gotta love your snippets
  { 'honza/vim-snippets' },     -- more snippets
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<Leader>u', ':UndotreeToggle<CR>', { desc = "Open undo tree" })
    end,
  },                                     -- A plugin for visualizing VIM's undo/redo tree
  { 'mhinz/vim-signify' },               -- Version control visualization
  { 'jparise/vim-graphql' },             -- GrqphQL highlighting
  -- JavaScript
  { 'jelera/vim-javascript-syntax' },    -- JavaScript syntax highlighting
  { 'pangloss/vim-javascript' },         -- JavaScript indenting
  { 'isRuslan/vim-es6' },                -- ES6 highlighting
  { 'nathanaelkane/vim-indent-guides' }, -- Indenting
}
