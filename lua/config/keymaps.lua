-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

-- Add a familiar "save file" shortcut
vim.keymap.set("n", "<leader>fs", ":w<CR>", { noremap = true, silent = true, desc = "Save File" })

-- Add a familiar command running shortcut
vim.keymap.set("n", "<leader>;", ":", { noremap = true, silent = false, desc = "Command" })

-- NOTE: Here, I used to remap "zx" to delete the buffer, but this interferes
-- with grug-far (as of 2024-08-03) So I decided to give up my muscle memory
-- and do without this remapping. It's better for my pinky, anyway!

-- A shortcut to close all buffers and "reset" the visual layout
vim.keymap.set("n", "<leader>bx", function()
  vim.cmd("%bd")
  vim.cmd("Dashboard")
  vim.cmd("silent only")
end, { noremap = true, silent = true, desc = "Close all buffers" })

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
vim.keymap.set("v", "<f4>", "<cmd>normal Q<cr>", { noremap = true, silent = true, desc = "Play macro on lines" })
vim.keymap.set("n", "<f1>", function()
  local macro = vim.fn.getreg("+")
  vim.fn.setreg("q", vim.api.nvim_replace_termcodes(macro, true, true, true))
  vim.notify(macro, vim.log.levels.INFO, { title = "Loaded clipboard macro into @q" })
end, { noremap = true, silent = true, desc = "Load macro from clipboard" })
vim.keymap.set("n", "<f2>", function()
  local macro_escaped = vim.fn.keytrans(vim.fn.getreg("q"))
  vim.fn.setreg("+", macro_escaped)
  vim.notify(macro_escaped, nil, { title = "Saved into clipboard" })
end, { noremap = true, silent = true, desc = "Save macro to clipboard" })

-- Evaluate/execute lua
vim.keymap.set("n", "<leader>r", ":%lua<cr>", { noremap = true, silent = true, desc = "Eval Buffer as Lua" })
vim.keymap.set("v", "<leader>r", ":lua<cr>", { noremap = true, silent = true, desc = "Eval Selection as Lua" })

-- Project keymaps
wk.add({
  { "<leader>p", name = "projects" },
})
vim.keymap.set("n", "<leader>ps", ":wa<cr>", { noremap = true, silent = true, desc = "Save All Files" })

-- Delete words with ctrl+backspace
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true, desc = "Delete Last Word" })

-- Use tabs like workspaces
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- vim.keymap.set("n", "<leader><tab>d", function()
--   vim.cmd("windo bd")
--   if vim.fn.tabpagenr("$") > 1 then
--     vim.cmd("tabclose")
--   end
-- end, { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader><tab>1", "<cmd>tabn1<cr>", { desc = "Go To Tab #1" })
vim.keymap.set("n", "<leader><tab>2", "<cmd>tabn2<cr>", { desc = "Go To Tab #2" })
vim.keymap.set("n", "<leader><tab>3", "<cmd>tabn3<cr>", { desc = "Go To Tab #3" })
vim.keymap.set("n", "<leader><tab>4", "<cmd>tabn4<cr>", { desc = "Go To Tab #4" })
vim.keymap.set("n", "<leader><tab>5", "<cmd>tabn5<cr>", { desc = "Go To Tab #5" })
vim.keymap.set("n", "<leader><tab>6", "<cmd>tabn6<cr>", { desc = "Go To Tab #6" })

-- Remap window maximisation functionality to delete other windows
vim.keymap.set("n", "<leader>wM", function()
  LazyVim.toggle.maximize()
end, { desc = "Maximize Toggle" })
vim.keymap.set("n", "<leader>wm", "<cmd>only<cr>", { desc = "Only Current Window" })

-- "Other window" should cycle through all the windows, like emacs
-- instead of whatever behavior <C-w>p provides, which feels inconsistent to me
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Other Window" })

-- Convenience mapping for changing multiple instances of a symbol
vim.keymap.set({ "n", "x" }, "g/c", function()
  vim.cmd("normal *N")
  vim.api.nvim_feedkeys("cgn", "n", true)
end, { noremap = true, desc = "Change Symbol Matches", silent = true })
vim.keymap.set({ "n", "x" }, "g/C", function()
  vim.cmd("normal *N")
  vim.api.nvim_feedkeys("cgN", "n", true)
end, { noremap = true, desc = "Change Symbol Matches Backwards", silent = true })
vim.keymap.set({ "n", "x" }, "g/d", function()
  vim.cmd("normal *N")
  vim.api.nvim_feedkeys("dgn", "n", true)
end, { noremap = true, desc = "Delete Symbol Matches", silent = true })
vim.keymap.set({ "n", "x" }, "g/D", function()
  vim.cmd("normal *N")
  vim.api.nvim_feedkeys("dgN", "n", true)
end, { noremap = true, desc = "Delete Symbol Matches Backwards", silent = true })

-- Add a new +insert keymap group
wk.add({
  { "<leader>i", name = "insert" },
})

-- Runtime zoomimg in Neovide with neovide_scale_factor
vim.keymap.set("n", "<C-=>", function()
  if not vim.g.neovide_scale_factor then
    vim.g.neovide_scale_factor = 1
  end
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05
  vim.cmd([[redraw!]])
end, { desc = "Zoom In" })
vim.keymap.set("n", "<C-->", function()
  if not vim.g.neovide_scale_factor then
    vim.g.neovide_scale_factor = 1
  end
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
  vim.cmd([[redraw!]])
end, { desc = "Zoom Out" })
vim.keymap.set("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1
  vim.cmd([[redraw!]])
end, { desc = "Reset Zoom" })
