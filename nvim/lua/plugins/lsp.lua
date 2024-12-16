local servers = {
  "lua_ls",
  --"cssls",
  --"html",
  -- "ts_ls",
  --"jsonls",
  --"tailwindcss",
  --"eslint",
  --"prismals",
  -- "gopls",
  --"bashls",
  --"astro",
  --"yamlls",
  -- "dockerls",
   --"rust_analyzer",
}


return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { -- optional cmp completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    version = 'v0.*',
    opts = {
      keymap = { preset = 'enter' },
      sources = {
        -- add lazydev to your completion providers
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          -- dont show LuaLS require statements when lazydev has items
          lsp = { fallbacks = { "lazydev" } },
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
        },
      },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require "lspconfig"

      -- diagnostic config
      vim.diagnostic.config {
        virtual_text = true,
        update_in_insert = false,
        underline = true,
      }

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set
        keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
        keymap("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "gl", vim.diagnostic.open_float, opts)
        keymap("n", "]d", vim.diagnostic.goto_next, opts)
        keymap("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap("n", "<leader>la", vim.lsp.buf.code_action, opts)
        keymap("n", "<leader>lr", vim.lsp.buf.rename, opts)
        keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
        keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
      end

      local common_capabilities = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        return capabilities
      end

      for _, server in pairs(servers) do
        local opts = {
          on_attach = on_attach,
          capabilities = common_capabilities(),
        }

        local require_ok, settings = pcall(require, "user.lspsettings." .. server)
        if require_ok then
          opts = vim.tbl_deep_extend("force", settings, opts)
        end

        --if server == "lua_ls" then
          --require("neodev").setup {}
        --end

        lspconfig[server].setup(opts)
      end

      -- Ui stuff
      local default_diagnostic_config = {
        signs = {
          active = true,
          values = {
            { name = "DiagnosticSignError", text = "" },
            { name = "DiagnosticSignWarn", text = "" },
            { name = "DiagnosticSignHint", text = "" },
            { name = "DiagnosticSignInfo", text = "" },
          },
        },
        virtual_text = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }

      vim.diagnostic.config(default_diagnostic_config)

      local config = vim.diagnostic.config()
      if config then
        for _, sign in ipairs(vim.tbl_get(config, "signs", "values") or {}) do
          vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
        end
      end

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
      require("lspconfig.ui.windows").default_options.border = "rounded"
      --vim.lsp.set_log_level('debug')
    end,
  },
}
