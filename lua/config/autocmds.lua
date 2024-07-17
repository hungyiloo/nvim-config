-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Ensure angular HTML files are set to an angular-specific filetype
-- Note that this depends on the angular LazyVim extra being enabled.
-- See ../plugins/angular.lua for other related setup
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.component.html", "*.container.html" },
  callback = function()
    -- BUG: This seems to break angularls from attaching to these files
    --      even though it provides better syntax highlighting.
    -- vim.bo.filetype = "angular"

    -- so instead we set it to something more stable for now.
    -- NOTE: Could be a neovim nightly issue, actually!
    -- I've noticed the filetype seems to be set by default to something weird:
    -- "htmlangular" which breaks a lot more than just LSP.
    -- https://github.com/vim/vim/pull/13594#issuecomment-1834465890
    vim.bo.filetype = "html"
  end,
})
