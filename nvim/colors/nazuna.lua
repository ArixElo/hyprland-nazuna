local M = {}

M.colors = {
  bg = "#0b0b16",
  bg_alt = "#121224",
  bg_dark = "#090912",
  fg = "#e8def8",
  muted = "#8f87a8",
  comment = "#6f6790",

  purple = "#c08cff",
  lavender = "#9f7aea",
  pink = "#ff7ac6",
  magenta = "#e76fff",
  blue = "#73c7ff",
  cyan = "#78f0ff",
  teal = "#5fe3c2",
  yellow = "#ffd37a",
  orange = "#ff9f6e",
  red = "#ff6b8a",
  green = "#8df29a",
  line = "#1d1d33",
  border = "#2a2740",
}

local c = M.colors

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  vim.o.termguicolors = true
  vim.o.background = "dark"

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "nazuna"

  hl("Normal", { fg = c.fg, bg = c.bg })
  hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
  hl("FloatBorder", { fg = c.border, bg = c.bg_alt })
  hl("FloatTitle", { fg = c.pink, bg = c.bg_alt, bold = true })

  hl("CursorLine", { bg = c.bg_alt })
  hl("CursorColumn", { bg = c.bg_alt })
  hl("ColorColumn", { bg = c.bg_dark })
  hl("LineNr", { fg = c.comment })
  hl("CursorLineNr", { fg = c.pink, bold = true })
  hl("SignColumn", { bg = c.bg })
  hl("VertSplit", { fg = c.border })
  hl("WinSeparator", { fg = c.border })
  hl("StatusLine", { fg = c.fg, bg = c.bg_alt })
  hl("StatusLineNC", { fg = c.muted, bg = c.bg_alt })

  hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
  hl("PmenuSel", { fg = c.bg, bg = c.purple, bold = true })
  hl("PmenuSbar", { bg = c.bg_dark })
  hl("PmenuThumb", { bg = c.border })

  hl("Visual", { bg = "#2a1d3f" })
  hl("Search", { fg = c.bg, bg = c.yellow, bold = true })
  hl("IncSearch", { fg = c.bg, bg = c.pink, bold = true })

  hl("Comment", { fg = c.comment, italic = true })
  hl("Constant", { fg = c.cyan })
  hl("String", { fg = c.green })
  hl("Character", { fg = c.green })
  hl("Number", { fg = c.orange })
  hl("Boolean", { fg = c.magenta, bold = true })
  hl("Float", { fg = c.orange })

  hl("Identifier", { fg = c.blue })
  hl("Function", { fg = c.purple, bold = true })
  hl("Statement", { fg = c.pink, bold = true })
  hl("Conditional", { fg = c.lavender, bold = true })
  hl("Repeat", { fg = c.lavender, bold = true })
  hl("Label", { fg = c.pink })
  hl("Operator", { fg = c.fg })
  hl("Keyword", { fg = c.pink, bold = true })
  hl("Exception", { fg = c.red, bold = true })

  hl("PreProc", { fg = c.purple })
  hl("Include", { fg = c.blue })
  hl("Define", { fg = c.pink })
  hl("Macro", { fg = c.purple })
  hl("PreCondit", { fg = c.pink })

  hl("Type", { fg = c.teal })
  hl("StorageClass", { fg = c.lavender })
  hl("Structure", { fg = c.teal })
  hl("Typedef", { fg = c.teal })

  hl("Special", { fg = c.yellow })
  hl("SpecialChar", { fg = c.pink })
  hl("Tag", { fg = c.blue })
  hl("Delimiter", { fg = c.fg })
  hl("SpecialComment", { fg = c.comment, italic = true })
  hl("Debug", { fg = c.red })

  hl("Underlined", { fg = c.blue, underline = true })
  hl("Bold", { bold = true })
  hl("Italic", { italic = true })

  hl("Error", { fg = c.red, bold = true })
  hl("ErrorMsg", { fg = c.red, bg = c.bg_dark, bold = true })
  hl("WarningMsg", { fg = c.yellow, bold = true })
  hl("MoreMsg", { fg = c.green, bold = true })
  hl("ModeMsg", { fg = c.pink, bold = true })

  hl("DiagnosticError", { fg = c.red })
  hl("DiagnosticWarn", { fg = c.yellow })
  hl("DiagnosticInfo", { fg = c.blue })
  hl("DiagnosticHint", { fg = c.cyan })

  hl("DiffAdd", { fg = c.green, bg = "#12231a" })
  hl("DiffChange", { fg = c.blue, bg = "#132336" })
  hl("DiffDelete", { fg = c.red, bg = "#2a1620" })
  hl("DiffText", { fg = c.cyan, bg = "#17314a", bold = true })

  hl("Todo", { fg = c.bg, bg = c.yellow, bold = true })

  hl("TabLine", { fg = c.muted, bg = c.bg_alt })
  hl("TabLineSel", { fg = c.pink, bg = c.bg, bold = true })
  hl("TabLineFill", { bg = c.bg_alt })

  hl("NvimTreeNormal", { fg = c.fg, bg = c.bg })
  hl("NvimTreeFolderName", { fg = c.blue })
  hl("NvimTreeOpenedFolderName", { fg = c.purple, bold = true })
  hl("NvimTreeIndentMarker", { fg = c.border })

  hl("TelescopeNormal", { fg = c.fg, bg = c.bg_alt })
  hl("TelescopeBorder", { fg = c.border, bg = c.bg_alt })
  hl("TelescopePromptNormal", { fg = c.fg, bg = c.bg_dark })
  hl("TelescopePromptBorder", { fg = c.bg_dark, bg = c.bg_dark })
  hl("TelescopeSelection", { fg = c.bg, bg = c.pink, bold = true })

  hl("GitSignsAdd", { fg = c.green })
  hl("GitSignsChange", { fg = c.blue })
  hl("GitSignsDelete", { fg = c.red })
end

return M
