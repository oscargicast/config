-- Custom preview function for images
local function custom_picker_preview(ctx)
  local Snacks = require("snacks")
  local path = Snacks.picker.util.path(ctx.item)

  if not path then
    return Snacks.picker.preview.file(ctx)
  end

  -- Get file extension
  local ext = vim.fn.fnamemodify(path, ":e"):lower()
  local image_exts = { "png", "jpg", "jpeg", "gif", "bmp", "webp", "svg", "heic", "avif", "tiff", "icns" }

  -- Check if it's an image file
  if vim.tbl_contains(image_exts, ext) then
    -- Try image preview
    local ok = pcall(Snacks.picker.preview.image, ctx)
    if ok then
      return
    end
  end

  -- Fall back to file preview
  return Snacks.picker.preview.file(ctx)
end

-- Plugin: snacks.nvim - Picker
-- URL: https://github.com/folke/snacks.nvim/tree/main
-- Description: Fuzzy finder with image preview support.
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      preview = custom_picker_preview,
      layout = {
        preset = "default", -- Enables preview panel on right side
      },
      win = {
        preview = {
          keys = {
            ["<Esc>"] = "cancel",
            ["q"] = "cancel",
            ["<a-p>"] = "toggle", -- Toggle preview visibility
          },
        },
      },
      previewers = {
        file = {
          max_size = 1024 * 1024, -- 1MB max file size for preview
          max_line_length = 500, -- Line length before truncation
        },
      },
      exclude = {
        ".git",
        "node_modules",
      },
      matcher = {
        fuzzy = true,
        smartcase = true,
        ignorecase = true,
        filename_bonus = true,
      },
    },
  },
}
