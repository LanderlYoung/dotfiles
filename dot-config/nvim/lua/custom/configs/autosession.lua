-- https://github.com/rmagatti/auto-session
--
require("auto-session").setup {
  -- log_level = "error",
  log_level = "error",
  auto_session_suppress_dirs = {
    "~/", "~/Documents", "~/Desktop/", "~/Downloads", "/",
  },

  session_lens = {
    buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
    load_on_setup = true,
    theme_conf = { border = true },
    previewer = false,
  },
}

vim.keymap.set("n", "<leader>sl",
  require("auto-session.session-lens").search_session, 
  {
    noremap = true,
  }
)

