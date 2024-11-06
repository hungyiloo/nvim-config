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
    -- TODO: Explore whether a hydra could make this mess of keybindings better, or would it just make it unstable?
    { mode = { "n", "v" }, "gm<backspace>", function () require("multicursor-nvim").disableCursors() end,     desc = "Disable cursors"              },
    { mode = { "n", "v" }, "gm<space>",     function () require("multicursor-nvim").enableCursors() end,      desc = "Enable cursors"               },
    { mode = { "n", "v" }, "gmk",           function () require("multicursor-nvim").lineAddCursor(-1) end,    desc = "Add cursor above"             },
    { mode = { "n", "v" }, "<S-up>",        function () require("multicursor-nvim").lineAddCursor(-1) end,    desc = "Add cursor above"             },
    { mode = { "n", "v" }, "<C-S-up>",      function () require("multicursor-nvim").lineSkipCursor(-1) end,   desc = "Skip up a line"               },
    { mode = { "n", "v" }, "gmj",           function () require("multicursor-nvim").lineAddCursor(1) end,     desc = "Add cursor below"             },
    { mode = { "n", "v" }, "<S-down>",      function () require("multicursor-nvim").lineAddCursor(1) end,     desc = "Add cursor below"             },
    { mode = { "n", "v" }, "<C-S-down>",    function () require("multicursor-nvim").lineSkipCursor(1) end,    desc = "Skip down a line"             },
    { mode = { "n", "v" }, "gmm",           function () require("multicursor-nvim").matchAddCursor(1) end,    desc = "Add cursor on next match"     },
    { mode = { "n", "v" }, "<S-right>",     function () require("multicursor-nvim").matchAddCursor(1) end,    desc = "Add cursor on next match"     },
    { mode = { "n", "v" }, "gmn",           function () require("multicursor-nvim").matchSkipCursor(1) end,   desc = "Skip to next match"           },
    { mode = { "n", "v" }, "<C-S-right>",   function () require("multicursor-nvim").matchSkipCursor(1) end,   desc = "Skip to next match"           },
    { mode = { "n", "v" }, "gmM",           function () require("multicursor-nvim").matchAddCursor(-1) end,   desc = "Add cursor on previous match" },
    { mode = { "n", "v" }, "<S-left>",      function () require("multicursor-nvim").matchAddCursor(-1) end,   desc = "Add cursor on previous match" },
    { mode = { "n", "v" }, "gmN",           function () require("multicursor-nvim").matchSkipCursor(-1) end,  desc = "Skip to previous match"       },
    { mode = { "n", "v" }, "<C-S-left>",    function () require("multicursor-nvim").matchSkipCursor(-1) end,  desc = "Skip to previous match"       },
    { mode = { "n", "v" }, "gmg",           function () require("multicursor-nvim").matchAllAddCursors() end, desc = "Add cursors on all matches"   },
    { mode = { "n", "v" }, "gm]",           function () require("multicursor-nvim").nextCursor() end,         desc = "Next cursor"                  },
    { mode = { "n", "v" }, "gm[",           function () require("multicursor-nvim").prevCursor() end,         desc = "Previous cursor"              },
    { mode = { "n", "v" }, "gmd",           function () require("multicursor-nvim").deleteCursor() end,       desc = "Delete cursor"                },
    { mode = { "n", "v" }, "<c-leftmouse>", function () require("multicursor-nvim").handleMouse() end,        desc = "Add cursor"                   },
    { mode = { "n", "v" }, "gm.",           function () require("multicursor-nvim").toggleCursor() end,       desc = "Toggle cursor"                },
    { mode = { "n", "v" }, "gm=",           function () require("multicursor-nvim").duplicateCursors() end,   desc = "Duplicate cursors"            },
    { mode = { "n" },      "gmr",           function () require("multicursor-nvim").restoreCursors() end,     desc = "Restore cursors"              },
    { mode = { "n" },      "gma",           function () require("multicursor-nvim").alignCursors() end,       desc = "Align cursors"                },
    { mode = { "v" },      "gm/",           function () require("multicursor-nvim").splitCursors() end,       desc = "Split cursors"                },
    { mode = { "v" },      "gmI",           function () require("multicursor-nvim").insertVisual() end,       desc = "Insert at line beginnings"    },
    { mode = { "v" },      "gmA",           function () require("multicursor-nvim").appendVisual() end,       desc = "Insert at line ends"          },
    { mode = { "v" },      "gm?",           function () require("multicursor-nvim").matchCursors() end,       desc = "Add cursors by regex match"   },
    { mode = { "v" },      "gmt",           function () require("multicursor-nvim").transposeCursors(1) end,  desc = "Transpose cursors"            },
    { mode = { "v" },      "gmT",           function () require("multicursor-nvim").transposeCursors(-1) end, desc = "Transpose cursors backward"   },
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
