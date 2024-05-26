return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require "auto-session"

    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_supress_dirs = { "/", "~/", "~/Sites/", "~/Downloads", "~/Documents", "~/Desktop" },
    }

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
  end,
  keys = {
    { "<leader>wr", "<cmd>SessionRestore<CR>", { mode = "n", desc = "Restore session for cwd" } },
    { "<leader>ws", "<cmd>SessionSave<CR>", { mode = "n", desc = "Save session for auto session root dir" } },
  },
}
