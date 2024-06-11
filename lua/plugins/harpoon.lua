return {
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
  {
    "ThePrimeagen/harpoon",
    -- HACK: Pinning to this commit prevents harpoons from being deleted after
    --       neovim closure. See https://github.com/ThePrimeagen/harpoon/issues/577
    commit = "e76cb03",
  },
}
