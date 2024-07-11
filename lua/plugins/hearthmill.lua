return {
  "hearthmill",
  dev = true,
  config = true,
  -- stylua: ignore
  keys = {
    { mode = "n", "ghes", function() require("hearthmill").select("element") end, desc = "Element Select" },
    { mode = "n", "gheb", function() require("hearthmill").goto_beginning("element") end, desc = "Element Beginning" },
    { mode = "n", "ghee", function() require("hearthmill").goto_end("element") end, desc = "Element End" },
    { mode = "n", "ghen", function() require("hearthmill").goto_next("element") end, desc = "Next Element" },
    { mode = "n", "ghep", function() require("hearthmill").goto_prev("element") end, desc = "Previous Element" },
    { mode = "n", "ghed", function() require("hearthmill").delete("element") end, desc = "Element Delete" },
    { mode = "n", "ghev", function() require("hearthmill").vanish() end, desc = "Element Vanish" },

    { mode = "n", "ghas", function() require("hearthmill").select("attribute") end, desc = "Attribute Select" },
    { mode = "n", "ghab", function() require("hearthmill").goto_beginning("attribute") end, desc = "Attribute Beginning" },
    { mode = "n", "ghae", function() require("hearthmill").goto_end("attribute") end, desc = "Attribute End" },
    { mode = "n", "ghan", function() require("hearthmill").goto_next("attribute") end, desc = "Next Attribute" },
    { mode = "n", "ghap", function() require("hearthmill").goto_prev("attribute") end, desc = "Previous Attribute" },
    { mode = "n", "ghad", function() require("hearthmill").delete("attribute") end, desc = "Attribute Delete" },

    { mode = "n", "ghts", function() require("hearthmill").select("tag") end, desc = "Tag Select" },
    { mode = "n", "ghtb", function() require("hearthmill").goto_beginning("tag") end, desc = "Tag Beginning" },
    { mode = "n", "ghte", function() require("hearthmill").goto_end("tag") end, desc = "Tag End" },
    { mode = "n", "ghtn", function() require("hearthmill").goto_next("tag") end, desc = "Next Tag" },
    { mode = "n", "ghtp", function() require("hearthmill").goto_prev("tag") end, desc = "Previous Tag" },
    { mode = "n", "ghtd", function() require("hearthmill").delete("tag") end, desc = "Tag Delete" },
    { mode = "n", "ghtv", function() require("hearthmill").vanish() end, desc = "Tag (Element) Vanish" },
  }
}
