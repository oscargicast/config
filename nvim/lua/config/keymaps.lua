-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>of", function()
  local file = vim.fn.expand("%:p")
  if file ~= "" then
    vim.fn.jobstart({ "open", "-R", file }, { detach = true })
  end
end, { desc = "Open file in Finder" })

vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  vim.notify("Copied: " .. vim.fn.expand("%:p"))
end, { desc = "Copy buffer absolute path" })

vim.keymap.set("n", "<leader>yr", function()
  local abs = vim.fn.expand("%:p")
  if abs == "" then
    return
  end

  -- Make the path relative to the current working directory (:pwd)
  local rel = vim.fn.fnamemodify(abs, ":.")

  vim.fn.setreg("+", rel)
  vim.notify("Copied: " .. rel)
end, { desc = "Copy buffer relative path" })
