return {
  { import = "lazyvim.plugins.extras.lang.angular" },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft["angular"] = { "prettier" }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      --
      -- NOTE: Fix angular treesitter parsing for style bindings including a percent CSS unit extension.
      --       (This is my own fork of the angular treesitter parser)
      --       This coincidentally fixes inconsistent behavior in nvim-ts-autotag in htmlangular templates
      parser_config.angular.install_info.url = "https://github.com/hungyiloo/tree-sitter-angular"
      parser_config.angular.install_info.branch = "fix-style-binding-percent-unit"
      parser_config.angular.install_info.revision = "cac3997122a19ad5dc95be021070a4bf88fb7238"
    end
  }
}
