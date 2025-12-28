return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- Explorer
      opts.explorer = opts.explorer or {}
      opts.explorer.show_hidden = true
      opts.explorer.hidden = true
      opts.explorer.gitignore = true
      opts.explorer.ignored = true
      opts.explorer.respect_gitignore = false

      -- Picker
      opts.picker = opts.picker or {}
      opts.picker.sources = opts.picker.sources or {}
      opts.picker.sources.files = opts.picker.sources.files or {}
      opts.picker.sources.files.hidden = true
      opts.picker.sources.files.gitignore = true
      opts.picker.sources.files.ignored = true

      opts.picker.sources.explorer = opts.picker.sources.explorer or {}
      opts.picker.sources.explorer.win = opts.picker.sources.explorer.win or {}
      opts.picker.sources.explorer.win.list = opts.picker.sources.explorer.win.list or {}
      opts.picker.sources.explorer.win.list.keys = opts.picker.sources.explorer.win.list.keys or {}

      opts.picker.sources.explorer.win.list.keys["<M-h>"] = function()
        vim.fn.system("zellij action move-focus-or-tab left")
      end
      opts.picker.sources.explorer.win.list.keys["<M-j>"] = function()
        vim.fn.system("zellij action move-focus down")
      end
      opts.picker.sources.explorer.win.list.keys["<M-k>"] = function()
        vim.fn.system("zellij action move-focus up")
      end
      opts.picker.sources.explorer.win.list.keys["<M-l>"] = function()
        local cur_win = vim.fn.winnr()
        vim.cmd("wincmd l")
        local new_win = vim.fn.winnr()
        if cur_win == new_win then
          vim.fn.system("zellij action move-focus-or-tab right")
        end
      end

      opts.picker.sources.explorer.win.input = opts.picker.sources.explorer.win.input or {}
      opts.picker.sources.explorer.win.input.keys = opts.picker.sources.explorer.win.input.keys or {}
      opts.picker.sources.explorer.win.input.keys["<M-h>"] = function()
        vim.fn.system("zellij action move-focus-or-tab left")
      end
      opts.picker.sources.explorer.win.input.keys["<M-j>"] = function()
        vim.fn.system("zellij action move-focus down")
      end
      opts.picker.sources.explorer.win.input.keys["<M-k>"] = function()
        vim.fn.system("zellij action move-focus up")
      end
      opts.picker.sources.explorer.win.input.keys["<M-l>"] = function()
        local cur_win = vim.fn.winnr()
        vim.cmd("wincmd l")
        local new_win = vim.fn.winnr()
        if cur_win == new_win then
          vim.fn.system("zellij action move-focus-or-tab right")
        end
      end
    end,
  },
}
