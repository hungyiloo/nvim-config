return {
  "nvim-treesitter/nvim-treesitter",

  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    -- This adds numbat support.
    -- Trying to figure out why this isn't working?
    -- 1. Run :TSInstall numbat
    -- 2. Download the highlights.scm file from the repo linked below
    --    into /nvim-data/lazy/nvim-treesitter/queries/
    ---@diagnostic disable-next-line: inject-field
    parser_config.numbat = {
      install_info = {
        url = "https://github.com/irevoire/tree-sitter-numbat",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "numbat",
    }
    vim.filetype.add({
      extension = {
        nbt = "numbat",
      },
    })
    vim.treesitter.language.register("numbat", "numbat")

    -- HACK: Pinned TSX to this commit because of these issues:
    --       https://github.com/tree-sitter/tree-sitter-javascript/issues/329
    --       also briefly mentioned here: https://github.com/nvim-treesitter/nvim-treesitter/pull/6873
    --       but the nvim-treesitter maintaners forgot to hold off on updating
    --       typescript/tsx, which is depends on the broken updated javascript parser.
    parser_config.tsx.install_info.revision = "4f3eb6655a1cd1a1f87ef10201f8e22886dcd76e"

    -- NOTE: Fix angular treesitter parsing for style bindings including a percent CSS unit extension.
    --       (This is my own fork of the angular treesitter parser)
    --       This coincidentally fixes inconsistent behavior in nvim-ts-autotag in htmlangular templates
    parser_config.angular.install_info.url = "https://github.com/hungyiloo/tree-sitter-angular"
    parser_config.angular.install_info.branch = "fix-style-binding-percent-unit"
    parser_config.angular.install_info.revision = "6cbab4576f6b17b70aca990b1d6fe55bfcdb4669"

    require("nvim-treesitter.configs").setup(opts)
  end,
}
