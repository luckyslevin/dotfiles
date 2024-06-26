return {
  "stevearc/oil.nvim",
  opts = {
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
  },
  event = "VimEnter",
  keys = {
    {
      mode = { "n" },
      "-",
      "<CMD>Oil<CR>",
      desc = "Open parent directory",
    },
  },
}
