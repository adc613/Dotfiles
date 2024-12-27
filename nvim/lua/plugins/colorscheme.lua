return {
 --{
   --'ayu-theme/ayu-vim',
   --enable = false,
 --},
 --{
   --'catppuccin/nvim',
   --enable = false,
 --},
 {
   '0xstepit/flow.nvim',
    lazy = false,
    enable = true,
    priority = 1000,
    tag = "v2.0.0",
    opts = {
      theme = {
        style = "dark", --  "dark" | "light"
        contrast = "default", -- "default" | "high"
        transparent = false, -- true | false
      },
      colors = {
        mode = "default", -- "default" | "dark" | "light"
        fluo = "cyan", -- "pink" | "cyan" | "yellow" | "orange" | "green"
      },
      ui = {
        borders = "fluo", -- "theme" | "inverse" | "fluo" | "none"
        aggressive_spell = false, -- true | false
      },
    },
   config = function (_, opts)
     require("flow").setup(opts)
     vim.cmd.colorscheme("flow")
   end,
 },
 --{
   --'rebelot/kanagawa.nvim',
   --enable = false,
   --config = function ()
     --vim.cmd.colorscheme("kanagawa")
   --end
 --},
}
