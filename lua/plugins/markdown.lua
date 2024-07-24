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
    config = function(_, opts)
      -- Markdown background highlight colors based on catppuccin color scheme
      vim.cmd([[highlight RenderMarkdownH1Bg guibg=#301b21]])
      vim.cmd([[highlight RenderMarkdownH2Bg guibg=#32231b]])
      vim.cmd([[highlight RenderMarkdownH3Bg guibg=#312d23]])
      vim.cmd([[highlight RenderMarkdownH4Bg guibg=#212d20]])
      vim.cmd([[highlight RenderMarkdownH5Bg guibg=#17272f]])
      vim.cmd([[highlight RenderMarkdownH6Bg guibg=#36394c]])
      vim.cmd([[highlight RenderMarkdownCode guibg=#181926]])
      vim.cmd([[highlight RenderMarkdownCodeInline guibg=#181926]])

      require("render-markdown").setup(opts)
    end,
  },
}
