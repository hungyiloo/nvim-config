return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      -- NOTE: Fix angular treesitter parsing for style bindings including a percent CSS unit extension.
      --       (This is my own fork of the angular treesitter parser)
      --       This coincidentally fixes inconsistent behavior in nvim-ts-autotag in htmlangular templates
      vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
        callback = function()
          require("nvim-treesitter.parsers").angular = {
            install_info = {
              url = "https://github.com/hungyiloo/tree-sitter-angular",
              branch = "custom-fixes",
              revision = "bad7ef343b3063792ed037f63e04a84319b9f5b8",
              files = { "src/parser.c" },  -- Explicit files (optional but robust)
            },
            tier = 4,
          }
        end
      })
    end,
  }
}
