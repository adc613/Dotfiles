return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
    "nvim-telescope/telescope.nvim",
    -- "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  cmd = "Leet",
  keys = {
    { '<Leader>la', ':Leet test<CR>',        desc = 'Run test cases', },
    { '<Leader>lc', ':Leet console<CR>',     desc = 'Open leet code console' },
    { '<Leader>lS', ':Leet submit<CR>',      desc = 'Submit answer' },
    { '<Leader>lO', ':Leet open<CR>',        desc = 'Open question in browser' },
    { '<Leader>lt', ':Leet desc toggle<CR>', desc = 'Toggle question description' },
  },
  opts = {
    -- configuration goes here
    lang = 'python3'
  },
}
