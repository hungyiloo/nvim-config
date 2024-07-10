-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here


-- Ensure angular HTML files are set to an angular-specific filetype
-- Note that this depends on the angular LazyVim extra being enabled.
-- See ../plugins/angular.lua for other related setup
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.component.html", "*.container.html" },
  callback = function()
    vim.bo.filetype = "angular"
  end,
})
