return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      markdownlint = {
        args = {
          "--disable", -- disable the following warnings:
          "MD013", -- long lines
          "MD041", -- first line must be a heading
          "MD025", -- multiple top level headings
          "MD018", -- missing space between hash and headings (actually tags)
          "MD012", -- multiple blank lines
          "MD034", -- no bare URLs
          "--",
        },
      },
    },
  },
}
