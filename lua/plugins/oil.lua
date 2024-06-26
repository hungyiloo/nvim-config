return {
  "stevearc/oil.nvim",
  -- Can't be lazy if we want it to replace netrw by default at startup
  lazy = false,
  cmd = "Oil",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
