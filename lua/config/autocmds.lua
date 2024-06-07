-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- On Windows, ensure the drive letter in CWD is always set to its capital form
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    if vim.fn.has("win32") > 0 then
      local event = vim.api.nvim_get_vvar("event")
      local dir = event.cwd
      local drive_letter = dir:sub(1, 1)
      if string.match(drive_letter, "%l") then
        local set_dir = vim.api.nvim_set_current_dir
        if event.scope == "tabpage" then
          set_dir = function(d)
            vim.cmd("tcd " .. d)
          end
        elseif event.scope == "window" then
          set_dir = function(d)
            vim.cmd("lcd " .. d)
          end
        end
        dir = drive_letter:upper() .. dir:sub(2)
        set_dir(event.cwd ~= "~" and "/" or "~")
        set_dir(dir)
      end
    end
  end,
})
