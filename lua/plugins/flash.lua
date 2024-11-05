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
}
