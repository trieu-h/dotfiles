if not pcall(require, "feline") then
  return
end

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

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'
local fmt = string.format

local left_sep = {
  str = ' ',
  hl = function()
    local val = {
      bg = get_vi_mode_bg(vi_mode_utils.get_vim_mode()),
    }
    return val
  end,
}

local lsp_get_diag = function(str)
  local count = vim.lsp.diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

local comps = {
  vi_mode = {
    left = {
      provider = function()
        return string.format(" %s  ", vi_mode_utils.get_vim_mode())
      end,
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

  left_end = {
    provider = function() return '' end,
    hl = {
      -- fg = colors.bg,
      -- bg = colors.blue,
    }
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
        return '' .. lsp_get_diag("Error")
      end,
      enabled = function() return lsp.diagnostics_exist('Error') end,
      hl = {
        fg = colors.red
      }
    },
    warn = {
      provider = function()
        return '' ..  lsp_get_diag("Warn")
      end,
      -- left_sep = ' ',
      enabled = function() return lsp.diagnostics_exist('Warn') end,
      hl = {
        -- fg = colors.yellow
      }
    },
    info = {
      provider = function()
        return '' .. lsp_get_diag("Info")
      end,
      -- left_sep = ' ',
      enabled = function() return lsp.diagnostics_exist('Info') end,
      hl = {
        -- fg = colors.blue
      }
    },
    hint = {
      -- provider = 'diagnostic_hints',
      provider = function()
        return '' .. lsp_get_diag("Hint")
      end,
      -- left_sep = ' ',
      enabled = function() return lsp.diagnostics_exist('Hint') end,
      hl = {
        -- fg = colors.cyan
      }
    },
  },
  lsp = {
    name = {
      provider = 'lsp_client_names',
      -- left_sep = ' ',
      right_sep = ' ',
      -- icon = '  ',
      icon = '慎',
      hl = {
        -- fg = colors.yellow
      }
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
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[3], comps.diagnos.err)
table.insert(components.active[3], comps.diagnos.warn)
table.insert(components.active[3], comps.diagnos.hint)
table.insert(components.active[3], comps.diagnos.info)
table.insert(components.active[3], comps.git.branch)
table.insert(components.active[3], comps.git.add)
table.insert(components.active[3], comps.git.change)
table.insert(components.active[3], comps.git.remove)
table.insert(components.active[3], comps.lsp.name)
table.insert(components.active[3], comps.file.os)
table.insert(components.active[3], comps.file.position)
table.insert(components.active[3], comps.line_percentage)
table.insert(components.active[3], comps.scroll_bar)

require'feline'.setup {
  colors = { bg = colors.gray, fg = colors.dark_gray },
  components = components,
  vi_mode_colors = vi_mode_colors,
  disable = { filetypes = { "^NvimTree$", "^neo%-tree$" } }
}
