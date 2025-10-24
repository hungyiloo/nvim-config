return {
  {
    "nvim-mini/mini.surround",
    opts = {
      n_lines = 100,
      mappings = {
        add = "S", -- Add surrounding in Normal and Visual modes
        delete = "ds", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "cs", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
}
