return {
 { 'ayu-theme/ayu-vim', },
 {
   'catppuccin/nvim',
 },
 {
   'rebelot/kanagawa.nvim',
   config = function ()
     print("loading colorscheme")
     vim.cmd.colorscheme("kanagawa")
   end
 }
}
