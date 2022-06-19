if not pcall(require, "feline") then
  return end

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

local colors = {
  shadow           = '#4b3a32';
  dark_gray        = '#49483e';
  background_purple= '#8076aa';
  gray             = '#49483e';
  violet           = '#63588d';
  dusty_lilac      = '#efe6ff';
  seafoam          = '#c2ffdf';
  silver           = '#f8f8f0';
  fuschia          = '#f92672';
  peach            = '#ff857f';
  gold             = '#e6c000';
  dark_seafoam     = '#80ffbd';
  lilac            = '#c5a3ff';
  lavender         = '#ae81ff';
  rose             = '#ffb8d1';
  goldenrod        = '#fffea0';
}

local vi_mode_colors = {
  NORMAL        = colors.silver,
  INSERT        = colors.dark_gray,
  VISUAL        = colors.silver,
  OP            = colors.silver,
  LINES         = colors.silver,
  BLOCK         = colors.silver,
  REPLACE       = colors.fuschia,
  ['V-REPLACE'] = colors.fuschia,
  COMMAND       = colors.silver,
  ENTER         = colors.silver,
  MORE          = colors.silver,
  SELECT        = colors.silver,
  SHELL         = colors.silver,
  TERM          = colors.silver,
  NONE          = colors.silver,
}

local vi_mode_bg = {
  NORMAL        = colors.lavender,
  INSERT        = colors.dark_seafoam,
  VISUAL        = colors.fuschia,
  OP            = colors.lavender,
  LINES         = colors.fuschia,
  BLOCK         = colors.fuschia,
  REPLACE       = colors.dark_gray,
  ['V-REPLACE'] = colors.dark_gray,
  COMMAND       = colors.lavender,
  ENTER         = colors.lavender,
  MORE          = colors.lavender,
  SELECT        = colors.lavender,
  SHELL         = colors.lavender,
  TERM          = colors.lavender,
  NONE          = colors.lavender,
}

local function get_vi_mode_bg(mode)
  return vi_mode_bg[mode];
end

local function file_osinfo()
  local os = vim.bo.fileformat:upper()
  local icon
  if os == 'UNIX' then
    icon = ' '
  elseif os == 'MAC' then
    icon = ' '
  else
    icon = ' '
  end
  return icon .. os
end

local function create_sep(str, bgColor, fgColor)
  return {
    str = str,
    hl = function()
      local val = {
        bg = bgColor,
        fg = fgColor
      }
      return val
    end,
 }
end

local left_sep = {
    str = " ",
    hl = function()
      local val = {
        bg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
      }
      return val
    end,
}

local right_sep = {
  str = "right_filled",
  hl = function ()
    local val = {
      bg = colors.lavender,
      fg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
    }
    return val
  end,
}

local diagnos_err_sep = create_sep(" ", colors.fuschia)
local diagnos_warn_sep = create_sep(" ", colors.goldenrod)
local diagnos_info_sep = create_sep(" ", colors.dark_seafoam)
local diagnos_hint_sep = create_sep(" ", colors.dusty_lilac)

local function table_length(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

local lsp_get_diag = function(severity)
  local count = table_length(vim.diagnostic.get(0, {severity = severity}))
  return (count > 0) and ' '..count..' ' or ''
end

local comps = {
  vi_mode = {
    left = {
      provider = function()
        return string.format(" %s ", vi_mode_utils.get_vim_mode())
      end,
      right_sep = right_sep,
      hl = function()
        local val = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color(),
          bg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
          style = 'bold'
        }
        return val
      end,
    },
  },
  file = {
    info = {
      left_sep = create_sep(" ", colors.lavender),
      provider = {
        name = 'file_info',
        opts = {
          type = 'relative-short',
          file_readonly_icon = '  ',
          file_modified_icon = '',
        }
      },
      hl = {
        fg = colors.goldenrod,
        bg = colors.lavender
      }
    },
    encoding = {
      provider = 'file_encoding',
      left_sep = ' ',
      hl = {
        fg = colors.goldenrod,
        style = 'bold'
      }
    },
    type = {
      provider = 'file_type',
      hl = {
        fg = colors.goldenrod,
        style = 'bold'
      }
    },
    os = {
      provider = file_osinfo,
      left_sep = left_sep,
      hl = function ()
        local val = {
          fg = vi_mode_utils.get_mode_color(),
          bg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
          style = 'bold'
        }
        return val
      end,
    },
    position = {
      provider = 'position',
      left_sep = left_sep,
      hl = function ()
        local val = {
          fg = vi_mode_utils.get_mode_color(),
          bg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
          style = 'bold'
        }
        return val
      end,
    },
  },

  line_percentage = {
    provider = 'line_percentage',
    left_sep = left_sep,
    hl = function ()
      local val = {
        fg = vi_mode_utils.get_mode_color(),
        bg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
        style = 'bold'
      }
      return val
    end,
  },
  scroll_bar = {
    provider = 'scroll_bar',
    left_sep = left_sep,
    hl = function ()
      local val = {
        fg = vi_mode_utils.get_mode_color(),
        bg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
        style = 'bold'
      }
      return val
    end,
  },
  diagnos = {
    err = {
      provider = function()
        return '' .. lsp_get_diag(vim.diagnostic.severity.ERROR)
      end,
      left_sep = diagnos_err_sep,
      right_sep = diagnos_err_sep,
      enabled = function() return lsp.diagnostics_exist('Error') end,
      hl = {
        bg = colors.fuschia,
        fg = colors.dark_gray,
        style = 'bold'
      }
    },
    warn = {
      provider = function()
        return '' ..  lsp_get_diag(vim.diagnostic.severity.WARN)
      end,
      left_sep = diagnos_warn_sep,
      right_sep = diagnos_warn_sep,
      enabled = function() return lsp.diagnostics_exist('Warn') end,
      hl = {
        bg = colors.goldenrod,
        fg = colors.dark_gray,
        style = 'bold'
      }
    },
    info = {
      provider = function()
        return '' .. lsp_get_diag(vim.diagnostic.severity.INFO)
      end,
      left_sep = diagnos_info_sep,
      right_sep = diagnos_info_sep,
      enabled = function() return lsp.diagnostics_exist('Info') end,
      hl = {
        bg = colors.dark_seafoam,
        fg = colors.dark_gray,
        style = 'bold'
      }
    },
    hint = {
      provider = function()
        return '' .. lsp_get_diag(vim.diagnostic.severity.HINT)
      end,
      left_sep = diagnos_hint_sep,
      right_sep = diagnos_hint_sep,
      enabled = function() return lsp.diagnostics_exist('Hint') end,
      hl = {
        fg = colors.dark_gray,
        bg = colors.dusty_lilac,
        style = 'bold'
      }
    },
  },
  lsp = {
    name = {
      provider = 'lsp_client_names',
      left_sep = {
        str = "left_filled",
        hl = function ()
          local val = {
            bg = colors.lavender,
            fg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
          }
          return val
        end,
      },
      icon = ' 慎',
      hl = function ()
        local val = {
          fg = vi_mode_utils.get_mode_color(),
          bg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
          style = 'bold'
        }
        return val
      end,
    }
  },
  git = {
    branch = {
      provider = 'git_branch',
      icon = ' ',
      left_sep = {
        str = ' ',
        hl = {
          bg = colors.lavender
        }
      },
      hl = {
        fg = colors.shadow,
        bg = colors.lavender,
        style = 'bold'
      },
    },
    add = {
      provider = 'git_diff_added',
      hl = {
        fg = colors.dark_seafoam,
        bg = colors.lavender,
        style = 'bold'
      }
    },
    change = {
      provider = 'git_diff_changed',
      hl = {
        fg = colors.gold,
        bg = colors.lavender,
        style = 'bold'
      }
    },
    remove = {
      provider = 'git_diff_removed',
      hl = {
        fg = colors.fuschia,
        bg = colors.lavender,
        style = 'bold'
      }
    }
  }
}

local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.git.branch)
table.insert(components.active[2], comps.git.add)
table.insert(components.active[2], comps.git.change)
table.insert(components.active[2], comps.git.remove)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.os)
table.insert(components.active[2], comps.file.position)
table.insert(components.active[2], comps.line_percentage)
table.insert(components.active[2], comps.scroll_bar)

require'feline'.setup {
  colors = { bg = colors.gray, fg = colors.dark_gray },
  components = components,
  vi_mode_colors = vi_mode_colors,
  disable = { filetypes = { "^NvimTree$", "^neo%-tree$" } }
}
