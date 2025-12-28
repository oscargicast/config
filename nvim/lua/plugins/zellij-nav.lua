return {
  {
    "swaits/zellij-nav.nvim",
    lazy = false,
    keys = {
      -- Use Tab-aware commands for horizontal cross-tab navigation
      { "<M-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "Navigate left (can cross tabs)" } },
      { "<M-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "Navigate down" } },
      { "<M-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "Navigate up" } },
      { "<M-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "Navigate right (can cross tabs)" } },
    },
    opts = {},
  },
}
