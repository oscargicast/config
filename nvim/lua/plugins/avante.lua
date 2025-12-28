return {
  "yetone/avante.nvim",
  build = "make BUILD_FROM_SOURCE=true",
  -- event = "VeryLazy",
  event = "InsertEnter",
  version = false,
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    instructions_file = "avante.md",
    provider = "openai",

    auto_suggestions_provider = "openai",

    behaviour = {
      auto_suggestions = true,
    },

    suggestion = {
      debounce = 600,
      throttle = 600,
    },

    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-5-20250929",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 8192,
        },
      },
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-5.2",
        timeout = 30000,
        context_window = 128000,
        extra_request_body = {
          temperature = 0.7,
          max_completion_tokens = 8192,
        },
      },
    },
  },

  dependencies = {
    -- Core
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    -- File selector providers
    "nvim-mini/mini.pick",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    -- Autocompletion for commands / mentions
    "hrsh7th/nvim-cmp",
    -- Input UI providers
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    -- Copilot provider (optional but included)
    "zbirenbaum/copilot.lua",
    -- Image paste support
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- harmless on macOS, required on Windows
          use_absolute_path = true,
        },
      },
    },
    -- Markdown rendering for Avante buffers
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "Avante" },
      opts = {
        file_types = { "markdown", "Avante" },
        dash = {
          enabled = true,
          icon = "·",
          width = "full",
        },
        anti_conceal = {
          enabled = true,
          above = 0,
          below = 0,
        },
      },
    },
  },
}
