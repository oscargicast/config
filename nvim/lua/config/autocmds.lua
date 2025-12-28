-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-reload: recargar buffers si el archivo cambió en disco
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  callback = function()
    vim.cmd("checktime")
  end,
})

-- Make listchars subtle (low-contrast) so they don't stand out too much.
-- This targets the highlight groups most themes use for `listchars`:
-- - Whitespace: trailing spaces, nbsp, etc.
-- - SpecialKey: tabs and other special keys
local function apply_subtle_listchars_hl()
  local comment = vim.api.nvim_get_hl(0, { name = "Comment", link = false }) or {}

  -- If the colorscheme defines Comment fg, reuse it so listchars blend in.
  if comment.fg then
    vim.api.nvim_set_hl(0, "Whitespace", { fg = comment.fg })
    vim.api.nvim_set_hl(0, "SpecialKey", { fg = comment.fg })
  end
end

-- Apply once, and re-apply after any colorscheme change.
apply_subtle_listchars_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("user_subtle_listchars", { clear = true }),
  callback = apply_subtle_listchars_hl,
})

-- Clear Snacks image cache on startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("user_clear_image_cache", { clear = true }),
  callback = function()
    local cache_dir = vim.fn.stdpath("cache") .. "/snacks/image"
    if vim.fn.isdirectory(cache_dir) == 1 then
      vim.fn.system({ "rm", "-rf", cache_dir })
    end
  end,
  once = true,
})

-- Ensure transparency is maintained after colorscheme loads
local function apply_transparency()
  local hl_groups = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "LineNr",
    "Folded",
    "NonText",
    "SpecialKey",
    "VertSplit",
    "StatusLine",
    "StatusLineNC",
    "EndOfBuffer",
    -- Snacks (all possible variations)
    "SnacksNormal",
    "SnacksNormalNC",
    "SnacksWinBar",
    "SnacksExplorerNormal",
    "SnacksExplorerBorder",
    "SnacksExplorerTitle",
    "SnacksDashboardNormal",
    "SnacksDashboardDesc",
    "SnacksDashboardFile",
    "SnacksDashboardDir",
    "SnacksDashboardFooter",
    "SnacksDashboardHeader",
    "SnacksDashboardIcon",
    "SnacksDashboardKey",
    "SnacksDashboardTerminal",
    "SnacksDashboardSpecial",
    "SnacksNotifierBorder",
    "SnacksNotifierInfo",
    "SnacksNotifierWarn",
    "SnacksNotifierError",
    "SnacksNotifierDebug",
    "SnacksNotifierTrace",
    -- Which-key
    "WhichKey",
    "WhichKeyFloat",
    "WhichKeyBorder",
    "WhichKeyGroup",
    "WhichKeyDesc",
    "WhichKeySeperator",
    "WhichKeyValue",
    "WhichKeyNormal",
    -- Telescope/pickers
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "TelescopeResultsNormal",
    "TelescopeResultsBorder",
    "TelescopePreviewNormal",
    "TelescopePreviewBorder",
    -- Floating windows
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "Pmenu",
    "PmenuSbar",
    "PmenuThumb",
    -- Snacks backdrop
    "SnacksBackdrop",
  }
  for _, group in ipairs(hl_groups) do
    vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
  end
end

-- Define dashboard logo colors (must run after colorscheme)
local function setup_dashboard_colors()
  vim.api.nvim_set_hl(0, "LogoOrange3", { fg = "#FFB07C", bold = true })
  vim.api.nvim_set_hl(0, "LogoOrange2", { fg = "#FFA060", bold = true })
  vim.api.nvim_set_hl(0, "LogoOrange1", { fg = "#FF8E4D", bold = true })
  vim.api.nvim_set_hl(0, "LogoSalmon", { fg = "#FF7A8A", bold = true })
  vim.api.nvim_set_hl(0, "LogoPink1", { fg = "#FF5FA2", bold = true })
  vim.api.nvim_set_hl(0, "LogoPink2", { fg = "#FF69C8", bold = true })
end

-- Apply immediately and on events
apply_transparency()
setup_dashboard_colors()

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter", "UIEnter" }, {
  group = vim.api.nvim_create_augroup("user_transparent_bg", { clear = true }),
  callback = function()
    apply_transparency()
    setup_dashboard_colors()
  end,
})

-- Also apply with a slight delay to catch late-loading plugins
vim.defer_fn(function()
  apply_transparency()
  setup_dashboard_colors()
end, 100)

-- Create command to inspect highlight groups under cursor and force transparency
vim.api.nvim_create_user_command("TransparencyInspect", function()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local hlID = vim.fn.synID(line, col, 1)
  local hlName = vim.fn.synIDattr(hlID, "name")
  local transHlID = vim.fn.synIDtrans(hlID)
  local transHlName = vim.fn.synIDattr(transHlID, "name")

  print(string.format("Highlight: %s -> %s", hlName, transHlName))

  -- Get window-specific highlight
  local winhl = vim.wo.winhighlight
  if winhl ~= "" then
    print("Window highlights: " .. winhl)
  end
end, {})

-- Create command to force transparency on all windows
vim.api.nvim_create_user_command("TransparencyForce", function()
  apply_transparency()

  -- Also force on all visible windows
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
    if ft == "snacks_explorer" or ft == "WhichKey" then
      vim.api.nvim_win_set_option(win, "winblend", 0)
    end
  end

  print("Transparency applied!")
end, {})

-- Force transparency when Snacks or WhichKey buffers are opened
vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("user_transparent_floats", { clear = true }),
  pattern = { "snacks_*", "WhichKey" },
  callback = function()
    vim.defer_fn(function()
      apply_transparency()
    end, 10)
  end,
})
