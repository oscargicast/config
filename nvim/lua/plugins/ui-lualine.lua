-- Plugin: lualine.nvim
-- URL: https://github.com/nvim-lualine/lualine.nvim
-- Description: A blazing fast and easy to configure Neovim statusline plugin.
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      icons_enabled = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          icon = "🚀",
        },
      },
      lualine_x = {
        -- Tab/space indicator
        {
          function()
            if vim.bo.expandtab then
              return "spaces:" .. vim.bo.shiftwidth
            else
              return "tab:" .. vim.bo.tabstop
            end
          end,
        },
      },
    },
    extensions = { "quickfix" },
  },
}
