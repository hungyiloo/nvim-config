return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      -- mode = "tabs",
      separator_style = "slant",
      -- always_show_bufferline = true,
    },
  },
  -- HACK: fix startup error. see below issues
  -- https://github.com/LazyVim/LazyVim/issues/6355
  -- https://github.com/LazyVim/LazyVim/pull/6354
  init = function()
    local bufline = require("catppuccin.groups.integrations.bufferline")
    function bufline.get()
      return bufline.get_theme()
    end
  end,
}
