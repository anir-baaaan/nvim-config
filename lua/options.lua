return {
	intial_colorcolumn = "79",
	initial_expand_tabs = false,
	initial_tab_length = 8,
	lsp_setup = {
		lua_ls = {
			settings = {
				Lua = {
					callSnippet = "Replace"
				}
			}
		}
	},
	mode_strings = {
		["n"] = " Normal ", ["niI"] = " Insert [Normal] ",
		["niR"] = " Replace [Normal] ", ["nt"] = " Terminal [Normal] ",
		["i"] = " Insert ", ["R"] = " Replace ", ["v"] = " Visual ",
		["V"] = " Visual [Line] ", [""] = " Visual [Block] ",
		["c"] = " Command ", ["!"] = " Command [External] ",
		["t"] = " Terminal "
	}
};