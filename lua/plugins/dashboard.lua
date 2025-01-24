
return {
  "folke/snacks.nvim",
  init = function()
    vim.g.snacks_dashboard_open = true

    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboardOpened",
      callback = function()
        vim.g.snacks_dashboard_open = true
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboardClosed",
      callback = function()
        vim.g.snacks_dashboard_open = false
      end,
    })
  end,
  opts = function(_, opts)
    opts.dashboard.preset.header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]]

    local pick = function (cmd, ops)
      return function ()
        return require('fzf-lua')[cmd](ops)
      end
    end

    opts.dashboard.preset.keys = {
      { icon = " ", key = "f", desc = "Find File", action = pick('files') },
      { icon = " ", key = ".", desc = "Directory Editor", action = ":Oil --float" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "s", desc = "Find Text", action = pick('live_grep_glob') },
      { icon = " ", key = "r", desc = "Project Recent Files (cwd)", action = pick('oldfiles', { cwd_only = true }) },
      { icon = " ", key = "R", desc = "All Recent Files", action = pick('oldfiles') },
      { icon = " ", key = "p", desc = "Projects", action = ":CdProject", },
      { icon = " ", key = "g", desc = "Lazygit", action = ":lua Snacks.lazygit()" },
      { icon = " ", key = "c", desc = "Config", action = pick('files', {cwd = vim.fn.stdpath('config')}) },
      -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    }
  end,
}
