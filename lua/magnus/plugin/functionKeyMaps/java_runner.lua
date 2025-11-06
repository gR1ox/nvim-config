local Job = require("plenary.job")

local M = {}

function M.setup()
   vim.keymap.set("n", "<leader>jjr", function()
      local cwd = vim.fn.getcwd()
      local pom_path = cwd .. "/pom.xml"
      local pom_exists = vim.fn.filereadable(pom_path) == 1

      if pom_exists then
         -- 🔧 Use Maven compile
         vim.notify("📦 Detected Maven project — running 'mvn run'...", vim.log.levels.INFO)
         Job:new({
            command = "mvn",
            args = { "exec:java" },
            cwd = cwd,
         }):start()
      else
         -- 🧱 Manual javac compilation
         vim.notify("🔧 No pom.xml found — Make it into a maven project to run it with this command", vim.log.levels.WARN)
         -- Find all .java files recursively
         local java_files = vim.fn.globpath(cwd, "**/*.java", false, true)
      end
   end, { desc = "Run Java project" })
end

return M

