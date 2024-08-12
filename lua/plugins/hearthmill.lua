return {
  -- "hungyiloo/hearthmill.nvim",
  -- branch = "dev",
  "hearthmill.nvim",
  dev = true,
  -- stylua: ignore
  keys = {
    { mode = { "n", "o", "x" }, "ghes", function() require("hearthmill").select("element") end, desc = "[e]lement [s]elect" },
    { mode = { "n", "o", "x" }, "ghec", function() require("hearthmill").select_contents("element") end, desc = "[e]lement select [c]ontents" },
    { mode = { "n", "o", "x" }, "gheb", function() require("hearthmill").goto_beginning("element") end, desc = "[e]lement [b]eginning" },
    { mode = { "n", "o", "x" }, "ghee", function() require("hearthmill").goto_end("element") end, desc = "[e]lement [e]nd" },
    { mode = { "n", "o", "x" }, "ghen", function() require("hearthmill").goto_next("element") end, desc = "[e]lement [n]ext" },
    { mode = { "n", "o", "x" }, "ghep", function() require("hearthmill").goto_prev("element") end, desc = "[e]lement [p]revious" },
    { mode = "n", "gheo", function() require("hearthmill").goto_parent_element() end, desc = "[e]lement [o]uter parent" },
    { mode = "n", "ghed", function() require("hearthmill").delete("element") end, desc = "[e]lement [d]elete" },
    { mode = "n", "ghet", function() require("hearthmill").transpose("element") end, desc = "[e]lement [t]ranspose" },
    { mode = "n", "gheT", function() require("hearthmill").transpose_backward("element") end, desc = "[e]lement [T]ranspose backwards" },
    { mode = "n", "gher", function() require("hearthmill").rename() end, desc = "[e]lement [r]ename" },
    { mode = { "n", "x" }, "ghew", function() require("hearthmill").wrap() end, desc = "[e]lement [w]rap" },
    { mode = "n", "gheu", function() require("hearthmill").unwrap() end, desc = "[e]lement [u]nwrap" },
    { mode = "n", "ghe=", function() require("hearthmill").clone("element") end, desc = "[e]lement clone [=]" },
    { mode = "n", "ghe<CR>", function() require("hearthmill").break_lines("element") end, desc = "[e]lement break lines [RET]" },

    { mode = { "n", "o", "x" }, "ghas", function() require("hearthmill").select("attribute") end, desc = "[a]ttribute [s]elect" },
    { mode = { "n", "o", "x" }, "ghac", function() require("hearthmill").select_contents("attribute") end, desc = "[a]ttribute select [c]ontents" },
    { mode = { "n", "o", "x" }, "ghab", function() require("hearthmill").goto_beginning("attribute") end, desc = "[a]ttribute [b]eginning" },
    { mode = { "n", "o", "x" }, "ghae", function() require("hearthmill").goto_end("attribute") end, desc = "[a]ttribute [e]nd" },
    { mode = { "n", "o", "x" }, "ghan", function() require("hearthmill").goto_next("attribute") end, desc = "[a]ttribute [n]ext" },
    { mode = { "n", "o", "x" }, "ghap", function() require("hearthmill").goto_prev("attribute") end, desc = "[a]ttribute [p]revious" },
    { mode = "n", "ghad", function() require("hearthmill").delete("attribute") end, desc = "[a]ttribute [d]elete" },
    { mode = "n", "ghat", function() require("hearthmill").transpose("attribute") end, desc = "[a]ttribute [t]ranspose" },
    { mode = "n", "ghaT", function() require("hearthmill").transpose_backward("attribute") end, desc = "[a]ttribute [T]ranspose" },
    { mode = "n", "gha=", function() require("hearthmill").clone("attribute") end, desc = "[a]ttribute clone [=]" },

    { mode = { "n", "o", "x" }, "ghts", function() require("hearthmill").select("tag") end, desc = "[t]ag [s]elect" },
    { mode = { "n", "o", "x" }, "ghtc", function() require("hearthmill").select_contents("tag") end, desc = "[t]ag select [c]ontents" },
    { mode = { "n", "o", "x" }, "ghtb", function() require("hearthmill").goto_beginning("tag") end, desc = "[t]ag [b]eginning" },
    { mode = { "n", "o", "x" }, "ghte", function() require("hearthmill").goto_end("tag") end, desc = "[t]ag [e]nd" },
    { mode = { "n", "o", "x" }, "ghtn", function() require("hearthmill").goto_next("tag") end, desc = "[t]ag [n]ext" },
    { mode = { "n", "o", "x" }, "ghtp", function() require("hearthmill").goto_prev("tag") end, desc = "[t]ag [p]revious" },
    { mode = "n", "ghtd", function() require("hearthmill").delete("tag") end, desc = "[t]ag [d]elete" },
    { mode = "n", "ght<CR>", function() require("hearthmill").break_lines("tag") end, desc = "[t]ag break lines [RET]" },

    {
      mode = "n",
      "gh<CR>",
      function()
        require("hearthmill").break_lines("element")
        require("hearthmill").break_lines("tag")
      end,
      desc = "Break lines [RET]"
    },
  }
,
}
