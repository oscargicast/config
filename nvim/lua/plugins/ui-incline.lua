return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      margin = { vertical = 0, horizontal = 1 },
      padding = 1,
      zindex = 50,
    },
    highlight = {
      groups = {
        InclineNormal = "CursorLine", -- window activa
        InclineNormalNC = "WinBar", -- ventanas inactivas
      },
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      if filename == "" then
        filename = "[No Name]"
      end
      local modified = vim.bo[props.buf].modified and " ●" or ""
      return filename .. modified
    end,
  },
}
