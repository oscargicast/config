return {
  {
    "snacks.nvim",
    opts = {
      terminal = {
        win = {
          position = "bottom",
          height = 0.35,
        },
      },
    },
    keys = {
      {
        "<leader>tf",
        function()
          -- directorio del archivo actual
          local dir = vim.fn.expand("%:p:h")

          -- split horizontal abajo + terminal
          vim.cmd("botright split")
          vim.cmd("resize " .. math.floor(vim.o.lines * 0.35))
          vim.cmd("lcd " .. dir)
          vim.cmd("terminal")
        end,
        desc = "Terminal (file directory, bottom split)",
      },
    },
  },
}
