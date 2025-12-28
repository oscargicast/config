return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- Styles (transparent backgrounds)
      opts.styles = opts.styles or {}
      opts.styles.notification = {
        wo = { winblend = 0 },
      }
      opts.styles.explorer = {
        wo = { winblend = 0 },
      }

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
    end,
  },
}
