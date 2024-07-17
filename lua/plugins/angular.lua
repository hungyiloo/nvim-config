return {
  { import = "lazyvim.plugins.extras.lang.angular" },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft["angular"] = { "prettier" }
    end,
  },
}
