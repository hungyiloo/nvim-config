-- PastelDark from NvChad Base46
local Base46 = {
  base_30 = {
    white = "#b5bcc9",
    darker_black = "#10171e",
    black = "#131a21", --  nvim bg
    black2 = "#1a2128",
    one_bg = "#1e252c",
    one_bg2 = "#2a3138",
    one_bg3 = "#363d44",
    grey = "#363d44",
    grey_fg = "#4e555c",
    grey_fg2 = "#51585f",
    light_grey = "#545b62",
    red = "#ef8891",
    baby_pink = "#fca2aa",
    pink = "#fca2af",
    line = "#272e35", -- for lines like vertsplit
    green = "#9fe8c3",
    vibrant_green = "#9ce5c0",
    blue = "#99aee5",
    nord_blue = "#9aa8cf",
    yellow = "#fbdf90",
    sun = "#fbdf9a",
    purple = "#c2a2e3",
    dark_purple = "#b696d7",
    teal = "#92dbb6",
    orange = "#EDA685",
    cyan = "#b5c3ea",
    statusline_bg = "#181f26",
    lightbg = "#222930",
    pmenu_bg = "#ef8891",
    folder_bg = "#99aee5",
  },
  base_16 = {
    base0A = "#f5d595",
    base04 = "#4f565d",
    base07 = "#b5bcc9",
    base05 = "#ced4df",
    base0E = "#c2a2e3",
    base0D = "#a3b8ef",
    base0C = "#abb9e0",
    base0B = "#9ce5c0",
    base02 = "#31383f",
    base0F = "#e88e9b",
    base03 = "#40474e",
    base08 = "#ef8891",
    base01 = "#2c333a",
    base00 = "#131a21",
    base09 = "#EDA685",
    base06 = "#d3d9e4",
  }
}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = function(_, opts)
      opts.transparent_background = not vim.g.neovide
      opts.snacks = true
      opts.term_colors = true
      opts.color_overrides = {
        -- B.Y.O. colors from PastelDark, but merged into catppuccin to take
        -- advantage of its *excellent* ecosystem support. Basically I'm using
        -- catppuccin, but with a custom color palette. Not all catppuccin
        -- colors are remapped, because catppuccin uses a wider palette than
        -- Base46 does. I find it valuable to retain some of catppuccin's
        -- esoteric colors like flamingo/rosewater/sapphire.
        mocha = {
          -- original variant
          -- crust = "#0c1217", -- darker than darker_black
          -- mantle = PastelDark.base_30.darker_black,
          -- base = PastelDark.base_30.black,

          -- softer variant
          crust = Base46.base_30.darker_black,
          mantle = Base46.base_30.black,
          base = Base46.base_30.black2,

          surface0 = Base46.base_30.one_bg,
          surface1 = Base46.base_30.one_bg2,
          surface2 = Base46.base_30.one_bg3,
          overlay0 = Base46.base_30.grey,
          overlay1 = Base46.base_30.grey_fg,
          overlay2 = Base46.base_30.grey_fg2,
          subtext = Base46.base_16.base07,
          text = Base46.base_16.base05,
          blue = Base46.base_16.blue,
          cyan = Base46.base_30.cyan,
          teal = Base46.base_16.teal,
          yellow = Base46.base_30.sun,
          peach = Base46.base_30.orange,
          red = Base46.base_30.red,
          mauve = Base46.base_30.dark_purple,
          pink = Base46.base_30.baby_pink,
        },
      }
      opts.custom_highlights = function(colors)
        -- custom Windows titlebar color to match the colorscheme
        vim.g.neovide_title_background_color = colors.base

        local my_highlights = {
          RenderMarkdownH1Bg = { bg = "#301b21" },
          RenderMarkdownH2Bg = { bg = "#32231b" },
          RenderMarkdownH3Bg = { bg = "#312d23" },
          RenderMarkdownH4Bg = { bg = "#212d20" },
          RenderMarkdownH5Bg = { bg = "#17272f" },
          RenderMarkdownH6Bg = { bg = "#1f2447" },
          RenderMarkdownCode = { bg = colors.crust },
          RenderMarkdownCodeInline = { bg = colors.crust },

          SnacksDim = { fg = colors.surface2 }, -- dimmed text color

          -- better looking floats
          NormalFloat = { bg = opts.transparent_background and "none" or colors.base },

          -- experimental snacks picker styling
          SnacksPickerBorder = { fg = colors.surface1 },
          SnacksPickerTitle = { fg = colors.crust, bg = colors.teal },
          SnacksPickerBoxTitle = { fg = colors.crust, bg = colors.peach },
          -- SnacksPickerInput = { bg = colors.crust },
          SnacksPickerInputTitle = { fg = colors.crust, bg = colors.mauve },
          SnacksPickerInputBorder = { fg = colors.surface0 },
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
      colorscheme = "catppuccin",
    },
  },
}
