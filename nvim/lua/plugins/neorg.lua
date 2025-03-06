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
  {
    dir = "/home/adam/projects/neorg",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'benlubas/neorg-conceal-wrap',
      "nvim-neorg/lua-utils.nvim",
      "pysan3/pathlib.nvim",
    },
    lazy = false,
    version = "*",
    config = true,
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
            },
            default_workspace = "scratch",
          },
        },
        ["external.conceal-wrap"] = {},
      },
    },
  },
}
