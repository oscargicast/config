return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("snacks").explorer.open({
            hidden = true,
            show_hidden = true,
            gitignore = true,
            ignored = true,
          })
        end,
        desc = "Explorer (show hidden + gitignored)",
      },
    },
  },
}
