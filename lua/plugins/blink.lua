---@diagnostic disable: missing-fields
return {
  "saghen/blink.cmp",
  --- @type blink.cmp.ConfigStrict
  opts = {
    keymap = {
      preset = "enter",

      -- Extra tweaks to make it behave as close to vscode as possible.
      -- This helps with muscle memory.
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.accept()
          else return cmp.select_and_accept() end
        end,
        'snippet_forward',
        'fallback'
      },
    },
    completion = {
      list = {
        selection = {
          auto_insert = false
        }
      }
    }
  }
}
