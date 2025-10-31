return {
   "rose-pine/neovim",
   name = "rose-pine",
   lazy = false,
   priority = 1000,
   config = function()
      require("rose-pine").setup({
         variant = "main",
         disable_background = false,
         disable_float_background = false,
         disable_italics = false,
         highlight_groups = {
            Normal = { bg = 'NONE' },
            NormalFloat = { bg = 'NONE' },
            FloatBorder = { fg = 'highlight_med', bg = 'NONE' },
            Pmenu = { bg = 'NONE' },
            TelescopeBorder = { fg = 'highlight_med', bg = 'NONE' },
            TelescopeNormal = { bg = 'NONE' },
         },
      })

      vim.cmd("colorscheme rose-pine")
   end
}
