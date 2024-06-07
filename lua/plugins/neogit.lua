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
          require("neogit").open()
        end,
        desc = "Neogit (cwd)",
      },
      {
        "<leader>gG",
        function()
          require("neogit").open({ cwd = LazyVim.root.git() })
        end,
        desc = "Neogit (Root Dir)",
      },
    },
    config = true,
  },
  {
    "williamboman/mason.nvim",
    init = function()
      -- delete lazygit keymap for file history
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimKeymaps",
        once = true,
        callback = function()
          pcall(vim.keymap.del, "n", "<leader>gf")
          pcall(vim.keymap.del, "n", "<leader>gl")
        end,
      })
    end,
  },
}
