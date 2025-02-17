return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function(_, opts)
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

      require('telescope').setup(opts)
    end,
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    keys = {
      {'<Leader>f<space>', ':Oil<cr>', 'n', desc = 'Open Oil file viewer'},
    },
    opts = {},
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = {
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    },
    lazy = false,
    keys = {
      {'<leader>fa', ':NvimTreeToggle<CR>', 'n', desc = 'Toggle file tree'},
      {'<leader>fA', ':NvimTreeFindFileToggle<CR>', 'n', desc = 'Toggle file tree'},
    },
    config = function (_, opts)
      require('nvim-tree').setup(opts)
      local api = require('nvim-tree.api')

      vim.keymap.set('n', '<leader>f?', api.tree.toggle_help, { desc = 'Toggle file tree help' })
    end
  },
}
