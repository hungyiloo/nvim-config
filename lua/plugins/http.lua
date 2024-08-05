return {
  -- This plugin doesn't really fit my workflow.
  -- Issues include:
  --   - fixed environment variables on neovim startup; cannot be changed without restarting neovim
  --   - reliance on ftplugin for shortcuts, which is super flaky
  --   - doesn't support named requests (i.e. anything after ### separators will break it)
  --   - runs on neovim startup and sets up all its stuff, whether I'm in HTTP files or not
  -- {
  --   "mistweaverco/kulala.nvim",
  --   config = true,
  -- },
  -- But I'm keeping the below treesitter setup for http files, just for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({
        extension = {
          http = "http",
        },
      })
      vim.list_extend(opts.ensure_installed, { "http" })
    end,
  },
}
