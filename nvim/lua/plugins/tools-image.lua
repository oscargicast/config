-- Add custom bin directory to PATH for magick wrapper
vim.env.PATH = vim.fn.stdpath("config") .. "/bin:" .. vim.env.PATH

-- Plugin: snacks.nvim - Image Preview
-- URL: https://github.com/folke/snacks.nvim/tree/main
-- Description: Image preview support with ImageMagick integration.
return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      force = true, -- Force image rendering even if terminal detection fails
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
        notify = false,
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
