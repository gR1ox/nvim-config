return {
   'nvim-tree/nvim-tree.lua',
   dependencies = 'nvim-tree/nvim-web-devicons',
   config = function()
      local nvimtree = require('nvim-tree')

      -- recommended settings from documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      nvimtree.setup({
         view = {
            width = 35,
            relativenumber = true,
         },
         -- Folder arrow icons
         renderer = {
            indent_markers = {
               enable = true
            },
         },
         actions = {
            open_file = {
               window_picker = {
                  enable = false,
               },
            },
         },
         filters = {
            custom = { ".DS_Store" },
         },
         git = {
            ignore =false
         },
      })

      -- Keymaps for nvim-tree
      local km = vim.keymap

      km.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
   end
}
