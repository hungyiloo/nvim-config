-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- disable cursor animations in terminal buffers, as they flicker a lot
-- disable cursor animations in fzf windows, as they flicker a lot
vim.api.nvim_create_autocmd({"BufEnter", "WinNew"}, {
  callback = function()
    vim.schedule(function ()
      if vim.bo.buftype ~= "terminal" and vim.bo.filetype ~= "fzf" then
        vim.g.neovide_cursor_animation_length = 0.05
        vim.g.neovide_cursor_vfx_mode = "railgun"
      else
        vim.g.neovide_cursor_animation_length = 0
        vim.g.neovide_cursor_vfx_mode  = ""
      end
    end)
  end,
  group = vim.api.nvim_create_augroup("MyCursorAnimations", { clear = true }),
})
