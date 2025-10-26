vim.g.mapleader = " "

local km = vim.keymap

-- Normal mode Keymaps
km.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
km.set("n", "<leader>+", "<C-a>", { desc = "Increments highligheted number" })
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement highligheted number" })

-- General navigation keymaps
km.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goes to function definition" })
km.set("n", "<leader>op", ":tabnew<CR>", { desc = "Makes current file into a tab" })
km.set("n", "<leader>cp", ":tabc<CR>", { desc = "Closes current tab" })




