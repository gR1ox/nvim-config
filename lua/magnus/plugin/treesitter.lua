return {
   "nvim-treesitter/nvim-treesitter",
   event = { "BufReadPre", "BufNewFile" },
   build = ":TSUpdate",
   dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
   },
   build = ':TSUpdate',
   opts = {
      highlight = {
         enable = true,
      },
      indent = { enable = true },
      auto_install = true, -- automatically install syntax support when entering new file type buffer
      ensure_installed = {
         'lua',
         'comment',
      },
   },
   config = function()
      local treesitter = require("nvim-treesitter.configs")
      treesitter.setup({
         highlight = {
            enable = true
         },
         indent = { enable = true },
         autotag = {
            enable = true,
         },
         ensure_installed = {
            "json",
            "java",
            "javadoc",
            "html",
            "css",
            "c_sharp",
            "lua",
            "gitignore",
            "vim",
            "python",
            "dockerfile",
            "vimdoc",
         },
         incremental_selection = {
            enable = true,
            keymaps =  {
               init_selection = "<C-space>",
               node_incremental = "<C-space>",
               scope_incremental = false,
               node_decremental = "<bs>",
            },
         },

      })
   end
}  
