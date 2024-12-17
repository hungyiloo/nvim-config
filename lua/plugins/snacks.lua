return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>.",  false },
    { "<leader>S",  false},
    { "<leader>bs",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>bS",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
  },
}
