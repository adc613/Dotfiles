return {
  {
    "nvim-neorg/neorg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.summary"] = {
          strategy = "default"
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
