return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      providers = {
        openai = {
          disable = true,
          endpoint = "https://api.openai.com/v1/chat/completions",
        },
        copilot = {
          disable = false,
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/apps.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        }
      },
      agents = {
        {
          name = "ChatGPT3-5",
          disable = true,
        },
        {
          provider = "copilot",
          name = "CodeCopilot",
          chat = true,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 0.8, top_p = 1, n = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
      }
    }
    require("gp").setup(conf)

    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
