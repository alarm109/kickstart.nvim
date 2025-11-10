return {
  'robitx/gp.nvim',
  config = function()
    local defaults = require 'gp.defaults'

    local opts = {
      default_command_agent = 'gemini-2.5-pro',
      default_chat_agent = 'gemini-2.5-pro',

      providers = {
        openai = {
          disable = true,
        },
        googleai = {
          disable = false,
          endpoint = 'https://generativelanguage.googleapis.com/v1beta/models/{{model}}:streamGenerateContent?key={{secret}}',
          secret = os.getenv 'GOOGLEAI_API_KEY',
        },
      },

      agents = {
        {
          provider = 'googleai',
          name = 'gemini-2.5-pro',
          chat = true,
          command = true,
          model = { model = 'gemini-2.5-pro', temperature = 0.8, top_p = 1 },
          system_prompt = defaults.chat_system_prompt,
        },
      },
    }

    require('gp').setup(opts)
  end,
}
