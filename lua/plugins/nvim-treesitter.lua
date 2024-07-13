return {
  "nvim-treesitter/nvim-treesitter",
  --
  -- NOTE: Pinned to this commit because of these issues:
  -- https://github.com/tree-sitter/tree-sitter-javascript/issues/329
  -- also briefly mentioned here: https://github.com/nvim-treesitter/nvim-treesitter/pull/6873
  -- but the nvim-treesitter maintaners forgot to hold off on updating
  -- typescript/tsx, which is related to the javascript parser.
  commit = "53c79ddc28b0df3263d629f5e20c9283b05841ca",

  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)

    -- This adds numbat support.
    -- Trying to figure out why this isn't working?
    -- 1. Run :TSInstall numbat
    -- 2. Download the highlights.scm file from the repo linked below
    --    into /nvim-data/lazy/nvim-treesitter/queries/
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
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
  end,
}
