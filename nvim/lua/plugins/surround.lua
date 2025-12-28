return {
  "nvim-mini/mini.surround",
  version = false,
  opts = {
    mappings = {
      add = "sa",
      delete = "sd",
      find = "sf",
      find_left = "sF",
      highlight = "sh",
      replace = "sr",
      update_n_lines = "sn",
    },
    surroundings = {
      ["("] = { add = { "(", ")" }, find = "%b()", delete = "^(.)(.-)()()$" },
      [")"] = { add = { "(", ")" }, find = "%b()", delete = "^(.)(.-)()()$" },
      ["["] = { add = { "[", "]" }, find = "%b[]", delete = "^(.)(.-)()()$" },
      ["]"] = { add = { "[", "]" }, find = "%b[]", delete = "^(.)(.-)()()$" },
      ["{"] = { add = { "{", "}" }, find = "%b{}", delete = "^(.)(.-)()()$" },
      ["}"] = { add = { "{", "}" }, find = "%b{}", delete = "^(.)(.-)()()$" },
    },
  },
}
