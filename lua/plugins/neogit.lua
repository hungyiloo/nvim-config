-- NOTE: This is commented out because lazygit currently seems more usable in
--       my personal circumstances. This may change, since I liked magit in the
--       past, and neogit is closer to that.
return {
  -- {
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "sindrets/diffview.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   keys = {
  --     {
  --       "<leader>gg",
  --       function()
  --         require("neogit").open({ cwd = LazyVim.root.git() })
  --       end,
  --       desc = "Neogit (Root Dir)",
  --     },
  --     {
  --       "<leader>gG",
  --       function()
  --         require("neogit").open({ cwd = vim.fn.getcwd() })
  --       end,
  --       desc = "Neogit (cwd)",
  --     },
  --     {
  --       "<leader>gl",
  --       function()
  --         LazyVim.lazygit({ cwd = LazyVim.root.git() })
  --       end,
  --       desc = "Lazygit (Root Dir)",
  --     },
  --     {
  --       "<leader>gL",
  --       function()
  --         LazyVim.lazygit({ cwd = vim.fn.getcwd() })
  --       end,
  --       desc = "Lazygit (cwd)",
  --     },
  --   },
  --   config = {
  --     -- Hides the hints at the top of the status buffer
  --     disable_hint = true,
  --
  --     kind = "split",
  --     graph_style = "unicode",
  --     signs = {
  --       -- { CLOSED, OPENED }
  --       hunk = { "", "" },
  --       item = { "", "" },
  --       section = { "", "" },
  --     },
  --   },
  -- },
}
