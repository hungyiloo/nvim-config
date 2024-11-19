-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- add some fun tracking effects to cursor movement
vim.g.neovide_cursor_vfx_mode = "railgun"

-- more comfy spacing between lines
vim.opt.linespace = 2

-- shadows for floating windows sometimes make overlays look janky
-- vim.g.neovide_floating_shadow = false

-- adjust font rendering, especially important for low DPI displays
vim.g.neovide_text_gamma = 1.2
vim.g.neovide_text_contrast = 0.5
-- Try these for high DPI displays
-- vim.g.neovide_text_gamma = 0.6
-- vim.g.neovide_text_contrast = 0.1
-- and these for low DPI displays
-- vim.g.neovide_text_gamma = 1.2
-- vim.g.neovide_text_contrast = 0.5

-- show a more useful window title
vim.o.title = true
vim.o.titlestring = '%{empty(expand("%:t")) ? "Neovim" : expand("%:t") . " - " . expand("%:~:h") . " - Neovim"}'

-- disable autoformatting on save on startup
-- (but this can be enabled by <leader>uf)
vim.g.autoformat = false

-- always use pwsh as the shell
vim.opt.shell = 'pwsh'

-- NOTE: currently trying out default LazyVim pwsh config instead of the below
-- 
-- using pwsh needs a shell command flag set
-- https://github.com/neovim/neovim/issues/13893
-- vim.opt.shellcmdflag = '-nologo -noprofile -ExecutionPolicy RemoteSigned -command'
-- vim.opt.shellxquote = ''
