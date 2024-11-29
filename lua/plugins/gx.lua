return {
  "chrishrb/gx.nvim",
  lazy = true,
  keys = { { "g<cr>", "<cmd>Browse<cr>", mode = { "n", "x" }, desc = "Browse URL" } },
  cmd = { "Browse" },
  init = function()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    open_browser_app = "powershell.exe",
    open_browser_args = { "start" }
  },
  config = true, -- default settings
}
