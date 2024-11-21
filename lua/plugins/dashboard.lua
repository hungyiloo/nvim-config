return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.dashboard.preset.header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]

    opts.dashboard.preset.keys = {
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = ".", desc = "Directory Editor", action = ":Oil --float" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "s", desc = "Find Text", action = ":lua require('telescope').extensions.live_grep_args.live_grep_args({ search_dirs = { LazyVim.root.cwd() } })" },
      { icon = " ", key = "r", desc = "Project Recent Files (cwd)", action = ":lua Snacks.dashboard.pick('oldfiles', { cwd_only = true })" },
      { icon = " ", key = "R", desc = "All Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = " ", key = "p", desc = "Projects", action = ":CdProject", },
      { icon = " ", key = "g", desc = "Lazygit", action = ":lua Snacks.lazygit()" },
      { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    }
  end,
}
