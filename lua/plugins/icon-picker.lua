return {
  {
    "chrisbra/unicode.vim",
    keys = {
      {
        mode = { "n" },
        "<leader>iu",
        function ()
          local unicode_data_file = vim.fn.stdpath("data") .. "/site/unicode/UnicodeData.txt"
          local unicode_data = {}
          for line in io.lines(unicode_data_file) do
            local parts = string.gmatch(line, "([^;]+)")
            local code = parts()
            local name = parts()
            if name and name ~= "<control>" then
              table.insert(unicode_data, { glyph = vim.fn.nr2char(tonumber(code, 16)), name = name })
            end
          end
          vim.ui.select(
            unicode_data,
            {
              prompt = "Select a unicode character",
              format_item = function (item)
                return "\t" .. item.glyph .. "\t" .. item.name
              end
            },
            function (choice)
              if choice then
                vim.cmd("normal i" .. choice.glyph)
              end
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
    cmd = "Emoji",
    keys = {
      {
        mode = { "n" },
        "<leader>ie",
        "<cmd>Emoji insert<cr>",
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
