--[[ essential plugins for my workflow ]]

return {
	-- utility neovim functions used by other plugins
	{
		"nvim-lua/plenary.nvim",
		name = "plenary.nvim",                                                -- naming this "plenary" cause two installs as lazy already installs "plenary.nvim"
		priority = 500                                                        -- second highest priority level
	},

	-- quick buffer switcher
	{
		"ThePrimeagen/Harpoon",
		name = "harpoon",
		branch = "harpoon2",
		dependencies = { "plenary.nvim" },
		opts = {
			settings = {
				save_on_toggle = true
			}
		}
	},

	-- fuzzy finder and picker
	{
		"nvim-telescope/telescope.nvim",
		name = "telescope",
		branch = "0.1.x",
		dependencies = { "plenary.nvim", "devicons" },
		opts = {
			pickers = {
				buffers = {
					initial_mode = "normal"
				}
			}
		}
	},

	-- better parsing and syntax trees
	{
		"nvim-treesitter/nvim-treesitter",
		name = "treesitter",
		build = ":TSUpdate",
		init = function(plugin)
			require("lazy.core.loader").add_to_rtp(plugin);                   -- some plugins use these queries but do not explicitly load treesitter so we add it to runtime
			require("nvim-treesitter.query_predicates");                      -- avoids and loading issues by already loading the predicates
			require("nvim-treesitter.install").prefer_git = true;             -- prefer parser installations via git
		end,
		opts = {
			ensure_installed = { "lua", "vimdoc", "comment" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			}
		}
	}
};
