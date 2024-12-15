return {
  {
    "chrisbra/unicode.vim",
    keys = {
      {
        mode = { "n" },
        "<leader>iu",
        function ()
          vim.ui.input(
            { prompt = "Filter unicode characters" },
            function (query)
              if not query then return end
              vim.ui.select(
                vim.fn['unicode#FindUnicodeBy'](query),
                {
                  prompt = "Select a unicode character",
                  format_item = function (item)
                    return item.name .. ": " .. item.glyph
                  end
                },
                function (choice)
                  if choice then
                    vim.cmd("normal i" .. choice.glyph)
                  end
                end
              )
            end
          )
        end,
        desc = "Insert Unicode",
        noremap = true,
        silent = true,
      },
    }
  },
  {
    "2kabhishek/nerdy.nvim",
    keys = {
      {
        mode = { "n" },
        "<leader>ii",
        "<cmd>Nerdy<cr>",
        desc = "Insert Icon",
        noremap = true,
        silent = true,
      },
    }
  },
  {
    "allaman/emoji.nvim",
    cmd = "EmojiInsert",
    keys = {
      {
        mode = { "n" },
        "<leader>ie",
        "<cmd>EmojiInsert<cr>",
        desc = "Insert Emoji",
        noremap = true,
        silent = true,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true
  }
}
