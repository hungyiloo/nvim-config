return {
  "gbprod/substitute.nvim",
  opts = {},
  -- stylua: ignore
  keys = {
    { "gx", mode = { "n" }, function() require("substitute.exchange").operator() end, desc = "Exchange" },
    { "gxx", mode = { "n" }, function() require("substitute.exchange").line() end, desc = "Exchange Line" },
    { "gx", mode = { "v" }, function() require("substitute.exchange").visual() end, desc = "Exchange" },
    { "gx<esc>", mode = { "n" }, function() require("substitute.exchange").cancel() end, desc = "Cancel Exchange" },
  },
}
