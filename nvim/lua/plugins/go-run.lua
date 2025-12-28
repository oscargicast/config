return {
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<leader>rr",
        function()
          local file = vim.fn.expand("%:p")
          if file == "" then
            vim.notify("No file in current buffer", vim.log.levels.WARN)
            return
          end

          local current_win = vim.api.nvim_get_current_win()

          -- 1) Buscar terminal buffer y su window (si está visible)
          local term_buf, term_win
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local b = vim.api.nvim_win_get_buf(win)
            if vim.bo[b].buftype == "terminal" then
              term_buf = b
              term_win = win
              break
            end
          end

          -- 2) Si no existe, crear split inferior + terminal (y quedarnos con su win)
          if not term_buf then
            vim.cmd("botright split")
            vim.cmd("resize " .. math.floor(vim.o.lines * 0.35))
            vim.cmd("lcd %:p:h")
            vim.cmd("terminal")
            term_win = vim.api.nvim_get_current_win()
            term_buf = vim.api.nvim_get_current_buf()
          end

          -- 3) Obtener channel del terminal
          local chan = vim.bo[term_buf].channel
          if not chan or chan == 0 then
            vim.notify("Terminal channel not available", vim.log.levels.ERROR)
            return
          end

          -- 4) Ejecutar
          vim.fn.chansend(chan, "clear\n")
          vim.fn.chansend(chan, "go run " .. vim.fn.shellescape(file) .. "\n")

          -- 5) Mostrar output: saltar al window de la terminal y scrollear al final
          vim.api.nvim_set_current_win(term_win)
          vim.cmd("normal! G")

          -- 6) Volver al código (opcional). Si prefieres quedarte en la terminal, borra esto.
          vim.api.nvim_set_current_win(current_win)
        end,
        desc = "Go run current file (open/reuse terminal, show output)",
      },
    },
  },
}
