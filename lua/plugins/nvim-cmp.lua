return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Customized keymaps and options to prevent accidental autocompletes when typing normally
    opts.preselect = cmp.PreselectMode.None
    opts.completion = { completeopt = "menu,menuone,noinsert,noselect" }
    opts.mapping = cmp.mapping.preset.insert({
      ["<tab>"] = cmp.mapping.confirm({ select = true }),
      ["<C-j>"] = cmp.mapping.select_next_item({ select = false, behavior = cmp.SelectBehavior.Select }),
      ["<C-n>"] = cmp.mapping.select_next_item({ select = false, behavior = cmp.SelectBehavior.Select }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ select = false, behavior = cmp.SelectBehavior.Select }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ select = false, behavior = cmp.SelectBehavior.Select }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      -- 'select = false' to only confirm explicitly selected item
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<S-CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
      ["<C-CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
    })
  end,
}
