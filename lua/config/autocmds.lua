-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- disable cursor animations in terminal buffers, as they flicker a lot
vim.api.nvim_create_autocmd({"BufEnter", "WinNew"}, {
  callback = function()
    vim.schedule(function ()
      if vim.bo.buftype ~= "terminal" then
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

-- Create git conflict handling keymaps at the appropriate time
vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    if not vim.b.__git_conflicts_mode then
      local git_conflict = require('git-conflict')
      local conflict_count = git_conflict.conflict_count(0)
      vim.notify(
        ' ' .. conflict_count .. ' conflict' .. (conflict_count == 1 and '' or 's') .. ' detected. Check <localleader> mappings',
        vim.log.levels.WARN
      )
      vim.keymap.set('n', '<localleader>o', '<Plug>(git-conflict-ours)', { desc = "Choose Ours" })
      vim.keymap.set('n', '<localleader>t', '<Plug>(git-conflict-theirs)', { desc = "Choose Theirs" })
      vim.keymap.set('n', '<localleader>b', '<Plug>(git-conflict-both)', { desc = "Choose Both" })
      vim.keymap.set('n', '<localleader>0', '<Plug>(git-conflict-none)', { desc = "Choose None" })
      vim.keymap.set('n', '<localleader>[', '<Plug>(git-conflict-prev-conflict)', { desc = "Previous Conflict" })
      vim.keymap.set('n', '<localleader>]', '<Plug>(git-conflict-next-conflict)', { desc = "Next Conflict" })
      git_conflict.find_next('ours')

      -- Prevent multiple runs of this setup logic
      vim.b.__git_conflicts_mode = 1
    end
  end
})
