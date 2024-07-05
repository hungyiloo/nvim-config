return {
  { import = "lazyvim.plugins.extras.editor.dial" },
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")
      -- Add "yyyy-mm-dd" dial support to markdown files
      table.insert(opts.groups.markdown, augend.date.alias["%Y-%m-%d"])

      -- Add short day name dial support to markdown files
      table.insert(opts.groups.markdown, augend.date.new{
        pattern = "%a",
        default_kind = "day",
        -- if true, it does not match dates which does not exist, such as 2022/05/32
        only_valid = true,
        -- if true, it only matches dates with word boundary
        word = true,
      })

      -- Add "yyyy-mm-dd dayname" dial support to markdown files
      table.insert(opts.groups.markdown, augend.date.new{
        pattern = "%Y-%m-%d %a",
        default_kind = "day",
        -- if true, it does not match dates which does not exist, such as 2022/05/32
        only_valid = true,
        -- if true, it only matches dates with word boundary
        word = true,
      })
    end,
  },
}
