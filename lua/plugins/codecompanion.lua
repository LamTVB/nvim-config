return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    system_prompt = function(opts)
      local path = vim.fn.stdpath("config") .. "/classic_prompt.md"
      local file = io.open(path, "r")
      if not file then
        -- Fallback if file is missing (prevents errors)
        return "You are an expert AI coding assistant."
      end
      local content = file:read("*a");
      file:close()
      return content
    end,
    display = {
      chat = {
        show_settings = true,
      }
    },
    strategies = {
      chat = { adapter = "gemini" },
      inline = { adapter = "gemini" },
      agent = { adapter = "gemini" },
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = os.getenv("GEMINI_API_KEY"),
          },
          schema = {
            model = {
              default = "gemini-3-pro-preview",
            },
          },
        })
      end,
    }
  },
};
