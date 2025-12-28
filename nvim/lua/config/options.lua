-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = true -- muestra números absolutos
vim.opt.relativenumber = true -- muestra números relativos (recomendado)

vim.opt.signcolumn = "yes" -- columna de signos siempre visible (ahí van los iconos de git)

vim.opt.autoread = true

-- Cambiar el carácter de trailing whitespace a punto medio (menos intrusivo que guion)
vim.opt.listchars = {
  trail = "·", -- espacios al final de línea (punto medio)
  tab = "→ ", -- tabs visibles
  nbsp = "␣", -- non-breaking spaces
}

-- Barra superior por ventana con el nombre del archivo
vim.opt.winbar = "%f" -- %f = nombre del archivo con ruta relativa

-- Opcional: asegúrate de ver bien las separaciones
vim.opt.fillchars:append({
  vert = "│",
  horiz = "─",
  horizup = "┴",
  horizdown = "┬",
  vertleft = "┤",
  vertright = "├",
})
