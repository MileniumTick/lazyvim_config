local M = {}

M.palette = {
  bg = "#0b1020",
  bg_dark = "#070b16",
  bg_float = "#0f1528",
  bg_highlight = "#141c34",
  bg_sidebar = "#0a0f1f",
  border = "#273354",
  comment = "#5f6e97",
  cyan = "#58e1c1",
  fg = "#d8def5",
  fg_dark = "#9aa7cb",
  fg_gutter = "#334268",
  green = "#7ce38b",
  magenta = "#f094fd",
  orange = "#ffb86c",
  purple = "#bc9cff",
  red = "#ff7d93",
  selection = "#1b2543",
  blue = "#7aa2ff",
  yellow = "#ffd166",
}

function M.apply_tokyonight_colors(colors)
  for key, value in pairs(M.palette) do
    colors[key] = value
  end

  colors.black = M.palette.bg_dark
  colors.bg_popup = M.palette.bg_float
  colors.bg_search = M.palette.selection
  colors.border_highlight = M.palette.blue
  colors.error = M.palette.red
  colors.git = {
    add = M.palette.green,
    change = M.palette.blue,
    delete = M.palette.red,
  }
  colors.hint = M.palette.cyan
  colors.info = M.palette.blue
  colors.none = "NONE"
  colors.terminal_black = M.palette.bg_dark
  colors.todo = M.palette.yellow
  colors.warning = M.palette.orange
end

function M.apply_tokyonight_highlights(hl, colors)
  local bg_dark = colors.bg_dark or M.palette.bg_dark
  local bg_float = colors.bg_float or M.palette.bg_float
  local bg_highlight = colors.bg_highlight or M.palette.bg_highlight
  local blue = colors.blue or M.palette.blue
  local border = colors.border or M.palette.border
  local cyan = colors.cyan or M.palette.cyan
  local fg = colors.fg or M.palette.fg
  local fg_dark = colors.fg_dark or M.palette.fg_dark
  local green = colors.green or M.palette.green
  local purple = colors.purple or M.palette.purple
  local red = colors.red or M.palette.red
  local selection = colors.selection or M.palette.selection
  local yellow = colors.yellow or M.palette.yellow

  hl.ColorColumn = { bg = bg_highlight }
  hl.CursorLine = { bg = bg_highlight }
  hl.CursorLineNr = { fg = yellow, bold = true }
  hl.FloatBorder = { fg = border, bg = bg_float }
  hl.FloatTitle = { fg = blue, bg = bg_float, bold = true }
  hl.FoldColumn = { fg = colors.fg_gutter, bg = colors.bg }
  hl.IncSearch = { fg = bg_dark, bg = yellow, bold = true }
  hl.LspInlayHint = { fg = fg_dark, bg = bg_float, italic = true }
  hl.MatchParen = { fg = cyan, bg = selection, bold = true }
  hl.NormalFloat = { bg = bg_float }
  hl.Pmenu = { bg = bg_float }
  hl.PmenuSel = { fg = fg, bg = selection, bold = true }
  hl.Search = { fg = fg, bg = selection }
  hl.SnacksIndent = { fg = colors.fg_gutter }
  hl.SnacksIndentScope = { fg = blue }
  hl.StatusLine = { fg = fg, bg = bg_dark }
  hl.StatusLineNC = { fg = fg_dark, bg = bg_dark }
  hl.TelescopeBorder = { fg = border, bg = bg_float }
  hl.TelescopeNormal = { bg = bg_float }
  hl.TelescopePromptBorder = { fg = blue, bg = bg_float }
  hl.TelescopePromptTitle = { fg = bg_dark, bg = blue, bold = true }
  hl.TelescopePreviewTitle = { fg = bg_dark, bg = purple, bold = true }
  hl.TelescopeResultsTitle = { fg = bg_dark, bg = cyan, bold = true }
  hl.Visual = { bg = selection }
  hl.WinSeparator = { fg = border }

  hl.BufferLineFill = { bg = bg_dark }
  hl.BufferLineIndicatorSelected = { fg = blue, bg = colors.bg }
  hl.BufferLineSeparator = { fg = bg_dark, bg = bg_dark }
  hl.BufferLineSeparatorSelected = { fg = colors.bg, bg = colors.bg }
  hl.BufferLineBufferSelected = { fg = fg, bg = colors.bg, bold = true }

  hl.NeoTreeNormal = { bg = colors.bg_sidebar }
  hl.NeoTreeNormalNC = { bg = colors.bg_sidebar }
  hl.NeoTreeFloatBorder = { fg = border, bg = colors.bg_sidebar }
  hl.NeoTreeTitleBar = { fg = bg_dark, bg = blue, bold = true }

  hl.NotifyINFOBorder = { fg = blue, bg = bg_float }
  hl.NotifyWARNBorder = { fg = yellow, bg = bg_float }
  hl.NotifyERRORBorder = { fg = red, bg = bg_float }
  hl.NotifyDEBUGBorder = { fg = fg_dark, bg = bg_float }
  hl.NotifyTRACEBorder = { fg = green, bg = bg_float }
end

return M
