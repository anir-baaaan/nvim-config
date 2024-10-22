--[[ some initial preparatory setup ]]

vim.cmd.colorscheme("habamax");

-- make custom options available globally
local has_custom_options_file = pcall(require, "options");
if has_custom_options_file then
	_G.options = require("options");
else
	_G.options = require("con_fiiiig.default_options");
end

-- some reusable global consts
_G.consts = {};
_G.consts.augroup_name = "au_grrrroup";
_G.consts.command_prefix = "CMD";

-- create augroup for custom autocommands
vim.api.nvim_create_augroup(consts.augroup_name, {
	clear = true
});

-- global shortened mapping functions
_G.map = vim.keymap.set;
_G.nmap = function(...) map("n", ...) end;

-- global function for keypress emulation
_G.emulate_keys = function(keys, mode)
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes(keys, true, true, true),
		mode,
		false
	);
end
