local custom_gruvbox = require'lualine.themes.gruvbox'

local bg_color = "#0b0822"
local fg_color = "#ffffff"

-- Change the background of lualine_a section for normal mode
custom_gruvbox.normal.a.bg = bg_color
custom_gruvbox.insert.a.bg = bg_color
custom_gruvbox.visual.a.bg = bg_color
custom_gruvbox.replace.a.bg = bg_color
custom_gruvbox.command.a.bg = bg_color
custom_gruvbox.inactive.a.bg = bg_color

-- Change the background of lualine_b section for normal mode
custom_gruvbox.normal.b.bg = bg_color
custom_gruvbox.insert.b.bg = bg_color
custom_gruvbox.visual.b.bg = bg_color
custom_gruvbox.replace.b.bg = bg_color
custom_gruvbox.command.b.bg = bg_color
custom_gruvbox.inactive.b.bg = bg_color

-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = bg_color
custom_gruvbox.insert.c.bg = bg_color
custom_gruvbox.visual.c.bg = bg_color
custom_gruvbox.replace.c.bg = bg_color
custom_gruvbox.command.c.bg = bg_color
custom_gruvbox.inactive.c.bg = bg_color

-- Change the foreground of lualine_a section for normal mode
custom_gruvbox.normal.a.fg = fg_color
custom_gruvbox.normal.b.fg = fg_color
custom_gruvbox.normal.c.fg = fg_color

custom_gruvbox.insert.a.fg = fg_color
custom_gruvbox.insert.b.fg = fg_color
custom_gruvbox.insert.c.fg = fg_color

custom_gruvbox.visual.a.fg = fg_color
custom_gruvbox.visual.b.fg = fg_color
custom_gruvbox.visual.c.fg = fg_color

custom_gruvbox.replace.a.fg = fg_color
custom_gruvbox.replace.b.fg = fg_color
custom_gruvbox.replace.c.fg = fg_color

custom_gruvbox.command.a.fg = fg_color
custom_gruvbox.command.b.fg = fg_color
custom_gruvbox.command.c.fg = fg_color

custom_gruvbox.inactive.a.fg = fg_color
custom_gruvbox.inactive.b.fg = fg_color
custom_gruvbox.inactive.c.fg = fg_color

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    -- lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

local lualine = require('lualine')

