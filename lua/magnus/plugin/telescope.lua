return {
   "nvim-telescope/telescope.nvim",
   branch = "0.1.x",
   dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
   },
   config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
         defaults = {
            path_display = { "smart" },
            mappings = {
               i = {
                  ["<C-k>"] = actions.move_selection_previous,
                  ["<C-j>"] = actions.move_selection_next,
                  ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
               },
            },
         },
      })

      telescope.load_extension("fzf")

      -- Telescope keymaps
      local km = vim.keymap

      km.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files in fuzzy find"})
      km.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files in fuzzy find"})
      km.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find string in fuzzy find"})
      km.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in fuzzy find"})

   end,
}
