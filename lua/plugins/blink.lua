return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        -- By default this is true, but this makes completion come up more
        -- often in unexpected places, so setting it to false _could_ help.
        -- show_on_trigger_character = false

        -- Prevent commas from triggering completion.
        -- I rarely need this behavior, and I can manually C-Space
        show_on_blocked_trigger_characters = { ' ', '\n', '\t', ',' },
        show_on_x_blocked_trigger_characters = { "'", '"', '(', ',' }
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
