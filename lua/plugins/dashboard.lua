return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    local logo = [[
███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
    ]]
    logo = string.rep("\n", 8) .. logo .. "\n\n"
    opts.config.header = vim.split(logo, "\n")

    -- -- Add a custom "projects" menu item
    -- local projects = {
    --   action = "CdProject",
    --   desc = " Projects",
    --   icon = " ",
    --   key = "p",
    -- }
    -- projects.desc = projects.desc .. string.rep(" ", 43 - #projects.desc)
    -- projects.key_format = "  %s"
    -- table.insert(opts.config.center, 3, projects)

    -- stylua: ignore
    -- HACK: Redefine the dashboard with some custom actions to prevent errors on
    --       finding files (f) on opening a new project tab. I don't know what causes
    --       this error, but the dashboard config is rapidly changing upstream so
    --       it may be worth trying to revert this change to the above commented block
    --       on the next major version of LazyVim.
    opts.config.center = {
      -- used to be LazyVim.telescope("files")
      { action = "Telescope find_files",                           desc = " Find File",       icon = " ", key = "f" },
      { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
      { action = "CdProject",                                      desc = " Projects",        icon = " ", key = "p" },
      { action = "Telescope oldfiles",                             desc = " Recent Files",    icon = " ", key = "r" },
      { action = "Telescope live_grep",                            desc = " Find Text",       icon = " ", key = "g" },
      { action = [[lua LazyVim.telescope.config_files()()]],       desc = " Config",          icon = " ", key = "c" },
      { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
      { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
      { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
      { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
    }
    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end
    -- end HACK

    opts.hide = {
      statusline = false,
      tabline = false,
      winbar = false,
    }
  end,
}
