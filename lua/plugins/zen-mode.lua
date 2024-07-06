return {
  "folke/zen-mode.nvim",
  opts = {
    plugins = {
      neovide = {
        enabled = true,
        scale = 1.25,
        disable_animations = {
          neovide_animation_length = 0.13,
          neovide_cursor_animate_command_line = false,
          neovide_scroll_animation_length = 0.13,
          neovide_position_animation_length = 0.13,
          neovide_cursor_animation_length = 0.13,
          neovide_cursor_vfx_mode = "railgun",
        }
      }
    }
  },
  keys = {
    {
      "<leader>uz",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Zen Mode",
    },
  },
}
