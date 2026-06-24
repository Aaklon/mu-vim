-- =============================================================================
--                             WHICH-KEY KEYMAP VISUALIZER
-- =============================================================================
-- Shows a popup pane listing available key shortcuts when you start typing a
-- key combination (like pressing Space). Invaluable helper for beginners.
-- =============================================================================

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = function(ctx)
        return ctx.plugin and 0 or 300 -- 300ms delay for user keystrokes
      end,
      spec = {
        -- Define logical groupings for leader menus
        { "<leader>c", group = "Code (LSP)" },
        { "<leader>d", group = "Debug (DAP)" },
        { "<leader>f", group = "Find (Telescope)" },
        { "<leader>g", group = "Git" },
        { "<leader>s", group = "Splits" },
        { "<leader>t", group = "Tabs" },
        { "<leader>b", group = "Buffers" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
  },
}
