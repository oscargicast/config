return {
  {
    "swaits/zellij-nav.nvim",
    lazy = false,
    keys = {
      -- Use Tab-aware commands for horizontal cross-tab navigation
      { "<C-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "Navigate left (can cross tabs)" } },
      { "<C-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "Navigate down" } },
      { "<C-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "Navigate up" } },
      { "<C-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "Navigate right (can cross tabs)" } },
    },
    opts = {},
  },
}
