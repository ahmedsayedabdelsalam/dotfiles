-- Jump to the last location when opening a file.

return {
  "farmergreg/vim-lastplace",
  event = { "BufReadPost", "BufNewFile" },
}
