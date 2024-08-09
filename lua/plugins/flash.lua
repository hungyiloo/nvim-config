return {
  "folke/flash.nvim",
  -- stylua: ignore
  keys = {
    -- Disable some of LazyVim's default "s" related keymaps for flash because they
    -- conflict with my muscle memory for mini.surround (which I use a lot more)
    { "S", mode = { "n", "o", "x" }, false },
    { "g//", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
    { "g/t", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "g/s", mode = { "n", "o", "x" }, function() require("flash").treesitter_search() end, desc = "Search Treesitter" },
    { "<c-s>", mode = "c", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  opts = {
    modes = {
      char = {
        char_actions = function(motion)
          return {
            [";"] = "next", -- set to `right` to always go right
            [","] = "prev", -- set to `left` to always go left
            -- commenting the below two lines disables clever-f style
            [motion:lower()] = nil,
            [motion:upper()] = nil,
            -- WARNING: special care still needs to be taken when recording
            -- macros wish flash char mode, as clever-f behavior seems to remain.
          }
        end,
      }
    }
  }
}
