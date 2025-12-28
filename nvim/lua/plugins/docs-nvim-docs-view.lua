-- Plugin: nvim-docs-view
-- URL: https://github.com/amrbashir/nvim-docs-view
-- Description: A Neovim plugin for viewing documentation.
return {
  "amrbashir/nvim-docs-view",
  lazy = true,
  cmd = "DocsViewToggle",
  opts = {
    position = "right",
    width = 60,
  },
}
