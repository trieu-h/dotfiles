local ts = require("nvim-treesitter.configs")

ts.setup {
  ensure_installed = {
    "javascript",
    "typescript",
    "html",
    "css",
    "bash",
    "lua",
    "json",
    "java"
  },
  highlight = {
    enable = true,
    use_languagetree = true
  },
  context_commentstring = {enable = true},
  ensure_installed = "all",
  indent = {enable = false},
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"}
  }
}
