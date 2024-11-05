return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      html = {
        filetypes = { "html", "templ", "htmlangular" },
      },
      denols = {
        filetypes = { "typescript", "typescriptreact" },
        root_dir = function(...)
          return require("lspconfig").util.root_pattern("deno.jsonc", "deno.json")(...)
        end,
      },
      vtsls = {
        root_dir = require("lspconfig").util.root_pattern("package.json"),
      },
    },
  },
}
