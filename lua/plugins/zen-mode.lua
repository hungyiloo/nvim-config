return {
  "folke/zen-mode.nvim",
  opts = {},
  keys = {
    {
      "<leader>uz",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Zen Mode",
    },
  },
}
