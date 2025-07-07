vim.opt_local.tw = 80
vim.opt_local.spelllang = 'en'
vim.opt_local.spell = true
vim.opt_local.spellfile = '/home/adam/.config/nvim/en.utf-8.add'

vim.keymap.set("n", "<LocalLeader>im", ":Neorg inject-metadata<CR>", { buffer = true, desc = "Inject norg metadata" })
vim.keymap.set("n", "<LocalLeader>ot", ":Neorg toc<CR>", { buffer = true, desc = "Open Table of contents in side panel" })
