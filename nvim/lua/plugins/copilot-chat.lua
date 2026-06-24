-- =============================================================================
--                             COPILOT CHAT SETTINGS
-- =============================================================================
-- CopilotChat provides a chat panel inside Neovim to discuss code with Copilot,
-- explain selections, generate tests, and refactor lines.
-- Accessible via the keymap `<leader>cc`.
-- =============================================================================

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      show_help = "yes",
      window = {
        layout = "vertical", -- open sidebar split
        width = 0.4,         -- takes 40% of the screen width
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)

      -- --- Keymaps (All with `desc` for Which-Key visualization) ---
      local keymap = vim.keymap.set
      
      -- Normal mode: Toggle chat window
      keymap("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
      
      -- Visual mode: Open chat focusing on the selected code segment
      keymap("v", "<leader>cc", ":CopilotChat<CR>", { desc = "Open Copilot Chat with selection" })
    end,
  },
}
