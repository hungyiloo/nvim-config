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
}
