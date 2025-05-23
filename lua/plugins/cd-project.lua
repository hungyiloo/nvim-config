return {
  "LintaoAmons/cd-project.nvim",
  lazy = true,
  cmd = { "CdProject", "CdProjectAdd", "CdProjectManualAdd", "CdProjectBack", "CdProjectSearchAndAdd" },
  keys = {
    {
      mode = { "n" },
      "<leader>pp",
      function()
        require("cd-project").api.cd_project_in_tab = function(path) require("cd-project").api.cd_project(path, { cd_cmd = "tabe | tcd" }) end
        require("cd-project/adapter/vim-ui").cd_project_in_tab()
      end,
      noremap = true,
      silent = true,
      desc = "Open Project (New Tab)",
    },
    { mode = { "n" }, "<leader>pP", ":CdProject<cr>", noremap = true, silent = true, desc = "Open Project (This Tab)" },
    { mode = { "n" }, "<leader>pa", ":CdProjectAdd<cr>", noremap = true, silent = true, desc = "Add Project" },
    {
      mode = { "n" },
      "<leader>pA",
      ":CdProjectManualAdd<cr>",
      noremap = true,
      silent = true,
      desc = "Add Project Manually",
    },
    {
      mode = { "n" },
      "<leader>pd",
      ":CdProjectDelete<cr>",
      noremap = true,
      silent = true,
      desc = "Delete Project",
    },
  },
  opts = {
    -- this json file is acting like a database to update and read the projects in real time.
    -- So because it's just a json file, you can edit directly to add more paths you want manually
    projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
    -- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
    project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
    choice_format = "both", -- optional, you can switch to "name" or "path"
    projects_picker = "vim-ui", -- optional, you can switch to `telescope`
    auto_register_project = false, -- optional, toggle on/off the auto add project behaviour
    -- do whatever you like by hooks
    hooks = {
      {
        callback = function(dir)
          vim.notify("   " .. dir, vim.log.levels.INFO, { title = "Changed Directory" })
          if vim.fn.expand("%") == "" and not vim.g.snacks_dashboard_open then
            Snacks.dashboard.open({ win = 0, buf = 0 })
          end
        end,
      },
    },
  },
  config = function(_, opts)
    require("cd-project").setup(opts)
  end,
}
