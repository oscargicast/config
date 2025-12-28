return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        {
          align = "center",
          text = {
            { "\n" },

            -- Row 1: Big square (upper-right)
            { "          " },
            { "██████", hl = "LogoOrange3" },
            { "███████", hl = "LogoOrange2" },
            { "███████", hl = "LogoOrange1" },
            { "\n" },

            -- Row 2: Big square
            { "          " },
            { "██████", hl = "LogoOrange3" },
            { "███████", hl = "LogoOrange2" },
            { "███████", hl = "LogoOrange1" },
            { "\n" },

            -- Row 3: Big square
            { "          " },
            { "██████", hl = "LogoOrange3" },
            { "███████", hl = "LogoOrange2" },
            { "███████", hl = "LogoOrange1" },
            { "\n" },

            -- Row 4: Big square
            { "          " },
            { "██████", hl = "LogoOrange2" },
            { "███████", hl = "LogoOrange1" },
            { "███████", hl = "LogoOrange1" },
            { "\n" },

            -- Row 5: Big square
            { "          " },
            { "██████", hl = "LogoOrange1" },
            { "███████", hl = "LogoOrange1" },
            { "███████", hl = "LogoOrange1" },
            { "\n" },

            -- Row 6: Big square
            { "          " },
            { "██████", hl = "LogoSalmon" },
            { "███████", hl = "LogoOrange1" },
            { "███████", hl = "LogoOrange1" },
            { "\n" },

            -- Row 7: Big square
            { "          " },
            { "██████", hl = "LogoPink1" },
            { "███████", hl = "LogoSalmon" },
            { "███████", hl = "LogoOrange1" },
            { "\n" },

            -- Row 8: Big square
            { "          " },
            { "██████", hl = "LogoPink1" },
            { "███████", hl = "LogoPink1" },
            { "███████", hl = "LogoSalmon" },
            { "\n" },

            -- row 9: big square (last row)
            { "          " },
            { "██████", hl = "LogoPink1" },
            { "███████", hl = "LogoPink1" },
            { "███████", hl = "LogoPink1" },
            { "\n" },

            -- row 10: big square (last row)
            { "          " },
            { "██████", hl = "LogoPink1" },
            { "███████", hl = "LogoPink1" },
            { "███████", hl = "LogoPink1" },
            { "\n" },

            -- Row 10: Small square (lower-left, starts here)
            { "██████████", hl = "LogoPink2" },
            { "                    " },
            { "\n" },

            -- Row 11: Small square
            { "██████████", hl = "LogoPink2" },
            { "                    " },
            { "\n" },

            -- Row 12: Small square
            { "██████████", hl = "LogoPink2" },
            { "                    " },
            { "\n" },

            -- Row 13: Small square
            { "██████████", hl = "LogoPink2" },
            { "                    " },
            { "\n" },

            -- Row 14: Small square (last row)
            { "██████████", hl = "LogoPink2" },
            { "                    " },
            { "\n" },

            -- ESPACIO para que no lo pise Keymaps
            { "\n" },
          },
        },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
      preset = {
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
  end,
}
