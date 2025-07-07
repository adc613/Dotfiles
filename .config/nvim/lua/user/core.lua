vim.opt.autoindent = true
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.tw = 0
vim.g.localleader = "\\"
vim.g.mapleader = '<space>'
vim.o.clipboard = 'unnamed'
vim.o.conceallevel = 2
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.syntax = 'on'

-- sets colorscheme and uses true colros
vim.o.termguicolors = true
vim.wo.colorcolumn = '81'

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

-- File exploring settings
vim.opt.hidden = true
vim.opt.path:remove { '**/node_modules/*' }
vim.opt.wildmenu = true
vim.opt.wildignore:append { '**/ignore/*', '**/flow-typed/*', '**/coverage/*', '**/node_modules/*' }

-- live substitue
vim.opt.inccommand = 'split'

vim.o.undofile = true
vim.o.undodir = '/home/adam/.undo'

vim.o.spellfile = '/home/adam/.config/nvim/en.utf-8.add'
vim.o.spelllang = 'en'
vim.o.spell = true

vim.o.winborder = 'rounded'
vim.o.winblend = 0
-- [ink](https://github.com/nvim-telescope/telescope.nvim/issues/3436#issuecomment-2756267300)
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeFindPre",
  callback = function()
    vim.opt_local.winborder = "none"
    vim.api.nvim_create_autocmd("WinLeave", {
      once = true,
      callback = function()
        vim.opt_local.winborder = "rounded"
      end,
    })
  end,
})
