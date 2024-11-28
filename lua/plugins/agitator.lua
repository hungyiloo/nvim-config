return {
  "agitator.nvim",
  dev = true,
  keys = {
    { mode = "n", "<leader>gb", function() require("agitator").git_blame_toggle() end, desc = "Git Blame Lines", nowait = true },
    { mode = "n", "<leader>gB", function() Snacks.git.blame_line() end, desc = "Git Blame Line", nowait = true },
    { mode = "n", "<leader>gt", function() require("agitator").git_time_machine({ use_current_win = true }) end, desc = "Git Timemachine", nowait = true },
    { mode = "n", "<leader>go", function() require("agitator").open_file_git_branch() end, desc = "Open File from Branch", nowait = true },
    { mode = "n", "<leader>g<cr>", function() Snacks.gitbrowse.open() end, desc = "Git Browse", nowait = true },
  }
}
