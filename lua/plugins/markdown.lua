return {
  { import = "lazyvim.plugins.extras.lang.markdown" },

  -- Disable markdown linting because it lints so much, and do I really need
  -- linting for long lines and extra line breaks in my markdown files?!
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.markdown = {}
    end,
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    opts = function(_, opts)
      opts.code.border = "thick" -- thin borders don't look great with my environment/font
    end,
  },
}
