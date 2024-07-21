return {
  "folke/flash.nvim",
  -- stylua: ignore
  keys = {
    -- Disable most of LazyVim's default "s" related keymaps for flash because they
    -- conflict with my muscle memory for mini.surround (which I use a lot more)
    { "s", mode = { "x", "o" }, false },
    { "S", mode = { "n", "o", "x" }, false },

    -- Instead, replace them , and ; for easy access.
    -- I'm hoping that putting them on an easy to reach keymap will encourage
    -- me to use it more, as I currently don't.
    --
    -- What happens to the default function of , and ;? The current f and t
    -- motions can be intuitively repeated by pressing f/F or t/T, which more
    -- efficiently uses those keys, thus freeing up , and ;
    { ",", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { ";", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },

    -- These are the same as the defaults
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = "c", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
