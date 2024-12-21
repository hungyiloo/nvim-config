---@diagnostic disable: missing-fields
return {
  "saghen/blink.cmp",
  --- @type blink.cmp.ConfigStrict
  opts = {
    keymap = {
      preset = "super-tab",
    },
    completion = {
      trigger = {
        -- By default this is true, but this makes completion come up more
        -- often in unexpected places, so setting it to false _could_ help.
        -- show_on_trigger_character = false.

        -- Prevent commas from triggering completion.
        -- I rarely need this behavior, and I can manually C-Space.
        -- show_on_insert_on_trigger_character = false,
        -- show_on_blocked_trigger_characters = { ' ', '\n', '\t', ',' },
      },
      list = {
        -- While this isn't as convenient as "preselect", this reduces the
        -- amount of unwanted accidental completions when pressing the enter
        -- key while the completion menu happens to be showing.
        -- selection = "manual"
      }
    }
  }
}
