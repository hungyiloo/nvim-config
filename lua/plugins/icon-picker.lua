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
    "folke/snacks.nvim",
    keys = {
      {
        mode = { "n" },
        "<leader>ii",
        function ()
          Snacks.picker('icons', { icon_sources = { "nerd_fonts" }})
        end,
        desc = "Insert Icon",
        noremap = true,
        silent = true,
      },
    }
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        mode = { "n" },
        "<leader>ie",
        function ()
          Snacks.picker('icons', { icon_sources = { "emoji" }})
        end,
        desc = "Insert Emoji",
        noremap = true,
        silent = true,
      },
    },
  }
}
