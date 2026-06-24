-- =============================================================================
--                             GITHUB COPILOT SETTINGS
-- =============================================================================
-- Integrates GitHub Copilot.
--   - Disabled by default. Can be enabled on-demand via `:Copilot enable`.
--   - Toggle using the keymap `<leader>cp` with desktop status notifications.
--   - Sourced into nvim-cmp to provide completion suggestions alongside LSP.
-- =============================================================================

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false, -- Disabled: we use copilot-cmp and CopilotChat instead
        },
        suggestion = {
          enabled = false, -- Disabled: we show Copilot items in the autocomplete list
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be >= 18.x
      })

      -- --- DISABLED BY DEFAULT ---
      -- To enable GitHub Copilot permanently on startup, delete or comment out
      -- the line below:
      vim.cmd("Copilot disable")

      -- State tracker for toggling Copilot
      local copilot_active = false

      local function toggle_copilot()
        if copilot_active then
          vim.cmd("Copilot disable")
          copilot_active = false
          vim.notify("GitHub Copilot Disabled", vim.log.levels.WARN, { title = "mu-vim" })
        else
          vim.cmd("Copilot enable")
          copilot_active = true
          vim.notify("GitHub Copilot Enabled", vim.log.levels.INFO, { title = "mu-vim" })
        end
      end

      -- Toggle Copilot keybind (with desc for Which-Key discovery)
      vim.keymap.set("n", "<leader>cp", toggle_copilot, { desc = "Toggle GitHub Copilot" })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
