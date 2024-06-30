return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    win_options = {
      wrap = true,
    },
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
