return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>sg", LazyVim.pick("live_grep_glob"), desc = "Grep (Root Dir)" },
    { "<leader>sG", LazyVim.pick("live_grep_glob", { root = false }), desc = "Grep (cwd)" },
  }
}
