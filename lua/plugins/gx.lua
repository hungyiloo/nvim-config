return {
  "hungyiloo/gx.nvim",
  --
  -- NOTE: This is a commit on my fork which fixes some Windows issues.
  --       Remove this if my PR is merged upstream.
  commit = "8854d7f28d513050ea736a6d6d1f7605c82e9813",

  lazy = true,
  keys = { { "g<cr>", "<cmd>Browse<cr>", mode = { "n", "x" } } },
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
