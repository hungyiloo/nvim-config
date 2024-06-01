-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- add some fun tracking effects to cursor movement
vim.g.neovide_cursor_vfx_mode = "railgun"

-- more comfy spacing between lines
vim.opt.linespace = 2

-- shadows for floating windows sometimes make overlays look janky
vim.g.neovide_floating_shadow = false

-- these settings apparently emulate alacritty's font rendering better;
-- it does seem to make the text thinner and clearer for me,
-- even taking into account font weight changes
vim.g.neovide_text_gamma = 0.9
vim.g.neovide_text_contrast = 0.1
