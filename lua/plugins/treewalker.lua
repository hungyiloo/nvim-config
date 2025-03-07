return {
  "aaronik/treewalker.nvim",
  opts = {
    highlight = true -- Whether to briefly highlight the node after jumping to it
  },
  keys = {
    { mode = "n", "<C-M-j>", "<cmd>Treewalker Down<cr>", desc = "Treewalker Down", silent = true, nowait = true },
    { mode = "n", "<C-M-k>", "<cmd>Treewalker Up<cr>", desc = "Treewalker Up", silent = true, nowait = true },
    { mode = "n", "<C-M-h>", "<cmd>Treewalker Left<cr>", desc = "Treewalker Left", silent = true, nowait = true },
    { mode = "n", "<C-M-l>", "<cmd>Treewalker Right<cr>", desc = "Treewalker Right", silent = true, nowait = true },
  }
}
