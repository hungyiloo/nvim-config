return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { mode = "n", "<leader>gt", ":DiffviewFileHistory %<cr>", silent = true, desc = "Git Timemachine" },
    { mode = "x", "<leader>gt", ":'<,'>DiffviewFileHistory %<cr>", silent = true, desc = "Git Timemachine" },
  },
  opts = {
    keymaps = {
      view = {
        { "n", "q", function () vim.cmd("DiffviewClose") end, { desc = "Close Diffview" } }
      },
      file_panel = {
        { "n", "q", function () vim.cmd("DiffviewClose") end, { desc = "Close Diffview" } }
      },
      file_history_panel = {
        { "n", "q", function () vim.cmd("DiffviewClose") end, { desc = "Close Diffview" } }
      }
    }
  }
}
