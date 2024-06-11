return {
  { import = "lazyvim.plugins.extras.coding.yanky" },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "<leader>p", false },
      {
        "<leader>iy",
        function()
          require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Insert Yank History",
      },
    },
  },
}
