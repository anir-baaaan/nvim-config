--[[ development tools lsp, completion, debuggers, etc ]]

-- NOTE : The order of setup of these plugins is important
-- mason > mason_lspconfig > cmp_lsp > lspconfig
-- lazydev + all cmp dependencies >  cmp

return {
	-- installing of dev tools like lsps, debuggers, etc
	{
		"williamboman/mason.nvim",
		name = "mason",
		opts = {
			ui = {
				icons = {
					package_installed = "● ",
					package_pending = "!",
					package_uninstalled = "○ "
				}
			}
		}
	},

	-- bridge between mason and lspconfig plugin
	{
		"williamboman/mason-lspconfig.nvim",
		name = "mason_lspconfig",
		dependencies = { "mason" },
		config = function()
			local ensure_installed_lsps = {};

			for lsp_name, _ in pairs(options.lsp_setup) do
				table.insert(ensure_installed_lsps, lsp_name);
			end

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed_lsps,
				automatic_installation = true
			});
		end
	},

	-- quick ready-made configurations for most lsps
	{
		"neovim/nvim-lspconfig",
		name = "lspconfig",
		dependencies = { "mason", "mason_lspconfig", "cmp_lsp" },      -- not dependencies, but manages load order / configuration order
		config = function()
			local lspconfig = require("lspconfig");

			for lsp_name, opts in pairs(options.lsp_setup) do
				local cmp_nvim_lsp = require("cmp_nvim_lsp");
				opts.capabilities = cmp_nvim_lsp.default_capabilities();
				lspconfig[lsp_name].setup(opts);
			end
		end
	},

	-- better lsp experience
	{
		"nvimdev/lspsaga.nvim",
		name = "lspsaga",
		dependencies = { "treesitter", "devicons" },
		opts = {}
	},

	-- lsp configuration, completions and signatures for neovim config api
	{
		"folke/lazydev.nvim",
		name = "lazydev",
		opts = {}
	},

	-- completion hook for lsps
	{ "hrsh7th/cmp-nvim-lsp", name = "cmp_lsp" },                          -- extracted from nvim_cmp.dependencies as it is also used by lspconfig

	-- code completion engine
	{
		"hrsh7th/nvim-cmp",
		name = "cmp",
		dependencies = {
			"lazydev",                                             -- not a dependency, but manages load order / configuration order
			"cmp_lsp",
			{ "hrsh7th/cmp-buffer", name = "cmp_buffer" },
			{ "hrsh7th/cmp-path", name = "cmp_path" },
			{ "hrsh7th/cmp-cmdline", name = "cmp_cmdline" },

			{ "L3MON4D3/LuaSnip", name = "luasnip" },
			{ "saadparwaiz1/cmp_luasnip", name = "cmp_luasnip" }

		},
		config = function()
			local cmp = require("cmp");

			cmp.setup({
				view = { docs = { auto_open = false } },
				snippet = { expand = function(args) require("luasnip").lsp_expand(args.body); end },
				sources = cmp.config.sources({
					{ name = "lazydev" }
				}, {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "path" },
					{ name = "buffer" }
				})
			});

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } }
			});

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						options = { ignore_cmds = { "Man", "!" } }
					}
				})
			});
		end
	}
};

