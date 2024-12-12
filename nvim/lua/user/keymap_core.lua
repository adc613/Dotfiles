-- File exploring shortcuts
vim.keymap.set('n', '<Leader>ft', ':tabnew<cr>:find<space>')
vim.keymap.set('n', '<Leader>f<space>', ':Explore<cr>')
vim.keymap.set('n', '<Leader>ff', ':find<space>')
vim.keymap.set('n', '<Leader>fb', ':ls<CR>:b<space>')
vim.keymap.set('n', '<Leader>fs', ':vsplit<CR>:find<space>')
vim.keymap.set('n', '<Leader>fi', ':split<CR>:find<space>')
vim.keymap.set('n', '<Leader>fv', ':find ~/.config/nvim/config/lua/user/core.lua<CR>')
vim.keymap.set('n', '<Leader>fp', ':find ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<Leader>f#', ':b#<CR>')

-- unhighlights works
vim.keymap.set('n', '<Leader><CR>', ':noh<cr>')

-- move between pane using control keys and H,J,K,L
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- Easy shifting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v','<Leader>a', ':sort<CR>')

vim.keymap.set('n', '<C-n>', ':tabnext<CR>')
vim.keymap.set('n', '<C-p>', ':tabprevious<CR>')

-- Capitalizes the word that was just written and enters insert mode at the end
-- of the word
vim.keymap.set('i','<C-u>', '<esc>hviwUea')
