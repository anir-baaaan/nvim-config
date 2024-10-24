--[[ default editable configuration options ]]

return {
	intial_colorcolumn = "0",
	initial_expand_tabs = false,
	initial_tab_length = 4,
	lsp_setup = {
		lua_ls = { settings = { Lua = { callSnippet = "Replace" } } }
	},
	cloak_patterns = {
		file_pattern = {},
		cloak_pattern = {},
		replace = nil
	},
	mode_strings = {
		["n"] = " Normal ", ["niI"] = " Insert [Normal] ",
		["niR"] = " Replace [Normal] ",
		["nt"] = " Terminal [Normal] ", ["i"] = " Insert ",
		["R"] = " Replace ", ["v"] = " Visual ",
		["V"] = " Visual [Line] ", [""] = " Visual [Block] ",
		["c"] = " Command ", ["!"] = " Command [External] ",
		["t"] = " Terminal "
	}
};
