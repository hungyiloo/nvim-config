return {
  "TobinPalmer/BetterGX.nvim",
  keys = {
    {
      "g<cr>",
      function()
        require("better-gx").BetterGx()
      end,
      desc = "Open file/link under cursor",
    },
  },
}
