return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>A", "", mode = { "n", "v" }, desc = "+codecompanion" },
    { "<leader>Ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle chat" },
    { "<leader>An", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "New chat" },
    { "<leader>Ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Inline assistant" },
    { "<leader>Aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Actions" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add selection to chat" },
    { "<leader>Al", "<cmd>CodeCompanionCLI<cr>", mode = { "n", "v" }, desc = "Cursor CLI" },
  },
  opts = {
    adapters = {
      cursor_cli = function()
        return require("codecompanion.adapters").extend("cursor_cli", {})
      end,
    },
    strategies = {
      chat = { adapter = "cursor_cli" },
      inline = { adapter = "cursor_cli" },
      cmd = { adapter = "cursor_cli" },
      cli = {
        agent = "cursor_cli",
        agents = {
          cursor_cli = {
            -- Use `agent` (Cursor Agent CLI), not `cursor` (editor/GUI launcher).
            cmd = "agent",
            args = {},
            description = "Cursor Agent CLI",
          },
        },
      },
    },
  },
}
