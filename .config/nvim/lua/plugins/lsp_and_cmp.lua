local servers = {
  "lua_ls",
  --"cssls",
  --"html",
  "ts_ls",
  --"jsonls",
  --"tailwindcss",
  "elixirls",
  --"eslint",
  --"prismals",
  -- "gopls",
  --"bashls",
  --"astro",
  --"yamlls",
  -- "dockerls",
  "pyright",
  "rust_analyzer",
}

local server_opt = {
  elixirls = {
    cmd = { "/home/adam/bin/elixir-ls/language_server.sh" },
    filetypes = { "elixir", "eelixir", "heex", "surface" },
    root_dir = function(fname)
      local matches = vim.fs.find({ 'mix.exs' }, { upward = true, limit = 2, path = fname })
      local child_or_root_path, maybe_umbrella_path = unpack(matches)
      local root_dir = vim.fs.dirname(maybe_umbrella_path or child_or_root_path)

      return root_dir
    end
  },
  --pyright = {
  --cmd = { "/home/adam/.local/bin/pyright" },
  --filetypes = { "python" },
  --},
}


return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      position = "left",
    },
    keys = {
      { "<leader>lo", "<cmd>Outline<CR>", desc = "Toggle Outline", }
    },
  },
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
    version = 'v1.*',
    opts = {
      keymap = { preset = 'default' },
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
        virtual_text = {
          current_line = true,
        },
        update_in_insert = false,
        underline = true,
        signs = true,
      }

      local toggle_virtual_text_flag = true
      local function toggle_virtual_text()
        if toggle_virtual_text_flag then
          vim.diagnostic.config({
            virtual_lines = { current_line = true },
            virtual_text = false,
            signs = true,
          })
        else
          vim.diagnostic.config({
            virtual_lines = false,
            virtual_text = { current_line = true },
            signs = true,
          })
        end

        toggle_virtual_text_flag = not toggle_virtual_text_flag
      end

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap.set
        keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap("n", "gD", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        keymap("n", "grr", "<cmd>Telescope lsp_references<CR>", opts)
        keymap("n", "gri", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "gl", vim.diagnostic.open_float, opts)
        keymap("n", "gL", toggle_virtual_text, opts)
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

        if server_opt[server] then
          opts = vim.tbl_deep_extend("force", server_opt[server], opts)
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
            { name = "DiagnosticSignError", text = "" },
            { name = "DiagnosticSignWarn", text = "" },
            { name = "DiagnosticSignHint", text = "" },
            { name = "DiagnosticSignInfo", text = "" },
          },
        },
        --virtual_text = true,
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

      require("lspconfig.ui.windows").default_options.border = "rounded"
      --vim.lsp.set_log_level('debug')
    end,
  },
}
