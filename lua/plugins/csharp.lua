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
            -- WARNING: This keymap function actually overrides *all* goto
            --          definition operations, not just in the csharp project. Special
            --          handling is needed to fall back to normal lsp definitions when
            --          not in a csharp_ls buffer.
            function()
              local bufferAttachedClients = vim.lsp.get_clients({ bufnr = 0 })
              local hasCSharpLS = false
              for _, client in pairs(bufferAttachedClients) do
                if client.name == "csharp_ls" then
                  hasCSharpLS = true
                  break
                end
              end
              -- only use the special csharp_ls goto-definitions if we are in its context
              if hasCSharpLS then
                require("csharpls_extended").lsp_definitions()
              else
                vim.lsp.buf.definition()
              end
            end,
            desc = "Goto Definition",
          },
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "cs",
        callback = function()
          vim.cmd([[set shiftwidth=4]])
          vim.cmd([[set tabstop=4]])
          vim.cmd([[set nocindent]])
          vim.cmd([[set autoindent]])
          vim.cmd([[set smartindent]])
          vim.cmd([[set indentexpr=]])
        end
      })
    end
  },
}
