return {
  { import = "lazyvim.plugins.extras.editor.dial" },
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")
      -- Add yyyy-mm-dd dial support to markdown files
      table.insert(opts.groups.markdown, augend.date.alias["%Y-%m-%d"])
    end,
  },
}
