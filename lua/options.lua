return {
	intial_colorcolumn = "79",
	initial_expand_tabs = false,
	initial_tab_length = 8,
	lsp_setup = {
		lua_ls = { settings = { Lua = { callSnippet = "Replace" } } }
	},
	cloak_patterns = {
		file_pattern = { "*.env", ".env*", "*secret*.json" },
		cloak_pattern = { "=.+", ":.+" },
		replace = nil
	},
	mode_strings = {
		["n"] = " normal ", ["niI"] = " insert [normal] ",
		["niR"] = " replace [normal] ", ["nt"] = " terminal [normal] ",
		["i"] = " insert ",
		["R"] = " replace ",
		["v"] = " visual ",
		["V"] = " visual [line] ",
		[""] = " visual [block] ",
		["c"] = " command ",
		["!"] = " command [external] ",
		["t"] = " terminal "
	}
};
