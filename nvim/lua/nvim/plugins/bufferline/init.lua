local bufferline = require "bufferline"

vim.opt.termguicolors = true

bufferline.setup {
  options = {
    numbers = "none",
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    diagnostics = "nvim_lsp",
    max_name_length = 18,
    max_prefix_length = 15,
    show_buffer_close_icons = false,
    persist_buffer_sort = true,
    separator_style = {"", ""},
    enforce_regular_tabs = false,
    separator_style = "thick",
    always_show_bufferline = true,
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
  },
}

vim.cmd[[
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>]b :BufferLineCyclePrev<CR>
]]

