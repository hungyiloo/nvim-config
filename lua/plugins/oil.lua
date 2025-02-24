return {
  "stevearc/oil.nvim",
  -- Can't be lazy if we want it to replace netrw by default at startup
  -- lazy = false,
  cmd = "Oil",
  opts = {
    keymaps = {
      -- I use <C-p> to go up one line (muscle memory from emacs)
      -- So use <M-p> to toggle the preview instead, which is consistent with snacks pickers
      ["<C-p>"] = false,
      ["<M-p>"] = "actions.preview",

      -- Allow "q" for quit but also use <F3> as a stand in for "q" macro recording
      -- in the odd case that it's necessary
      ["<F3>"] = { function () vim.api.nvim_feedkeys("q", "n", true) end, mode = "n" },
      ["q"] = { "actions.close", mode = "n" },
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>.",
      mode = "n",
      function ()
        local current_file_name = vim.fn.expand('%:p:t')
        require("oil").open_float(nil, nil, function ()
          -- Put cursor on the current file
          vim.fn.search(current_file_name)
        end)
      end,
      desc = "Directory Editor",
      silent = true,
      noremap = true,
    },
  },
}
