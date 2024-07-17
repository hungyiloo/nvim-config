return {
  "hrsh7th/nvim-cmp",
  keys = {
    {
      "<leader>is",
      mode = { "n" },
      function()
        local keys = "a"
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), "n", true)
        vim.defer_fn(function()
          require("cmp").complete({
            config = {
              sources = { { name = "snippets" } },
            },
          })
        end, 100)
      end,
      desc = "Insert Snippet",
    },
    {
      "<C-x><C-x>s",
      mode = { "i" },
      function()
        require("cmp").complete({
          config = {
            sources = { { name = "snippets" } },
          },
        })
      end,
      desc = "Insert Snippet",
    },
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Customized keymaps and options to prevent accidental autocompletes when typing normally
    -- opts.preselect = cmp.PreselectMode.None
    -- opts.completion = { completeopt = "menu,menuone,noinsert,noselect" }
    -- in the below mappings, set select = false to prevent auto selection of the first item
    opts.mapping = cmp.mapping.preset.insert({
      -- ["<tab>"] = cmp.mapping.confirm({ select = true }),
      ["<C-j>"] = cmp.mapping.select_next_item({ select = true, behavior = cmp.SelectBehavior.Select }),
      ["<C-n>"] = cmp.mapping.select_next_item({ select = true, behavior = cmp.SelectBehavior.Select }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ select = true, behavior = cmp.SelectBehavior.Select }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ select = true, behavior = cmp.SelectBehavior.Select }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      -- Note that <C-Space> doesn't work in neovide on windows because of OS keybinding issues (probably?)
      ["<C-.>"] = cmp.mapping.complete({
        reason = cmp.ContextReason.Manual,
      }),
      ["<C-e>"] = cmp.mapping.abort(),
      -- 'select = false' to only confirm explicitly selected item
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<S-CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      ["<C-CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
    })

    -- Don't include snippets in autocomplete by default.
    -- This is preconfigured by LazyVim, so we have to remove it from the opts
    for i = #opts.sources, 1, -1 do
      if opts.sources[i].name == "snippets" then
        table.remove(opts.sources, i)
      end
    end
  end,
}
