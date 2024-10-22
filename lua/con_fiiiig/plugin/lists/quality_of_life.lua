--[[ plugins that are good to have but I can live without ]]

return {
	-- pretty diagnostics list
	{
		"folke/trouble.nvim",
		name = "trouble",
		dependencies = { "devicons" },
		opts = {}
	},

	-- undo history in a tree format
	{
		"mbbill/undotree",
		name = "undotree"
	},

	-- highlighting for special commane tags
	{
		"folke/todo-comments.nvim",
		name = "todo_comments",
		dependencies = { "plenary.nvim", "telescope" },
		opts = {}
	},

	-- fast comment lines or blocks of code
	{
		"numToStr/Comment.nvim",
		name = "comment",
		opts = {
			mappings = {
				basic = false,
				extra = false
			}
		}
	},

	-- color picker
	{
		"uga-rosa/ccc.nvim",
		name = "color_picker",
		opts = {}
	}
};
