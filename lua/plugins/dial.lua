return {
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")

      -- Add "yyyy-mm-dd" dial support
      local isoDateStamps = augend.date.alias["%Y-%m-%d"]
      table.insert(opts.groups.default, isoDateStamps)
      table.insert(opts.groups.markdown, isoDateStamps)

      -- Add english *short* day name dial support
      -- This is necessary for short day names not connected to an actual date.
      local shortDayNames = augend.constant.new{
        elements = {
          "Mon",
          "Tue",
          "Wed",
          "Thu",
          "Fri",
          "Sat",
          "Sun",
        },
        word = true,
        cyclic = true,
      }
      table.insert(opts.groups.default, shortDayNames)
      table.insert(opts.groups.markdown, shortDayNames)

      -- Add "yyyy-mm-dd dayname" dial support
      local dateWithShortDay = augend.date.new{
        pattern = "%Y-%m-%d %a",
        default_kind = "day",
        -- if true, it does not match dates which does not exist, such as 2022/05/32
        only_valid = true,
        -- if true, it only matches dates with word boundary
        word = true,
      }
      table.insert(opts.groups.default, dateWithShortDay)
      table.insert(opts.groups.markdown, dateWithShortDay)
    end,
  },
}
