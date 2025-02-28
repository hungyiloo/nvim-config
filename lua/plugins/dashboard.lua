local pokemon = {
  { name = "pikachu bulbasaur charmander squirtle", indent = 7, height = 11 },
  { name = "pikachu chikorita cyndaquil totodile", indent = 11, height = 11 },
  { name = "pikachu pidgey caterpie rattata", indent = 12, height = 11 },
  { name = "jigglypuff snorlax", indent = 22, height = 20 },
  { name = "chansey blissey", indent = 26, height = 17 },
  { name = "eevee cubone vulpix clefairy", indent = 12, height = 11 },
  { name = "jolteon flareon vaporeon", indent = 0, height = 17 },
  { name = "dratini dragonair dragonite", indent = 10, height = 20 },
  { name = "mew", indent = 40, height = 14 },
  -- { name = "abra kadabra alakazam ", indent = 5, height = 20 },
  -- { name = "gastly haunter gengar", indent = 7, height = 20 },
  -- { name = "bulbasaur ivysaur venusaur", indent = 8, height = 20 },
  -- { name = "charmander charmeleon charizard", indent = 5, height = 20 },
  -- { name = "squirtle wartortle blastoise", indent = 10, height = 20 },
}

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

        -- refresh random pokemon on dashboard
        math.randomseed(os.time())
        local p = pokemon[math.random(#pokemon)]
        Snacks.config.dashboard.sections[1].cmd = "pokeget --hide-name " .. p.name
        Snacks.config.dashboard.sections[1].indent = p.indent
        Snacks.config.dashboard.sections[1].height = p.height
      end,
    })
  end,
  opts = function(_, opts)
    local pick = function (cmd, ops)
      return function ()
        return Snacks.picker(cmd, ops)
      end
    end

    opts.dashboard.preset.keys = {
      { icon = " ", key = "f", desc = "Find File", action = pick('files') },
      { icon = " ", key = ".", desc = "Directory Editor", action = ":Oil --float" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "s", desc = "Find Text", action = pick('grep') },
      { icon = " ", key = "r", desc = "Project Recent Files (cwd)", action = pick('oldfiles', { filter = { cwd = true } }) },
      { icon = " ", key = "R", desc = "All Recent Files", action = pick('oldfiles') },
      { icon = " ", key = "p", desc = "Projects", action = ":CdProject", },
      { icon = " ", key = "g", desc = "Lazygit", action = ":lua Snacks.lazygit({ cwd = LazyVim.root.git() })" },
      { icon = " ", key = "c", desc = "Config", action = pick('files', {cwd = vim.fn.stdpath('config')}) },
      -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    }

    opts.dashboard.sections = {
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    }

    opts.dashboard.width = 100

    math.randomseed(os.time())
    local p = pokemon[math.random(#pokemon)]
    table.insert(opts.dashboard.sections, 1, {
      section = "terminal",
      cmd = "pokeget --hide-name " .. p.name,
      indent = p.indent,
      height = p.height,
      ttl = 0,
      padding = 1
    })
  end,
}
