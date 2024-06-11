return {
  -- { "shaunsingh/nord.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      custom_highlights = function(colors)
        return {
          -- HACK: Recent updates seem to make visual selections and LSP
          --       reference highlights indistinguishable, so this override
          --       fixes it, temporarily. Maybe try reverting this change
          --       in the future if a fix is put in upstream?
          LspReferenceText = { bg = colors.surface0 }, -- originally surface1
          LspReferenceRead = { bg = colors.surface0 },
          LspReferenceWrite = { bg = colors.surface0 },
        }
      end,
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   opts = { style = "moon" },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
