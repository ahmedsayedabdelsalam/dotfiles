-- diagflow.nvim is a Neovim plugin that provides a neat and distraction-free way to display LSP diagnostics.
-- It shows diagnostics in virtual text at the top-right corner of your screen,
-- only when the cursor is positioned over the problematic code or across an entire line,
-- according to your preference. This provides a clean and focused coding environment. This approach to diagnostics management is inspired by the Helix editor.
return {
  "dgagn/diagflow.nvim",
  event = "LspAttach", -- This is what I use personnally and it works great
  opts = {
    -- scope = "line",
    -- placement = "inline",
    -- inline_padding_left = 3,
  },
}
