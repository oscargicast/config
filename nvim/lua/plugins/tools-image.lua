-- Add custom bin directory to PATH for magick wrapper
vim.env.PATH = vim.fn.stdpath("config") .. "/bin:" .. vim.env.PATH

-- WORKAROUND: Monkey-patch Snacks terminal detection for Zellij+Ghostty
-- Zellij doesn't support graphics passthrough (issue #2814) but Ghostty does
-- This intercepts env() to override the result when zellij is detected
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ok, terminal = pcall(require, "snacks.image.terminal")
    if ok and terminal and terminal.env then
      local original_env = terminal.env

      terminal.env = function()
        local result = original_env()

        -- If zellij is detected, force it as supported and remote
        -- because Ghostty underneath supports graphics protocol
        -- and Zellij blocks file transmission (need direct transmission)
        if result.name and result.name:find("zellij") then
          result.supported = true
          result.placeholders = true
          result.remote = true  -- Force direct transmission (t=d) instead of file (t=f)
        end

        return result
      end
    end
  end,
  once = true,
})

-- Plugin: snacks.nvim - Image Preview
-- URL: https://github.com/folke/snacks.nvim/tree/main
-- Description: Image preview support with ImageMagick integration.
return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      force = true, -- Force image rendering even if terminal detection fails
      backend = "kitty", -- Force Kitty graphics protocol (Ghostty uses Kitty protocol)
      debug = {
        request = true, -- Log image protocol requests
        convert = true, -- Log ImageMagick conversion
        placement = true, -- Log image placement
      },
      formats = {
        -- Raster formats
        "png",
        "jpg",
        "jpeg",
        "gif",
        "bmp",
        "webp",
        "tiff",
        "heic",
        "avif",
        -- Vector formats (including SVG!)
        "svg",
        "pdf",
        -- Video formats
        "mp4",
        "mov",
        "avi",
        "mkv",
        "webm",
        -- Other
        "icns",
      },
      convert = {
        notify = true, -- Show conversion errors for debugging
        magick = {
          -- Config genérica para vectores (PDF, EPS, etc.)
          vector = {
            "-density",
            "192",
            "{src}[{page}]",
          },
          -- Config específica para SVG con gradientes
          -- The wrapper script in ~/.config/nvim/bin/magick handles SVG
          svg = {
            "-density",
            "300",
            "{src}[{page}]",
          },
        },
      },
    },
  },
}
