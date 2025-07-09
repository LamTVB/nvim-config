return {
  "olimorris/codecompanion.nvim",
  opts = {
    system_prompt = function(opts)
      local path = '../classic_prompt.md'
      local file = io.open(path, "r")
      if not file then
        return "Error: Could not open the prompt file."
      end
      local content = file:read("*a");
      file:close()
      return content
    end,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
};
