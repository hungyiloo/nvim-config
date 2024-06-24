return {
  "FredeEB/tardis.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  opts = {
    keymap = {
      ["next"] = '<C-p>',               -- next entry in log (older)
      ["prev"] = '<C-n>',               -- previous entry in log (newer)
      ["quit"] = 'q',                   -- quit all
      ["revision_message"] = '<C-S-m>', -- show revision message for current revision
      ["commit"] = '<C-g>',             -- replace contents of origin buffer with contents of tardis buffer
    },
    initial_revisions = 10,             -- initial revisions to create buffers for
    max_revisions = 256,                -- max number of revisions to load
  },
  keys = {
    {
      "<leader>gT",
      ":Tardis git<cr>",
      silent = true,
      desc = "Git Time Machine",
      mode = { "n", "x" },
    },
  },
}
