return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = {
    { mode = { "n" }, "<esc>", function ()
      local mc = require("multicursor-nvim")
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- This hopefully replicates the default lazyvim <esc> behavior, since we've overridden the default keybinding
        vim.cmd("noh")
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, true, true), "n", true)
      end
    end },
    { mode = { "n" },      "gm<backspace>", function () require("multicursor-nvim").disableCursors() end     },
    { mode = { "n", "v" }, "gmk",           function () require("multicursor-nvim").lineAddCursor(-1) end    },
    { mode = { "n", "v" }, "<S-up>",        function () require("multicursor-nvim").lineAddCursor(-1) end    },
    { mode = { "n", "v" }, "<C-S-up>",      function () require("multicursor-nvim").lineSkipCursor(-1) end   },
    { mode = { "n", "v" }, "gmj",           function () require("multicursor-nvim").lineAddCursor(1) end     },
    { mode = { "n", "v" }, "<S-down>",      function () require("multicursor-nvim").lineAddCursor(1) end     },
    { mode = { "n", "v" }, "<C-S-down>",    function () require("multicursor-nvim").lineSkipCursor(1) end    },
    { mode = { "n", "v" }, "gmm",           function () require("multicursor-nvim").matchAddCursor(1) end    },
    { mode = { "n", "v" }, "<S-right>",     function () require("multicursor-nvim").matchAddCursor(1) end    },
    { mode = { "n", "v" }, "gmn",           function () require("multicursor-nvim").matchSkipCursor(1) end   },
    { mode = { "n", "v" }, "<C-S-right>",   function () require("multicursor-nvim").matchSkipCursor(1) end   },
    { mode = { "n", "v" }, "gmM",           function () require("multicursor-nvim").matchAddCursor(-1) end   },
    { mode = { "n", "v" }, "<S-left>",      function () require("multicursor-nvim").matchAddCursor(-1) end   },
    { mode = { "n", "v" }, "gmN",           function () require("multicursor-nvim").matchSkipCursor(-1) end  },
    { mode = { "n", "v" }, "<C-S-left>",    function () require("multicursor-nvim").matchSkipCursor(-1) end  },
    { mode = { "n" },      "gmg",           function () require("multicursor-nvim").matchAllAddCursors() end },
    { mode = { "n" },      "gm]",           function () require("multicursor-nvim").nextCursor() end         },
    { mode = { "n" },      "gm[",           function () require("multicursor-nvim").prevCursor() end         },
    { mode = { "n" },      "gmd",           function () require("multicursor-nvim").deleteCursor() end       },
    { mode = { "n" },      "<c-leftmouse>", function () require("multicursor-nvim").handleMouse() end        },
    { mode = { "n" },      "gm.",           function () require("multicursor-nvim").toggleCursor() end       },
    { mode = { "n" },      "gm=",           function () require("multicursor-nvim").duplicateCursors() end   },
    { mode = { "n" },      "gmr",           function () require("multicursor-nvim").restoreCursors() end     },
    { mode = { "n" },      "gma",           function () require("multicursor-nvim").alignCursors() end       },
    { mode = { "v" },      "gm/",           function () require("multicursor-nvim").splitCursors() end       },
    { mode = { "v" },      "gmI",           function () require("multicursor-nvim").insertVisual() end       },
    { mode = { "v" },      "gmA",           function () require("multicursor-nvim").appendVisual() end       },
    { mode = { "v" },      "gm?",           function () require("multicursor-nvim").matchCursors() end       },
    { mode = { "v" },      "gmt",           function () require("multicursor-nvim").transposeCursors(1) end  },
    { mode = { "v" },      "gmT",           function () require("multicursor-nvim").transposeCursors(-1) end },
  },
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })

    -- Use the following line to make the multicursor cursor visually identical to the real cursor
    -- hl(0, "MultiCursorCursor", { link = "Cursor" })
    -- I prefer a customised look to differentiate them from the real cursor
    hl(0, "MultiCursorCursor", { foreground = require("catppuccin/palettes/mocha").crust, background = require("catppuccin/palettes/mocha").mauve })
  end,
}
