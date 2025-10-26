return {
   "ThePrimeagen/harpoon",
   branch = "harpoon2",
   dependencies = { "nvim-lua/plenary.nvim" },
   config = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      local km = vim.keymap

      km.set("n", "<leader>a", function() harpoon:list():add() end, { desc =  "Adds current tab to harpoon list" })
      km.set("n", "<leader>hn", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Opens harpoon menu" })

      km.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Goes to tab 1 in harpoon list" })
      km.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Goes to tab 2 in harpoon list" })
      km.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Goes to tab 3 in harpoon list" })
      km.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Goes to tab 4 in harpoon list" })

      -- Toggle previous & next buffers stored within Harpoon list
      km.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      km.set("n", "<C-S-N>", function() harpoon:list():next() end)
   end
}
