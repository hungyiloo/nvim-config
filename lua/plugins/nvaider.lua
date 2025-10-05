return {
  -- "hungyiloo/nvaider.nvim",
  "nvaider.nvim",
  dev = true,
  cmd = "Aider",
  opts = {
    cmd = "aider",
    profiles = {
      ['qwen3-coder'] = { "--model", "openrouter/qwen/qwen3-coder", "--cache-prompts", "--watch-files", "--edit-format=diff", "--editor-edit-format=diff" },
      ['qwen3-coder:free'] = { "--model", "openrouter/qwen/qwen3-coder:free", "--cache-prompts", "--watch-files", "--edit-format=diff", "--editor-edit-format=diff" },
      ['work-o3'] = { "--model", "azure/o3", "--editor-model", "azure/gpt-4.1", "--reasoning-effort", "high", "--watch-files", "--no-auto-commits" },
      ['work-gpt-5'] = { "--model", "azure/gpt-5", "--editor-model", "azure/gpt-5", "--reasoning-effort", "high", "--watch-files", "--no-auto-commits" },
    },
    window = {
      position = "right", -- "top", "bottom", "left", "right"
      width = 0.35, -- used for left/right position
      height = 0.2 -- used for top/bottom position
    },
  },
  keys = {
    -- Essential mappings
    { "<leader>a<space>", ":Aider toggle<cr>", desc = "Toggle aider window" },
    { "<leader>a.", ":Aider send<cr>", desc = "Send message to aider" },
    { "<leader>a?", ":Aider ask<cr>", desc = "Ask aider a question" },

    -- File management
    { "<leader>aa", ":Aider add<cr>", desc = "Add current file to aider" },
    { "<leader>ar", ":Aider read<cr>", desc = "Add file as read-only" },
    { "<leader>ad", ":Aider drop<cr>", desc = "Drop current file" },
    { "<leader>aD", ":Aider drop_all<cr>", desc = "Drop all files" },

    -- Instance management
    { "<leader>a<cr>", ":Aider start<cr>", desc = "Start/restart aider" },
    { "<leader>aq", ":Aider stop<cr>", desc = "Stop aider" },
    { "<leader>aQ", ":Aider stop_all<cr>", desc = "Stop all aider instances" },
    { "<leader>af", ":Aider focus<cr>", desc = "Focus aider terminal" },

    -- Advanced
    { "<leader>a>", ":Aider architect<cr>", desc = "Architect with aider" },
    { "<leader>ac", ":Aider commit<cr>", desc = "Commit with aider" },
    { "<leader>aR", ":Aider reset<cr>", desc = "Reset aider session" },
    { "<leader>ax", ":Aider abort<cr>", desc = "Abort current operation" },
    { "<leader>a!", ":Aider rewrite_args<cr>", desc = "Change aider arguments" },

    -- Visual mode mappings
    { mode = "x", "<leader>a.", function() require("nvaider").send() end, desc = "Send selection to aider" },
    { mode = "x", "<leader>a?", function() require("nvaider").ask() end, desc = "Ask about selection" },
    { mode = "x", "<leader>a>", function() require("nvaider").architect() end, desc = "Architect with aider" },
  }
}
