return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>gg",
        function()
          require("neogit").open({ cwd = LazyVim.root.git() })
        end,
        desc = "Neogit (Root Dir)",
      },
      {
        "<leader>gG",
        function()
          LazyVim.lazygit({ cwd = LazyVim.root.git() })
        end,
        desc = "Lazygit (Root Dir)",
      },
    },
    config = {
      -- Hides the hints at the top of the status buffer
      disable_hint = true,

      graph_style = "unicode",
      signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },
    },
  },
}
