-- PastelDark from NvChad Base46
local PastelDark = {
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
      opts.color_overrides = {
        mocha = {
          crust = PastelDark.base_30.darker_black,
          mantle = PastelDark.base_30.black,
          base = PastelDark.base_30.black2,
          surface0 = PastelDark.base_30.one_bg,
          surface1 = PastelDark.base_30.one_bg2,
          surface2 = PastelDark.base_30.one_bg3,
          overlay0 = PastelDark.base_30.grey,
          overlay1 = PastelDark.base_30.grey_fg,
          overlay2 = PastelDark.base_30.grey_fg2,
          subtext = PastelDark.base_16.base07,
          text = PastelDark.base_16.base05,
          blue = PastelDark.base_16.blue,
          cyan = PastelDark.base_30.cyan,
          teal = PastelDark.base_16.base0B,
          green = PastelDark.base_30.vibrant_green,
          yellow = PastelDark.base_30.sun,
          peach = PastelDark.base_30.orange,
          red = PastelDark.base_30.red,
          mauve = PastelDark.base_30.dark_purple,
          pink = PastelDark.base_30.pink,
          flamingo = PastelDark.base_16.base0F,
        }
      }
      opts.custom_highlights = function(colors)
        return {
          -- HACK: Recent updates seem to make visual selections and LSP
          --       reference highlights indistinguishable, so this override
          --       fixes it, temporarily. Maybe try reverting this change
          --       in the future if a fix is put in upstream?
          LspReferenceText = { bg = colors.surface0 }, -- originally surface1
          LspReferenceRead = { bg = colors.surface0 },
          LspReferenceWrite = { bg = colors.surface0 },

          -- custom highlights for markdown backgrounds
          RenderMarkdownH1Bg = { bg = "#301b21" },
          RenderMarkdownH2Bg = { bg = "#32231b" },
          RenderMarkdownH3Bg = { bg = "#312d23" },
          RenderMarkdownH4Bg = { bg = "#212d20" },
          RenderMarkdownH5Bg = { bg = "#17272f" },
          RenderMarkdownH6Bg = { bg = "#1f2447" },
          RenderMarkdownCode = { bg = "#181926" },
          RenderMarkdownCodeInline = { bg = "#181926" },

          -- custom highlights for snacks.indent and snacks.dim
          SnacksIndent = { fg = "#272839"},
          SnacksDim = { fg = colors.surface2 },

          -- custom highlights for fzf-lua
          FzfLuaDirPart = { fg = colors.surface2 }
        }
      end
      opts.transparent_background = not vim.g.neovide
      opts.snacks = true
      opts.term_colors = true
      opts.fzf = true
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   opts = { style = "moon" },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

