-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Add a familiar "save file" shortcut
vim.keymap.set("n", "<leader>fs", ":w<CR>", { noremap = true, silent = true, desc = "Save File" })

-- Add a familiar command running shortcut
vim.keymap.set("n", "<leader>;", ":", { noremap = true, silent = false, desc = "Command" })

-- Remap 'zF' to update folds (default function of 'zx')
-- and remap 'zx' to delete the buffer
vim.keymap.set("n", "zF", "zx", { noremap = true, silent = true, desc = "Update folds" })
vim.keymap.set("n", "zx", LazyVim.ui.bufremove, { noremap = true, silent = true, desc = "Delete Buffer" })

-- Tools for adding blank lines above/below cursor without changing position
vim.keymap.set("n", "]<space>", "m`o<esc>``", { noremap = true, silent = true, desc = "Insert blank line below" })
vim.keymap.set("n", "[<space>", "m`O<esc>``", { noremap = true, silent = true, desc = "Insert blank line above" })

-- Allow F11 for fullscreen toggle
vim.keymap.set(
  "n",
  "<F11>",
  ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>",
  { noremap = true, silent = true, desc = "Toggle fullscreen" }
)

-- Emacs-style basic macros
vim.keymap.set("n", "<f3>", "qq<esc>", { noremap = true, silent = true, desc = "Record macro" })
vim.keymap.set("n", "<f4>", "@q", { noremap = true, silent = true, desc = "Play macro" })

-- Evaluate/execute lua
vim.keymap.set("n", "<leader>r", ":luafile %<cr>", { noremap = true, silent = true, desc = "Eval Buffer as Lua" })
vim.keymap.set("v", "<leader>r", ":lua<cr>", { noremap = true, silent = true, desc = "Eval Selection as Lua" })

-- Trigger autocompletion
-- stylua: ignore
vim.keymap.set("i", "<C-.>", function() require("cmp").complete() end, { noremap = true, silent = true, desc = "Autocomplete" })
