return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-,>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
        preview = {
          hide_on_startup = true, -- hide previewer when picker starts
        },
      },
    },
    keys = {
      {
        "<leader>,",
        function()
          require("telescope.builtin").buffers({
            entry_maker = require("../lib/telescope/make_buffer_entry").gen_from_buffer_like_leaderf(),
          })
        end,
        desc = "Switch Buffer",
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      {
        "<leader>.",
        ":Telescope file_browser path=%:p:h=%:p:h<cr>",
        desc = "Browse Files",
        silent = true,
      },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "LukasPietzschmann/telescope-tabs",
    config = function()
      require("telescope").load_extension("telescope-tabs")
      require("telescope-tabs").setup({
        -- Your custom config :^)
      })
    end,
    keys = {
      {
        "<leader><tab><tab>",
        function()
          require("telescope-tabs").list_tabs()
        end,
        desc = "List Tabs",
      },
    },
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
