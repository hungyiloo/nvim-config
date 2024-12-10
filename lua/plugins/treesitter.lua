return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
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
    vim.list_extend(opts.ensure_installed, { "numbat" })
  end,
}
