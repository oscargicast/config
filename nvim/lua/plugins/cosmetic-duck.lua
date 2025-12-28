return {
  {
    "tamton-aquib/duck.nvim",
    event = "VeryLazy", -- que se cargue *despues* del inicio
    config = function()
      -- keymaps para usar el pato
      vim.keymap.set("n", "<leader>dd", function()
        require("duck").hatch()
      end, { desc = "Duck: Hatch" })
      vim.keymap.set("n", "<leader>dk", function()
        require("duck").cook()
      end, { desc = "Duck: Cook" })
      vim.keymap.set("n", "<leader>da", function()
        require("duck").cook_all()
      end, { desc = "Duck: Cook All" })
    end,
  },
}
