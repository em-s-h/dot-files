vim.cmd("hi clear")

if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "purpler"
vim.o.termguicolors = true
vim.o.background = "dark"

local function vim_highlights(highlights) -- {{{
	for group_name, group_settings in pairs(highlights) do
		vim.api.nvim_command(
			string.format(
				"highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
				group_name,
				group_settings.fg or "none",
				group_settings.bg or "none",
				group_settings.sp or "none",
				group_settings.fmt or "none"
			)
		)
	end
end -- }}}

local hl = { langs = {}, plugins = {} }

-- old col {{{

-- bg0 = "#121420",
-- bg1 = "#191b27",
-- bg2 = "#262834",
-- bg3 = "#30363f",

-- slate_blue = "#836fff",
-- grey0 = "#bfbfbf",
-- grey1 = "#808080",
-- grey2 = "#404040",

-- }}}

local c = { -- Colors {{{
	-- Diff {{{
	diff_added = "#a4ca88",
	diff_removed = "#e55561",
	diff_file = "#48b0bd",
	diff_index_ln = "#4fa6ed",

	diff_add = "#272e23",
	diff_delete = "#2d2223",
	diff_change = "#172a3a",
	diff_text = "#274964",
	-- }}}

	fg = "#a0a8b7",
	bg0 = "#1f2329",
	bg1 = "#282c34",
	bg2 = "#30363f",
	bg3 = "#323641",

	grey0 = "#7a818e",
	grey1 = "#535965",
	grey2 = "#404040",

	violet0 = "#b597f0",
	violet1 = "#8a5fde",
	violet2 = "#9400d3",

	light_lavander = "#baabc9",
	slate_blue = "#8f7dff",
	orchid = "#cd69c9",

	black = "#0e1013",
	white = "#ececec",

	none = "NONE",
} -- }}}

hl.common = { -- {{{
	-- Other {{{
	Conceal = { fg = c.grey1, bg = c.bg1 },
	QuickFixLine = { fg = c.slate_blue, fmt = "underline" },
	Terminal = { fg = c.fg, bg = c.bg0 },
	ToolbarLine = { fg = c.fg },

	Folded = { fg = c.fg, bg = c.bg2 },
	EndOfBuffer = { fg = c.violet1, bg = c.bg0 },
	Directory = { fg = c.violet1 },
	VertSplit = { fg = c.bg3 },

	ToolbarButton = { fg = c.bg0, bg = c.slate_blue },
	FloatBorder = { fg = c.grey1, bg = c.bg1 },
	NormalFloat = { fg = c.fg, bg = c.bg1 },

	DiffAdd = { fg = c.none, bg = c.diff_add },
	DiffChange = { fg = c.none, bg = c.diff_change },
	DiffDelete = { fg = c.none, bg = c.diff_delete },
	DiffText = { fg = c.none, bg = c.diff_text },
	DiffAdded = c.diff_added,
	DiffRemoved = c.diff_removed,
	DiffFile = c.diff_file,
	DiffIndexLine = c.diff_index_ln,
	-- }}}

	-- Column, Line, Fold {{{
	CursorColumn = { bg = c.bg1 },
	ColorColumn = { bg = c.bg1 },
	SignColumn = { fg = c.fg, bg = c.bg0 },
	FoldColumn = { fg = c.fg, bg = c.bg1 },

	CursorLineNr = { fg = c.white },
	CursorLine = { bg = c.bg1 },
	LineNr = { fg = c.grey1 },

	CursorIM = { fmt = "reverse" },
	vCursor = { fmt = "reverse" },
	iCursor = { fmt = "reverse" },
	lCursor = { fmt = "reverse" },
	Cursor = { fmt = "reverse" },
	-- }}}

	-- Menu, StatusLine, TabLine {{{
	Pmenu = { fg = c.fg, bg = c.bg1 },
	PmenuSbar = { fg = c.none, bg = c.bg1 },
	PmenuSel = { fg = c.white, bg = c.violet1 },
	PmenuThumb = { fg = c.none, bg = c.grey1 },
	WildMenu = { fg = c.white, bg = c.violet1 },

	StatusLine = { fg = c.fg, bg = c.bg2 },
	StatusLineTerm = { fg = c.fg, bg = c.bg2 },
	StatusLineNC = { fg = c.grey1, bg = c.bg1 },
	StatusLineTermNC = { fg = c.grey1, bg = c.bg1 },

	TabLine = { fg = c.fg, bg = c.bg1 },
	TabLineFill = { fg = c.grey1, bg = c.bg1 },
	TabLineSel = { fg = c.white, bg = c.violet1 },
	-- }}}

	-- Messages, Spell, Debug {{{
	ErrorMsg = { fg = c.violet2, fmt = "bold" },
	WarningMsg = { fg = c.orchid, fmt = "bold" },
	MoreMsg = { fg = c.slate_blue, fmt = "bold" },
	Question = { fg = c.violet1 },

	SpellBad = { fg = c.violet2, fmt = "underline", sp = c.violet2 },
	SpellCap = { fg = c.orchid, fmt = "underline", sp = c.orchid },
	SpellLocal = { fg = c.slate_blue, fmt = "underline", sp = c.slate_blue },
	SpellRare = { fg = c.purple, fmt = "underline", sp = c.purple },

	Debug = { fg = c.orchid },
	debugPC = { fg = c.bg0, bg = c.violet0 },
	debugBreakpoint = { fg = c.bg0, bg = c.violet2 },
	-- }}}

	-- Text, Visual, Search {{{
	Comment = { fg = c.grey1, bg = c.bg0 },
	Normal = { fg = c.white, bg = c.bg0 },
	NonText = { fg = c.white },
	SpecialKey = { fg = c.grey2 },
	Whitespace = { fg = c.grey2 },

	CurSearch = { fg = c.bg0, bg = c.violet1 },
	IncSearch = { fg = c.bg0, bg = c.violet1 },
	Search = { fg = c.bg0, bg = c.violet0 },
	Substitute = { fg = c.bg0, bg = c.pink },
	MatchParen = { fg = c.none, bg = c.bg2 },

	Visual = { bg = c.bg3 },
	VisualNOS = { fg = c.none, bg = c.bg2, fmt = "underline" },
	-- }}}
} -- }}}

hl.syntax = { -- {{{
	-- Literals {{{
	String = { fg = c.light_lavander },
	Character = { fg = c.light_lavander },
	Number = { fg = c.slate_blue },
	Float = { fg = c.slate_blue },
	Boolean = { fg = c.slate_blue, fmt = "bold" },
	-- }}}

	-- Types {{{
	Type = { fg = c.violet0 },
	Structure = { fg = c.violet0 },
	StorageClass = { fg = c.violet0 },
	Constant = { fg = c.white },
	-- }}}

	-- Keywords {{{
	Include = { fg = c.orchid },
	Keyword = { fg = c.violet0, fmt = "italic" },
	PreProc = { fg = c.violet1 },
	PreCondit = { fg = c.violet0 },
	Define = { fg = c.violet0 },
	Typedef = { fg = c.violet0 },
	Exception = { fg = c.violet2 },
	Conditional = { fg = c.violet1 },
	Repeat = { fg = c.violet0 },
	Statement = { fg = c.violet0 },
	-- }}}

	Identifier = { fg = c.white },
	-- Macro = colors.Red,
	-- Error = colors.Purple,
	-- Label = colors.Purple,
	-- Special = colors.Red,
	-- SpecialChar = colors.Red,
	-- Function = { fg = c.blue, fmt = cfg.code_style.functions },
	-- Operator = colors.Purple,
	-- Title = colors.Cyan,
	-- Tag = colors.Green,
	-- Delimiter = colors.LightGrey,
	-- Comment = { fg = c.grey, fmt = cfg.code_style.comments },
	-- SpecialComment = { fg = c.grey, fmt = cfg.code_style.comments },
	-- Todo = { fg = c.red, fmt = cfg.code_style.comments },
} -- }}}

-- if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then -- {{{
-- 	hl.treesitter = {
-- 		["@annotation"] = colors.Fg,
-- 		["@attribute"] = colors.Cyan,
-- 		["@boolean"] = colors.Orange,
-- 		["@character"] = colors.Orange,
-- 		["@comment"] = { fg = c.grey, fmt = cfg.code_style.comments },
-- 		["@conditional"] = { fg = c.purple, fmt = cfg.code_style.keywords },
-- 		["@constant"] = colors.Orange,
-- 		["@constant.builtin"] = colors.Orange,
-- 		["@constant.macro"] = colors.Orange,
-- 		["@constructor"] = { fg = c.yellow, fmt = "bold" },
-- 		["@error"] = colors.Fg,
-- 		["@exception"] = colors.Purple,
-- 		["@field"] = colors.Cyan,
-- 		["@float"] = colors.Orange,
-- 		["@function"] = { fg = c.blue, fmt = cfg.code_style.functions },
-- 		["@function.builtin"] = { fg = c.cyan, fmt = cfg.code_style.functions },
-- 		["@function.macro"] = { fg = c.cyan, fmt = cfg.code_style.functions },
-- 		["@include"] = colors.Purple,
-- 		["@keyword"] = { fg = c.purple, fmt = cfg.code_style.keywords },
-- 		["@keyword.function"] = { fg = c.purple, fmt = cfg.code_style.functions },
-- 		["@keyword.operator"] = { fg = c.purple, fmt = cfg.code_style.keywords },
-- 		["@label"] = colors.Red,
-- 		["@method"] = colors.Blue,
-- 		["@namespace"] = colors.Yellow,
-- 		["@none"] = colors.Fg,
-- 		["@number"] = colors.Orange,
-- 		["@operator"] = colors.Fg,
-- 		["@parameter"] = colors.Red,
-- 		["@parameter.reference"] = colors.Fg,
-- 		["@preproc"] = colors.Purple,
-- 		["@property"] = colors.Cyan,
-- 		["@punctuation.delimiter"] = colors.LightGrey,
-- 		["@punctuation.bracket"] = colors.LightGrey,
-- 		["@punctuation.special"] = colors.Red,
-- 		["@repeat"] = { fg = c.purple, fmt = cfg.code_style.keywords },
-- 		["@string"] = { fg = c.green, fmt = cfg.code_style.strings },
-- 		["@string.regex"] = { fg = c.orange, fmt = cfg.code_style.strings },
-- 		["@string.escape"] = { fg = c.red, fmt = cfg.code_style.strings },
-- 		["@symbol"] = colors.Cyan,
-- 		["@tag"] = colors.Purple,
-- 		["@tag.attribute"] = colors.Yellow,
-- 		["@tag.delimiter"] = colors.Purple,
-- 		["@text"] = colors.Fg,
-- 		["@text.strong"] = { fg = c.fg, fmt = "bold" },
-- 		["@text.emphasis"] = { fg = c.fg, fmt = "italic" },
-- 		["@text.underline"] = { fg = c.fg, fmt = "underline" },
-- 		["@text.strike"] = { fg = c.fg, fmt = "strikethrough" },
-- 		["@text.title"] = { fg = c.orange, fmt = "bold" },
-- 		["@text.literal"] = colors.Green,
-- 		["@text.uri"] = { fg = c.cyan, fmt = "underline" },
-- 		["@text.todo"] = { fg = c.red, fmt = cfg.code_style.comments },
-- 		["@text.math"] = colors.Fg,
-- 		["@text.reference"] = colors.Blue,
-- 		["@text.environment"] = colors.Fg,
-- 		["@text.environment.name"] = colors.Fg,
-- 		["@text.diff.add"] = colors.Green,
-- 		["@text.diff.delete"] = colors.Red,
-- 		["@note"] = colors.Fg,
-- 		["@warning"] = colors.Fg,
-- 		["@danger"] = colors.Fg,
-- 		["@type"] = colors.Yellow,
-- 		["@type.builtin"] = colors.Orange,
-- 		["@variable"] = { fg = c.fg, fmt = cfg.code_style.variables },
-- 		["@variable.builtin"] = { fg = c.red, fmt = cfg.code_style.variables },
-- 	} -- }}}
--
-- 	if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then -- {{{
-- 		hl.lsp = {
-- 			["@lsp.type.comment"] = hl.treesitter["@comment"],
-- 			["@lsp.type.enum"] = hl.treesitter["@type"],
-- 			["@lsp.type.enumMember"] = hl.treesitter["@constant.builtin"],
-- 			["@lsp.type.interface"] = hl.treesitter["@type"],
-- 			["@lsp.type.typeParameter"] = hl.treesitter["@type"],
-- 			["@lsp.type.keyword"] = hl.treesitter["@keyword"],
-- 			["@lsp.type.namespace"] = hl.treesitter["@namespace"],
-- 			["@lsp.type.parameter"] = hl.treesitter["@parameter"],
-- 			["@lsp.type.property"] = hl.treesitter["@property"],
-- 			["@lsp.type.variable"] = hl.treesitter["@variable"],
-- 			["@lsp.type.macro"] = hl.treesitter["@function.macro"],
-- 			["@lsp.type.method"] = hl.treesitter["@method"],
-- 			["@lsp.type.number"] = hl.treesitter["@number"],
-- 			["@lsp.type.generic"] = hl.treesitter["@text"],
-- 			["@lsp.type.builtinType"] = hl.treesitter["@type.builtin"],
-- 			["@lsp.typemod.method.defaultLibrary"] = hl.treesitter["@function"],
-- 			["@lsp.typemod.function.defaultLibrary"] = hl.treesitter["@function"],
-- 			["@lsp.typemod.operator.injected"] = hl.treesitter["@operator"],
-- 			["@lsp.typemod.string.injected"] = hl.treesitter["@string"],
-- 			["@lsp.typemod.variable.defaultLibrary"] = hl.treesitter["@variable.builtin"],
-- 			["@lsp.typemod.variable.injected"] = hl.treesitter["@variable"],
-- 			["@lsp.typemod.variable.static"] = hl.treesitter["@constant"],
-- 		}
-- 	end -- }}}
--
-- else -- {{{
-- 	hl.treesitter = {
-- 		TSAnnotation = colors.Fg,
-- 		TSAttribute = colors.Cyan,
-- 		TSBoolean = colors.Orange,
-- 		TSCharacter = colors.Orange,
-- 		TSComment = { fg = c.grey, fmt = cfg.code_style.comments },
-- 		TSConditional = { fg = c.purple, fmt = cfg.code_style.keywords },
-- 		TSConstant = colors.Orange,
-- 		TSConstBuiltin = colors.Orange,
-- 		TSConstMacro = colors.Orange,
-- 		TSConstructor = { fg = c.yellow, fmt = "bold" },
-- 		TSError = colors.Fg,
-- 		TSException = colors.Purple,
-- 		TSField = colors.Cyan,
-- 		TSFloat = colors.Orange,
-- 		TSFunction = { fg = c.blue, fmt = cfg.code_style.functions },
-- 		TSFuncBuiltin = { fg = c.cyan, fmt = cfg.code_style.functions },
-- 		TSFuncMacro = { fg = c.cyan, fmt = cfg.code_style.functions },
-- 		TSInclude = colors.Purple,
-- 		TSKeyword = { fg = c.purple, fmt = cfg.code_style.keywords },
-- 		TSKeywordFunction = { fg = c.purple, fmt = cfg.code_style.functions },
-- 		TSKeywordOperator = { fg = c.purple, fmt = cfg.code_style.keywords },
-- 		TSLabel = colors.Red,
-- 		TSMethod = colors.Blue,
-- 		TSNamespace = colors.Yellow,
-- 		TSNone = colors.Fg,
-- 		TSNumber = colors.Orange,
-- 		TSOperator = colors.Fg,
-- 		TSParameter = colors.Red,
-- 		TSParameterReference = colors.Fg,
-- 		TSProperty = colors.Cyan,
-- 		TSPunctDelimiter = colors.LightGrey,
-- 		TSPunctBracket = colors.LightGrey,
-- 		TSPunctSpecial = colors.Red,
-- 		TSRepeat = { fg = c.purple, fmt = cfg.code_style.keywords },
-- 		TSString = { fg = c.green, fmt = cfg.code_style.strings },
-- 		TSStringRegex = { fg = c.orange, fmt = cfg.code_style.strings },
-- 		TSStringEscape = { fg = c.red, fmt = cfg.code_style.strings },
-- 		TSSymbol = colors.Cyan,
-- 		TSTag = colors.Purple,
-- 		TSTagDelimiter = colors.Purple,
-- 		TSText = colors.Fg,
-- 		TSStrong = { fg = c.fg, fmt = "bold" },
-- 		TSEmphasis = { fg = c.fg, fmt = "italic" },
-- 		TSUnderline = { fg = c.fg, fmt = "underline" },
-- 		TSStrike = { fg = c.fg, fmt = "strikethrough" },
-- 		TSTitle = { fg = c.orange, fmt = "bold" },
-- 		TSLiteral = colors.Green,
-- 		TSURI = { fg = c.cyan, fmt = "underline" },
-- 		TSMath = colors.Fg,
-- 		TSTextReference = colors.Blue,
-- 		TSEnvironment = colors.Fg,
-- 		TSEnvironmentName = colors.Fg,
-- 		TSNote = colors.Fg,
-- 		TSWarning = colors.Fg,
-- 		TSDanger = colors.Fg,
-- 		TSType = colors.Yellow,
-- 		TSTypeBuiltin = colors.Orange,
-- 		TSVariable = { fg = c.fg, fmt = cfg.code_style.variables },
-- 		TSVariableBuiltin = { fg = c.red, fmt = cfg.code_style.variables },
-- 	}
-- end -- }}}
--
-- -- {{{
-- local diagnostics_error_color = cfg.diagnostics.darker and c.dark_red or c.red
-- local diagnostics_hint_color = cfg.diagnostics.darker and c.dark_purple or c.purple
-- local diagnostics_warn_color = cfg.diagnostics.darker and c.dark_yellow or c.yellow
-- local diagnostics_info_color = cfg.diagnostics.darker and c.dark_cyan or c.cyan
-- -- }}}
--
-- hl.plugins.lsp = { -- {{{
-- 	LspCxxHlGroupEnumConstant = colors.Orange,
-- 	LspCxxHlGroupMemberVariable = colors.Orange,
-- 	LspCxxHlGroupNamespace = colors.Blue,
-- 	LspCxxHlSkippedRegion = colors.Grey,
-- 	LspCxxHlSkippedRegionBeginEnd = colors.Red,
--
-- 	DiagnosticError = { fg = c.red },
-- 	DiagnosticHint = { fg = c.purple },
-- 	DiagnosticInfo = { fg = c.cyan },
-- 	DiagnosticWarn = { fg = c.yellow },
--
-- 	DiagnosticVirtualTextError = {
-- 		bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or c.none,
-- 		fg = diagnostics_error_color,
-- 	},
-- 	DiagnosticVirtualTextWarn = {
-- 		bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or c.none,
-- 		fg = diagnostics_warn_color,
-- 	},
-- 	DiagnosticVirtualTextInfo = {
-- 		bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or c.none,
-- 		fg = diagnostics_info_color,
-- 	},
-- 	DiagnosticVirtualTextHint = {
-- 		bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or c.none,
-- 		fg = diagnostics_hint_color,
-- 	},
--
-- 	DiagnosticUnderlineError = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.red },
-- 	DiagnosticUnderlineHint = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.purple },
-- 	DiagnosticUnderlineInfo = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.blue },
-- 	DiagnosticUnderlineWarn = { fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.yellow },
--
-- 	LspReferenceText = { bg = c.bg2 },
-- 	LspReferenceWrite = { bg = c.bg2 },
-- 	LspReferenceRead = { bg = c.bg2 },
--
-- 	LspCodeLens = { fg = c.grey, fmt = cfg.code_style.comments },
-- 	LspCodeLensSeparator = { fg = c.grey },
-- } -- }}}
--
-- -- {{{
-- hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
-- hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
-- hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
-- hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
-- hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
-- hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
-- hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
-- hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
-- hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
-- hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
-- hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
-- hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint
-- -- }}}
--
-- hl.plugins.cmp = { -- {{{
-- 	CmpItemAbbr = colors.Fg,
-- 	CmpItemAbbrDeprecated = { fg = c.grey0, fmt = "strikethrough" },
-- 	CmpItemAbbrMatch = colors.Cyan,
-- 	CmpItemAbbrMatchFuzzy = { fg = c.cyan, fmt = "underline" },
-- 	CmpItemMenu = colors.LightGrey,
-- 	CmpItemKind = { fg = c.purple, fmt = cfg.cmp_itemkind_reverse and "reverse" },
-- } -- }}}
--
-- hl.plugins.telescope = { -- {{{
-- 	TelescopeBorder = colors.Red,
-- 	TelescopePromptBorder = colors.Cyan,
-- 	TelescopeResultsBorder = colors.Cyan,
-- 	TelescopePreviewBorder = colors.Cyan,
-- 	TelescopeMatching = { fg = c.orange, fmt = "bold" },
-- 	TelescopePromptPrefix = colors.Green,
-- 	TelescopeSelection = { bg = c.bg2 },
-- 	TelescopeSelectionCaret = colors.Yellow,
-- } -- }}}
--
-- hl.plugins.indent_blankline = { -- {{{
-- 	IndentBlanklineIndent1 = colors.Blue,
-- 	IndentBlanklineIndent2 = colors.Green,
-- 	IndentBlanklineIndent3 = colors.Cyan,
-- 	IndentBlanklineIndent4 = colors.LightGrey,
-- 	IndentBlanklineIndent5 = colors.Purple,
-- 	IndentBlanklineIndent6 = colors.Red,
-- 	IndentBlanklineChar = { fg = c.bg1, fmt = "nocombine" },
-- 	IndentBlanklineContextChar = { fg = c.grey, fmt = "nocombine" },
-- 	IndentBlanklineContextStart = { sp = c.grey, fmt = "underline" },
-- 	IndentBlanklineContextSpaceChar = { fmt = "nocombine" },
-- } -- }}}
--
-- hl.langs.c = { -- {{{
-- 	cInclude = colors.Blue,
-- 	cStorageClass = colors.Purple,
-- 	cTypedef = colors.Purple,
-- 	cDefine = colors.Cyan,
-- 	cTSInclude = colors.Blue,
-- 	cTSConstant = colors.Cyan,
-- 	cTSConstMacro = colors.Purple,
-- 	cTSOperator = colors.Purple,
-- } -- }}}
--
-- hl.langs.cpp = { -- {{{
-- 	cppStatement = { fg = c.purple, fmt = "bold" },
-- 	cppTSInclude = colors.Blue,
-- 	cppTSConstant = colors.Cyan,
-- 	cppTSConstMacro = colors.Purple,
-- 	cppTSOperator = colors.Purple,
-- } -- }}}
--
-- hl.langs.markdown = { -- {{{
-- 	markdownBlockquote = colors.Grey,
-- 	markdownBold = { fg = c.none, fmt = "bold" },
-- 	markdownBoldDelimiter = colors.Grey,
-- 	markdownCode = colors.Green,
-- 	markdownCodeBlock = colors.Green,
-- 	markdownCodeDelimiter = colors.Yellow,
-- 	markdownH1 = { fg = c.red, fmt = "bold" },
-- 	markdownH2 = { fg = c.purple, fmt = "bold" },
-- 	markdownH3 = { fg = c.orange, fmt = "bold" },
-- 	markdownH4 = { fg = c.red, fmt = "bold" },
-- 	markdownH5 = { fg = c.purple, fmt = "bold" },
-- 	markdownH6 = { fg = c.orange, fmt = "bold" },
-- 	markdownHeadingDelimiter = colors.Grey,
-- 	markdownHeadingRule = colors.Grey,
-- 	markdownId = colors.Yellow,
-- 	markdownIdDeclaration = colors.Red,
-- 	markdownItalic = { fg = c.none, fmt = "italic" },
-- 	markdownItalicDelimiter = { fg = c.grey, fmt = "italic" },
-- 	markdownLinkDelimiter = colors.Grey,
-- 	markdownLinkText = colors.Red,
-- 	markdownLinkTextDelimiter = colors.Grey,
-- 	markdownListMarker = colors.Red,
-- 	markdownOrderedListMarker = colors.Red,
-- 	markdownRule = colors.Purple,
-- 	markdownUrl = { fg = c.blue, fmt = "underline" },
-- 	markdownUrlDelimiter = colors.Grey,
-- 	markdownUrlTitleDelimiter = colors.Green,
-- } -- }}}
--
-- hl.langs.tex = { -- {{{
-- 	latexTSInclude = colors.Blue,
-- 	latexTSFuncMacro = { fg = c.fg, fmt = cfg.code_style.functions },
-- 	latexTSEnvironment = { fg = c.cyan, fmt = "bold" },
-- 	latexTSEnvironmentName = colors.Yellow,
-- 	texCmdEnv = colors.Cyan,
-- 	texEnvArgName = colors.Yellow,
-- 	latexTSTitle = colors.Green,
-- 	latexTSType = colors.Blue,
-- 	latexTSMath = colors.Orange,
-- 	texMathZoneX = colors.Orange,
-- 	texMathZoneXX = colors.Orange,
-- 	texMathDelimZone = colors.LightGrey,
-- 	texMathDelim = colors.Purple,
-- 	texMathOper = colors.Red,
-- 	texCmd = colors.Purple,
-- 	texCmdPart = colors.Blue,
-- 	texCmdPackage = colors.Blue,
-- 	texPgfType = colors.Yellow,
-- } -- }}}
--
-- hl.langs.vim = { -- {{{
-- 	vimOption = colors.Red,
-- 	vimSetEqual = colors.Yellow,
-- 	vimMap = colors.Purple,
-- 	vimMapModKey = colors.Orange,
-- 	vimNotation = colors.Red,
-- 	vimMapLhs = colors.Fg,
-- 	vimMapRhs = colors.Blue,
-- 	vimVar = { fg = c.fg, fmt = cfg.code_style.variables },
-- 	vimCommentTitle = { fg = c.grey0, fmt = cfg.code_style.comments },
-- } -- }}}
--
-- local lsp_kind_icons_color = { -- {{{
-- 	Default = c.purple,
-- 	Array = c.yellow,
-- 	Boolean = c.orange,
-- 	Class = c.yellow,
-- 	Color = c.green,
-- 	Constant = c.orange,
-- 	Constructor = c.blue,
-- 	Enum = c.purple,
-- 	EnumMember = c.yellow,
-- 	Event = c.yellow,
-- 	Field = c.purple,
-- 	File = c.blue,
-- 	Folder = c.orange,
-- 	Function = c.blue,
-- 	Interface = c.green,
-- 	Key = c.cyan,
-- 	Keyword = c.cyan,
-- 	Method = c.blue,
-- 	Module = c.orange,
-- 	Namespace = c.red,
-- 	Null = c.grey,
-- 	Number = c.orange,
-- 	Object = c.red,
-- 	Operator = c.red,
-- 	Package = c.yellow,
-- 	Property = c.cyan,
-- 	Reference = c.orange,
-- 	Snippet = c.red,
-- 	String = c.green,
-- 	Struct = c.purple,
-- 	Text = c.grey0,
-- 	TypeParameter = c.red,
-- 	Unit = c.green,
-- 	Value = c.orange,
-- 	Variable = c.purple,
-- } -- }}}

vim_highlights(hl.common)
vim_highlights(hl.syntax)
-- vim_highlights(hl.plugins.lsp)
