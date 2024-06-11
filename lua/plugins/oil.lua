return {
  "stevearc/oil.nvim",
  -- FIX: There's a typo in the commit after this one that causes an error.
  --      (vim.has https://github.com/stevearc/oil.nvim/commit/a62ec258d1c99d354b256a2ec39733ad9109d808#diff-a25f90b75d18d6d2a45ff8a89a8de68c41444c327c690f1e42f3ddc776524498R80)
  --      When this is fixed, we can continue with updates
  commit = "96368e13e9b1aaacc570e4825b8787307f0d05e1",
  lazy = true,
  cmd = "Oil",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
