-- Plugin: zen-mode.nvim
-- URL: https://github.com/folke/zen-mode.nvim
-- Description: A Neovim plugin for distraction-free coding.
return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    plugins = {
      gitsigns = true,
      tmux = true,
      kitty = { enabled = false, font = "+2" },
      twilight = { enabled = true },
    },
  },
  keys = { { "<leader>zm", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
