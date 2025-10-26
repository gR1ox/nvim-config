local Job = require("plenary.job")

local M = {}

function M.setup()
   vim.keymap.set("n", "<leader>jjc", function()
      local cwd = vim.fn.getcwd()
      local pom_path = cwd .. "/pom.xml"
      local pom_exists = vim.fn.filereadable(pom_path) == 1

      if pom_exists then
         -- 🔧 Use Maven compile
         vim.notify("📦 Detected Maven project — running 'mvn compile'...", vim.log.levels.INFO)
         Job:new({
            command = "mvn",
            args = { "compile" },
            cwd = cwd,
            on_exit = function(_, return_val)
               if return_val == 0 then
                  vim.schedule(function()
                     vim.notify("✅ Maven compile successful!", vim.log.levels.INFO)
                  end)
               else
                  vim.schedule(function()
                     vim.notify("❌ Maven compile failed!", vim.log.levels.ERROR)
                  end)
               end
            end,
         }):start()
      else
         -- 🧱 Manual javac compilation
         vim.notify("🔧 No pom.xml found — using manual compile.", vim.log.levels.WARN)

         local bin_dir = cwd .. "/bin"
         if vim.fn.isdirectory(bin_dir) == 0 then
            vim.fn.mkdir(bin_dir, "p")
            vim.notify("📁 Created bin directory at " .. bin_dir, vim.log.levels.INFO)
         end

         -- Find all .java files recursively
         local java_files = vim.fn.globpath(cwd, "**/*.java", false, true)

         if #java_files == 0 then
            vim.notify("⚠️ No Java files found to compile!", vim.log.levels.WARN)
            return
         end

         Job:new({
            command = "javac",
            args = vim.list_extend({ "-d", "bin" }, java_files),
            cwd = cwd,
            on_exit = function(_, return_val)
               if return_val == 0 then
                  vim.schedule(function()
                     vim.notify("✅ Compilation successful!", vim.log.levels.INFO)
                  end)
               else
                  vim.schedule(function()
                     vim.notify("❌ Compilation failed!", vim.log.levels.ERROR)
                  end)
               end
            end,
         }):start()
      end
   end, { desc = "Compile Java project" })
end

return M

