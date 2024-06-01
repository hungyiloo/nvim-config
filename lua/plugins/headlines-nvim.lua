return {
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        fat_headlines = false,
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
      },
    },
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
}
