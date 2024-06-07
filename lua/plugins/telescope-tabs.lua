return {
  "LukasPietzschmann/telescope-tabs",
  config = function()
    require("telescope").load_extension("telescope-tabs")
    require("telescope-tabs").setup({
      -- Your custom config :^)
    })
  end,
  keys = {
    {
      "<leader><tab><tab>",
      function()
        require("telescope-tabs").list_tabs()
      end,
      desc = "List Tabs",
    },
  },
  dependencies = { "nvim-telescope/telescope.nvim" },
}
