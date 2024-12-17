return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function(_, opts)
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
      -- Ran into what I think is a bug with floating windows with blink.cmp and
      -- floating windows CommandLine mode. Telescope has a cleaner UI anyway.
      vim.keymap.set('n', 'q:', ":Telescope command_history<CR>", { desc = 'Override for CommandLine mode that moves it to telescope' })

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
}
