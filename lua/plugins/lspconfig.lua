return {
  "neovim/nvim-lspconfig",
  opts = function (_, opts)
    -- AutoHotkey LSP setup, which somehow enhances syntax highlighting too?
    require("lspconfig.configs").ahk2 = {
      default_config = {
        cmd = {
          "node",
          vim.fn.expand("D:/dev/vscode-autohotkey2-lsp/server/dist/server.js"),
          "--stdio"
        },
        filetypes = { "ahk", "autohotkey", "ah2" },
        init_options = {
          locale = "en-us",
          InterpreterPath = "C:/Program Files/AutoHotkey/v2/AutoHotkey.exe",
        },
        single_file_support = true,
        flags = { debounce_text_changes = 500 },
      }
    }
    return vim.tbl_deep_extend(
      "force",
      opts,
      {
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
          ahk2 = {}
        },
      }
    )
  end,
}
