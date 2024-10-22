--[[ bootstrap lazy.nvim as the package manager ]]

-- download lazy if not already available and add to runtime paths
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim";
local is_lazy_not_installed = not (vim.uv or vim.loop).fs_stat(lazypath);

if is_lazy_not_installed then
	local git_clone_output = vim.fn.system({
		"git", "clone", "--filter=blob:none", "--branch=stable",
		"https://github.com/folke/lazy.nvim.git", lazypath
	});

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ git_clone_output, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {});
		vim.fn.getchar();
		os.exit(1);
	end
end
vim.opt.rtp:prepend(lazypath);

-- setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "con_fiiiig.plugin.lists" },
	},
	install = { colorscheme = { "onedark", "habamax" } },
	checker = { enabled = true, notify = false }                            -- check for updates but don't notify
});


-- initiate plugin keymaps after the plugins have been loaded
vim.api.nvim_create_autocmd("VimEnter", {
	group = consts.augroup_name,
	callback = function()
		require("con_fiiiig.plugin.keymaps");
	end
});
