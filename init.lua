-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- recompile stale/missing .spl (spell) files
local config_dir = vim.fn.stdpath('config')
local spell_add_path = config_dir .. '/spell/en.utf-8.add'
local spell_spl_path = config_dir .. '/spell/en.utf-8.add.spl'
if vim.fn.filereadable(spell_add_path) == 1 then
  if vim.fn.getftime(spell_add_path) > vim.fn.getftime(spell_spl_path) or vim.fn.filereadable(spell_spl_path) == 0 then
    -- silent! suppresses output and the bang makes it ignore errors
    -- mkspell! recompiles the word list into a .spl file, with the bang allowing overwrites
    vim.cmd('silent! mkspell! ' .. spell_add_path)
    vim.notify('󰓆 Spell file recompiled: ' .. spell_spl_path)
  end
end

-- convenience function for forcibly re-requiring a module
function _G.rerequire(module_name)
  package.loaded[module_name] = nil
  return require(module_name)
end
