return {
  "nvim-treesitter/nvim-treesitter",
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)

    -- NOTE: This adds numbat support.
    --       Trying to figure out why this isn't working?
    --       1. Run :TSInstall numbat
    --       2. Download the highlights.scm file from the repo linked below
    --          into /nvim-data/lazy/nvim-treesitter/queries/
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


    -- Ensure angular HTML files are set to an angular-specific filetype
    -- Note that this depends on the angular LazyVim extra being enabled.
    -- TODO: Refactor this autocmd and the angular extra setup into one file
    --       for clarity
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      pattern = { "*.component.html", "*.container.html" },
      callback = function()
        vim.bo.filetype = "angular"
      end,
    })
  end,
}
