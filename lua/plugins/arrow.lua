return {
  -- "hungyiloo/arrow.nvim",
  "arrow.nvim",
  dev = true,
  event = "BufReadPost",
  opts = {
    show_icons = true,
    show_cheatsheet = false,
    save_key = "git_root",
    mappings = {
      ["Jump to Directory"] = "j"
    },
    actions = {
      ["Jump to Directory"] = function (filename)
        vim.cmd("edit " .. filename)
        vim.cmd("Oil --float")
      end,
    }
  },
  cmd = "Arrow",
  keys = {
    { mode = "n", "<leader>h", function() require("arrow").open() end, desc = "Arrow", nowait = true },
    { mode = "n", "<leader>m", function() require("arrow").open_bookmarks() end, desc = "Arrow Buffer Bookmarks", nowait = true },
    { mode = "n", "g1", function() require("arrow").open(1) end, desc = "Arrow File 1", nowait = true },
    { mode = "n", "g2", function() require("arrow").open(2) end, desc = "Arrow File 2", nowait = true },
    { mode = "n", "g3", function() require("arrow").open(3) end, desc = "Arrow File 3", nowait = true },
    { mode = "n", "g4", function() require("arrow").open(4) end, desc = "Arrow File 4", nowait = true },
    { mode = "n", "g5", function() require("arrow").open(5) end, desc = "Arrow File 5", nowait = true },
  },
}
