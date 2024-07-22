return {
  "windwp/nvim-ts-autotag",
  opts = {
    aliases = {
      -- BUG: Tag renaming doesn't fully work in angular templates, and I don't
      --      currently know why. However, enabling it as is allows for convenient
      --      tag auto-closing, which is already great.
      ["htmlangular"] = "html"
    }
  }
}
