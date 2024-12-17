return {
  {
    "nvim-neorg/neorg",
    dependencies = {'nvim-treesitter/nvim-treesitter'},
    lazy = false,
    version = "*",
    config = true,
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
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
      },
    },
  },
}
