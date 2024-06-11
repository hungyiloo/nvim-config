return {
  -- NOTE: This just doesn't work well for angular/react development.
  --       I discovered that installing the html-ls via mason provides better
  --       tag renaming.
  --
  -- "windwp/nvim-ts-autotag",
  -- config = function()
  --   require("nvim-ts-autotag").setup({
  --     did_setup = false,
  --     opts = {
  --       -- Defaults
  --       enable_close = true, -- Auto close tags
  --       enable_rename = true, -- Auto rename pairs of tags
  --       enable_close_on_slash = false, -- Auto close on trailing </
  --     },
  --   })
  -- end,
}
