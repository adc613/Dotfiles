return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
        "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    cmd = "Leet",
    keys = {
      {'<LocalLeader>a', ':Leet test<CR>', desc = 'Run test cases'},
      {'<LocalLeader>c', ':Leet console<CR>', desc = 'Open leet code console'},
      {'<LocalLeader>S', ':Leet submit<CR>', desc = 'Submit answer'},
      {'<LocalLeader>o', ':Leet open<CR>', desc = 'Open question in browser'},
      {'<LocalLeader>t', ':Leet desc toggle<CR>', desc = 'Toggle question'},
    },
    opts = {
        -- configuration goes here
        lang = 'typescript'
    },
}
