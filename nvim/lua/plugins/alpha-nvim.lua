return {
  {
    'goolord/alpha-nvim',
    config = function ()
      local status_ok, alpha = pcall(require, "alpha")
      if not status_ok then
       return
      end

      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {

          [[          ▀████▀▄▄              ▄█ ]],
          [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
          [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
          [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
          [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
          [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
          [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
          [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
          [[   █   █  █      ▄▄           ▄▀   ]],

      }

       dashboard.section.buttons.val = {
         dashboard.button("n", "  Open scratch note", ":Neorg workspace scratch<CR>:Neorg journal today<CR>"),
         dashboard.button("s", "  Open services notes", ":Neorg workspace services<CR>"),
         dashboard.button("d", "  Open dev notes", ":Neorg workspace dev<CR>"),
         dashboard.button("f", "  Find file", ":find "),
         dashboard.button("c", "  Configuration", ":find ~/.config/nvim/init.lua<CR>"),
         dashboard.button("h", "  CheckHealth", ":checkhealth<CR>"),
         dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
         dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
      }

      local function footer()
       return "Don't Stop Until You are Proud..."
      end

      dashboard.section.footer.val = footer()

      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)

      vim.keymap.set('n', '<Leader><space>', ':Alpha<CR>')

    end,
  }
}
