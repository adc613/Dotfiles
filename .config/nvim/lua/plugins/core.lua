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
  }, -- A plugin for visualizing VIM's undo/redo tree
  {
    'mhinz/vim-signify',
    cmd = { "SignifyToggle" },
    keys = {
      { "<leader>gs", "<cmd>SignifyToggle<CR>", desc = "Toggle Outline", }
    },
  },                                     -- Version control visualization
  { 'jparise/vim-graphql' },             -- GrqphQL highlighting
  -- JavaScript
  { 'jelera/vim-javascript-syntax' },    -- JavaScript syntax highlighting
  { 'pangloss/vim-javascript' },         -- JavaScript indenting
  { 'isRuslan/vim-es6' },                -- ES6 highlighting
  { 'nathanaelkane/vim-indent-guides' }, -- Indenting
  {
    "danymat/neogen",
    opts = {
      enabled = true,
      languages = {
        lua = {
          template = {
            annotation_convention = "emmylua",
          }
        },
      }
    },
    config = function(opts)
      vim.api.nvim_set_keymap("n", "<Leader>dc", ":lua require('neogen').generate({ type = 'class' })<CR>",
        { noremap = true, silent = true, desc = "Generate class comments" })
      vim.api.nvim_set_keymap("n", "<Leader>df", ":lua require('neogen').generate({ type = 'func' })<CR>",
        { noremap = true, silent = true, desc = "Generate function comments" })
      vim.api.nvim_set_keymap("n", "<Leader>dt", ":lua require('neogen').generate({ type = 'type' })<CR>",
        { noremap = true, silent = true, desc = "Generate type comments" })
      vim.api.nvim_set_keymap("n", "<Leader>dF", ":lua require('neogen').generate({ type = 'file' })<CR>",
        { noremap = true, silent = true, desc = "Generate file comments" })

      require('neogen').setup(opts)
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  }
}
