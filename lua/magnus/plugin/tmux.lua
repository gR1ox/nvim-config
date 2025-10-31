return {
  -- Optional: manage TPM via Lazy (just clones it)
  {
    "tmux-plugins/tpm",
    dir = "~/.tmux/plugins/tpm",
    lazy = false,
    priority = 1000,
    build = function()
      -- Auto-install TPM if missing
      if vim.fn.isdirectory(vim.fn.expand("~/.tmux/plugins/tpm")) == 0 then
        vim.fn.system({
          "git", "clone", "https://github.com/tmux-plugins/tpm",
          vim.fn.expand("~/.tmux/plugins/tpm")
        })
      end
    end,
  },
}
