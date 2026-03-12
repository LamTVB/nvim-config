return {
  "sudo-tee/opencode.nvim",
  keys = {
    { "<leader>os", function() require("opencode.api").select_session() end, desc = "Select opencode session" },
    { "<leader>on", function() require("opencode.api").open_input_new_session() end, desc = "New opencode session" },
  },
  config = function()
    require("opencode").setup({})
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { "markdown", "opencode_output" },
      },
      ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
    },
    "saghen/blink.cmp",
    "folke/snacks.nvim",
  },
}
