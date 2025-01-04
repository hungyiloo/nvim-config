return {
  "Wansmer/treesj",
  keys = {
    { "g|", "<cmd>TSJToggle<cr>", mode = { "n" }, desc = "Treesitter Split/Join" },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    max_join_length = 1024,
  },
}
