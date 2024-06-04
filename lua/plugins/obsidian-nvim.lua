local vaultGlobPath = string.gsub(vim.fn.expand("~"), "\\", "/") .. "/obsidian/**.md"

return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- only to load obsidian.nvim for markdown files in my vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre " .. vaultGlobPath,
    "BufNewFile " .. vaultGlobPath,
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/obsidian/notes",
      },
      {
        name = "work",
        path = "~/obsidian/work",
      },
    },
  },
}
