return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          fat_headlines = false,
          fat_headline_upper_string = "▄",
          fat_headline_lower_string = "▀",
          headline_highlights = {},
          -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
          bullets = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    config = function(_, opts)
      -- Markdown background highlight colors based on catppuccin color scheme
      vim.cmd([[highlight Headline1 guibg=#301b21]])
      vim.cmd([[highlight Headline2 guibg=#32231b]])
      vim.cmd([[highlight Headline3 guibg=#312d23]])
      vim.cmd([[highlight Headline4 guibg=#212d20]])
      vim.cmd([[highlight Headline5 guibg=#17272f]])
      vim.cmd([[highlight Headline6 guibg=#36394c]])
      vim.cmd([[highlight CodeBlock guibg=#181825]])
      vim.cmd([[highlight Dash guibg=#45475a gui=bold]])

      require("headlines").setup(opts)
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },
}
