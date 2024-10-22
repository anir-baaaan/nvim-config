--[[ plugins affecting the aesthetics of nvim ]]

return {
	-- theme
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		opts = {
			ending_tildes = true,
			highlights = {
				["Statusline"] = { bg = "none" },
				["StatuslineNC"] = { bg = "none" },
				["StatuslineTerm"] = { bg = "none" },
				["StatuslineTermNC"] = { bg = "none" }
			}
		},
		config = function(_, opts)
			require("onedark").setup(opts);
			require("onedark").load();
		end
	},

	-- adds icons to netrw
	{
		"prichrd/netrw.nvim",
		name = "netrw",
		dependencies = { "devicons" },
		opts = {}
	},

	-- icons set used by other plugins
	{
		"nvim-tree/nvim-web-devicons",
		name = "devicons",
		priority = 500,                                                       -- second highest priority
		opts = {}
	}
};
