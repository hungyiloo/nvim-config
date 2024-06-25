return {
  { import = "lazyvim.plugins.extras.lang.omnisharp" },
  --
  -- replace omnisharp with csharp-ls
  { "Hoffs/omnisharp-extended-lsp.nvim", enabled = false },
  { "Decodetalkers/csharpls-extended-lsp.nvim", lazy = true },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "csharp-language-server" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function (_ , opts)
      -- ensure omnisharp is fully disabled
      opts.servers.omnisharp = nil

      -- set up csharpls-extended-lsp instead
      opts.servers.csharp_ls = {
        handlers = {
          ["textDocument/definition"] = function(...)
            return require("csharpls_extended").handler(...)
          end,
        },
        keys = {
          {
            "gd",
            function()
              require("csharpls_extended").lsp_definitions()
            end,
            desc = "Goto Definition",
          },
        },
      }
    end
  },
}
