return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = function(_, opts)
      opts.transparent_background = not vim.g.neovide
      opts.snacks = true
      opts.term_colors = true
      opts.custom_highlights = function(colors)
        local my_highlights = {
          -- RenderMarkdownCode = { bg = colors.crust },
          -- RenderMarkdownCodeInline = { bg = colors.crust },

          SnacksDim = { fg = colors.surface2 }, -- dimmed text color

          -- better looking floats
          -- NormalFloat = { bg = opts.transparent_background and "none" or colors.base },

          -- experimental snacks picker styling
          -- SnacksPickerBorder = { fg = colors.surface1 },
          -- SnacksPickerTitle = { fg = colors.crust, bg = colors.teal },
          -- SnacksPickerBoxTitle = { fg = colors.crust, bg = colors.peach },
          -- SnacksPickerInput = { bg = colors.crust },
          -- SnacksPickerInputTitle = { fg = colors.crust, bg = colors.mauve },
          -- SnacksPickerInputBorder = { fg = colors.surface0 },
        }

        -- No cursor line if we're running in terminal with transparent_mode
        if not vim.g.neovide and opts.transparent_background then
          my_highlights.CursorLine = { bg = "none" }
        end

        return my_highlights
      end
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
