return {
  "LintaoAmons/cd-project.nvim",
  opts = {
    -- this json file is acting like a database to update and read the projects in real time.
    -- So because it's just a json file, you can edit directly to add more paths you want manually
    projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
    -- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
    project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
    choice_format = "both", -- optional, you can switch to "name" or "path"
    projects_picker = "telescope", -- optional, you can switch to `telescope`
    auto_register_project = false, -- optional, toggle on/off the auto add project behaviour
    -- do whatever you like by hooks
    hooks = {
      {
        callback = function(dir)
          vim.notify("CWD: " .. dir)
          -- require("neogit").open({ cwd = dir })
          -- vim.cmd("Neotree " .. dir)
          vim.cmd("Oil " .. dir)
        end,
      },
    },
  },
  config = function(_, opts)
    require("cd-project").setup(opts)
  end,
}
