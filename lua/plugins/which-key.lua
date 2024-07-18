local M = { disable_which_key = false }

return {
  "folke/which-key.nvim",
  opts = {
    preset = "modern",
    filter = function()
      return not M.disable_which_key
    end,
  },
  config = function(_, opts)
    require("which-key").setup(opts)

    -- HACK: I raised a bug in which-key about this, but it only got partially
    --       fixed. Which-key interferes with macro recording A LOT.
    --       (see https://github.com/folke/which-key.nvim/issues/702)
    --       My hack is to abuse the filter option in which-key to reject all
    --       which-key triggers whenever recording macros, based on a locally
    --       set flag within this file.
    vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
      callback = function(ev)
        if ev.event == "RecordingEnter" then
          M.disable_which_key = true
        else
          M.disable_which_key = false
          require("which-key/buf").check()
        end
      end,
    })
  end,
}