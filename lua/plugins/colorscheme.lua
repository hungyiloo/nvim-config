return {
  { "shaunsingh/nord.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = { style = "moon" },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
