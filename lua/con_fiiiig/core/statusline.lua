--[[ format the statusline ]]

vim.api.nvim_set_hl(0, "Statusline", { bg = "none" });
vim.api.nvim_set_hl(0, "StatuslineNC", { bg = "none" });
vim.api.nvim_set_hl(0, "StatuslineTerm", { bg = "none" });
vim.api.nvim_set_hl(0, "StatuslineTermNC", { bg = "none" });

_G.statusline = {};
_G.statusline.components = {};

_G.statusline.components.filename = function()
	return ("%%#%s#%s%%*"):format("Directory", " %t ");
end

_G.statusline.components.position = function()
	return ("%%#%s#%s%%*"):format("Substitute"," %l:%-c ~ %2p%% ");
end

_G.statusline.components.mode = function()
	local mode = " " .. vim.fn.mode() .. " ";
	local mode_strings = options.mode_strings;

	if mode_strings then
		mode = mode_strings[mode:match("^%s(.-)%s*$")] or mode;        -- match function extracts non-white-space characters
	end

	return ("%%#%s#%s%%*"):format("IncSearch", mode);
end

_G.statusline.components.warnings = function()
	local count = vim.diagnostic.count()[vim.diagnostic.severity.WARN];
	count = count and " " .. count .. " " or "";
	return ("%%#%s#%s%%*"):format("DiffText", count);
end

_G.statusline.components.errors = function()
	local count = vim.diagnostic.count()[vim.diagnostic.severity.ERROR];
	count = count and " " .. count .. " " or "";
	return ("%%#%s#%s%%*"):format("ErrorMsg", count);
end

_G.statusline.format = {
	"%{%v:lua.statusline.components.mode()%}",
	"%{%v:lua.statusline.components.warnings()%}",
	"%{%v:lua.statusline.components.errors()%}",
	"%r", "%w", "%h", "%m", "%=",
	"%{%v:lua.statusline.components.filename()%}",
	"%{%v:lua.statusline.components.position()%}"
};

vim.o.statusline = table.concat(statusline.format, "");                        -- format the statusline
