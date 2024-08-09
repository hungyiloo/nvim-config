return {
  -- "hungyiloo/arrow.nvim",
  "arrow.nvim",
  dev = true,
  opts = {
    show_icons = true,
    save_key = "git_root"
  },
  keys = {
    { mode = "n", "<leader>h", function() require("arrow.ui").openMenu() end, desc = "Arrow" },
    { mode = "n", "<leader>m", function() require("arrow.buffer_ui").openMenu() end, desc = "Arrow Buffer" },
  }
}
