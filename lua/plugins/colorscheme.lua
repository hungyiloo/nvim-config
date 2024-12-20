return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = function(_, opts)
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
