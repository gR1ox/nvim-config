vim.deprecate = function() end

-- Suppress Lazy invalid plugin spec warnings
vim.notify = function(msg, level, opts)
  if msg:match("Invalid plugin spec") then
    return
  end
  vim.api.nvim_echo({{msg}}, true, {})
end

require("magnus.core")
require("magnus.lazy")
require("magnus.plugin.functionKeyMaps.java_compiler").setup()
