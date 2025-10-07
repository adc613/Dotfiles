return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      image = {
        -- your image configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    }
  },
  --{
  --dir = "/home/adam/projects/ghost_plugin",
  --opts = {
  --test = "Hello world",
  --},
  --},
  {
    'nvim-neorg/neorg',
    --dir = "/home/adam/projects/neorg",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'benlubas/neorg-conceal-wrap',
      "nvim-neorg/lua-utils.nvim",
      "pysan3/pathlib.nvim",
    },
    lazy = false,
    version = "*",
    config = true,
    keys = {
      { '<Leader>nw', ':Neorg workspace ', 'n', desc = 'Open neorg workspace' },
      { '<Leader>nj', ':Neorg journal ',   'n', desc = 'Open neorg journal' },
    },
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.export"] = {},
        ["core.summary"] = {
          config = {
            strategy = "default",
          },
        },
        ["core.integrations.treesitter"] = {
          config = {
            install_parsers = true,
            configure_parsers = true
          },
        },
        ["core.esupports.metagen"] = {
          config = {
            type = "empty",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              scratch = "~/notes/scratch",
              logs = "~/notes/logs",
              services = "~/notes/services/",
              dev = "~/notes/dev/",
              blog = "~/notes/blog/",
              life = "~/notes/life/",
            },
            default_workspace = "scratch",
          },
        },
        ["external.conceal-wrap"] = {},
      },
    },
  },
}
