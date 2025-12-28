-- Plugin: mg979/vim-visual-multi
-- Multi-cursor editing similar a VSCode/Sublime Text
--
-- Mapeos principales:
--   <C-d>        - Seleccionar palabra bajo cursor / siguiente ocurrencia (presiona repetidamente)
--   <leader>j/k  - Agregar cursores hacia abajo/arriba (alternativa a Ctrl+Down/Up)
--   <leader>mc   - Crear cursores desde selección visual (funciona con Shift+V)
--   I/A          - Insertar al inicio/final de todas las líneas con cursor
--
-- Uso para edición multi-línea (tu caso de uso principal):
--   1. Shift+V      - Seleccionar líneas
--   2. <leader>mc   - Crear cursores en todas las líneas (mc = multi-cursor)
--   3. I            - Insertar al inicio (o A para el final)
--   4. [escribir]   - Aparece en todas las líneas
--   5. Esc          - Salir del modo multi-cursor
--
-- Alternativa (agregar cursores línea por línea):
--   1. Posiciona cursor donde quieres empezar
--   2. <leader>j    - Agrega cursor en línea de abajo
--   3. <leader>j    - Sigue agregando cursores hacia abajo
--      (o usa <leader>k para agregar hacia arriba)
--   4. I o A        - Insertar al inicio/final
--   5. [escribir]   - Aparece en todos los cursores
--   6. Esc          - Salir
--
return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = "VeryLazy",
  init = function()
    -- Configuración de mapeos personalizados
    vim.g.VM_maps = {
      -- -- Remap Ctrl-N a Ctrl-D para evitar conflicto con nvim-cmp
      -- ["Find Under"] = "<C-d>",           -- Normal: encontrar palabra bajo cursor
      -- ["Find Subword Under"] = "<C-d>",   -- Visual: encontrar texto seleccionado

      -- Crear cursores desde selección visual (evita conflicto con avante <leader>a)
      ["Visual Add"] = "<leader>mc", -- Visual mode: crear cursores (mc = multi-cursor)

      -- -- Agregar cursores arriba/abajo (alternativa a Ctrl+Down/Up que puede no funcionar en Ghostty)
      -- ["Add Cursor Down"] = "<leader>j",  -- Agregar cursor en línea de abajo
      -- ["Add Cursor Up"] = "<leader>k",    -- Agregar cursor en línea de arriba
    }
  end,
}
