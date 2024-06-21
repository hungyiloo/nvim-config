return {
  "ziontee113/icon-picker.nvim",
  keys = {
    { mode = { "n" }, "<leader>ii", "<cmd>IconPickerNormal<cr>", desc = "Insert Icon", noremap = true, silent = true },
    {
      mode = { "n" },
      "<leader>iu",
      "<cmd>IconPickerNormal symbols<cr>",
      desc = "Insert Icon",
      noremap = true,
      silent = true,
    },
    {
      mode = { "n" },
      "<leader>ie",
      "<cmd>IconPickerNormal emoji<cr>",
      desc = "Insert Icon",
      noremap = true,
      silent = true,
    },
    { mode = { "n" }, "<leader>iI", "<cmd>IconPickerYank<cr>", desc = "Yank Icon", noremap = true, silent = true }, --> Yank the selected icon into register
    {
      mode = { "i" },
      "<C-x><C-x>i",
      "<cmd>IconPickerInsert<cr>",
      desc = "Insert Icon",
      noremap = true,
      silent = true,
    },
  },
  opts = {
    disable_legacy_commands = true,
  },
  config = true,
}
