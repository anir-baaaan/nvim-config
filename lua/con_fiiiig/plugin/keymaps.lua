--[[ keymaps for plugins ]]

-- manager/lazy 
nmap(
	"<leader>lz", "<cmd>Lazy<CR>",
	{ desc = "opens the lazy installer window" }
);

-- essentials/harpoon 
local harpoon = require("harpoon");

nmap(
	"<leader>ha", function() harpoon:list():add(); end,
	{ desc = "add file to harpoon list" }
);
nmap(
	"<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()); end,
	{ desc = "open harpoon list" }
);

nmap(
	"<leader>1", function() harpoon:list():select(1); end,
	{ desc = "go to the first file in harpoon list" }
);
nmap(
	"<leader>2", function() harpoon:list():select(2); end,
	{ desc = "go to the second file in harpoon list" }
);
nmap(
	"<leader>3", function() harpoon:list():select(3); end,
	{ desc = "go to the third file in harpoon list" }
);
nmap(
	"<leader>4", function() harpoon:list():select(4); end,
	{ desc = "go to the fourth file in harpoon list" }
);
nmap(
	"<leader>5", function() harpoon:list():select(5); end,
	{ desc = "go to the fifth file in harpoon list" }
);

nmap(
	"]h", function() harpoon:list():next(); end,
	{ desc = "go to the next file in harpoon list" }
);
nmap(
	"[h", function() harpoon:list():prev(); end,
	{ desc = "go to the previous file in harpoon list" }
);

-- essentials/telescope
local telescope_builtin = require("telescope.builtin");

nmap(
	"<leader>/", telescope_builtin.current_buffer_fuzzy_find,
	{ desc = "fuzzy find through current buffer" }
);
nmap(
	"<leader>ff", telescope_builtin.find_files,
	{ desc = "fuzzy find through project files" }
);
nmap(
	"<leader>fh", telescope_builtin.help_tags,
	{ desc = "fuzzy find through neovim help tags" }
);
nmap(
	"<leader>fn", function() telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") }); end,
	{ desc = "fuzzy find through neovim config files" }
);
nmap(
	"<leader>fo", telescope_builtin.oldfiles,
	{ desc = "fuzzy find through recent files" }
);
nmap(
	"<leader>fk", telescope_builtin.keymaps,
	{ desc = "fuzzy find through all keymaps" }
);
nmap(
	"<leader>fg", telescope_builtin.live_grep,
	{ desc = "fuzzy find through grep results live" }
);
nmap(
	"<leader>fr", telescope_builtin.registers,
	{ desc = "fuzzy find through vim registers" }
);
nmap(
	"<leader>fb", telescope_builtin.buffers,
	{ desc = "fuzzy find through all open buffers" }
);
nmap(
	"<leader>fc", telescope_builtin.commands,
	{ desc = "fuzzy find through all commands" }
);
nmap(
	"gr", require("telescope.builtin").lsp_references,
	{ desc = "fuzzy find through the references of the word under cursor" }
);
nmap(
	"gI", require("telescope.builtin").lsp_implementations,
	{ desc = "fuzzy find throught the implemtations of word under cursor" }
);

-- dev_tools/mason
nmap(
	"<leader>mn", "<cmd>Mason<CR>",
	{ desc = "opens the mason installer window" }
);

-- dev_tools/lspsaga
nmap(
	"<leader>ca", "<cmd>Lspsaga code_action<CR>",
	{ desc = "open code actions for diagnostics under cursor" }
);
nmap(
	"gd", "<cmd>Lspsaga goto_definition<CR>",
	{ desc = "goto the definition of the term under cursor" }
);
nmap(
	"gt", "<cmd>Lspsaga goto_type_definition<CR>",
	{ desc = "goto the type definition of the term under cursor" }
);
nmap(
	"gp", "<cmd>Lspsaga peek_definition<CR>",
	{ desc = "peek the definition of the term under cursor" }
);
nmap(
	"gP", "<cmd>Lspsaga peek_type_definition<CR>",
	{ desc = "peek the type definition of the term under cursor" }
);
nmap(
	"]d", "<cmd>Lspsaga diagnostic_jump_next<CR>",
	{ desc = "jump to the next diagnostic" }
);
nmap(
	"[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>",
	{ desc = "jump to the previous diagnostic" }
);
map(
	{ "n", "t" }, "<leader>tr", "<cmd>Lspsaga term_toggle<CR>",
	{ desc = "toggle terminal" }
);
nmap(
	"K", "<cmd>Lspsaga hover_doc<CR>",
	{ desc = "show the docs for the term under the cursor" }
);
nmap(
	"<C-k>", "<cmd>Lspsaga hover_doc<CR>",
	{ desc = "show the docs for the term under the cursor" }
);
nmap(
	"<leader>rn", "<cmd>Lspsaga rename<CR>",
	{ desc = "rename term under cursor using lsp" }
);

-- dev_tools/nvim_cmp
local cmp = require("cmp");
local luasnip = require("luasnip");

map(
	{ "i", "s" }, "<C-k>",
	function()
		if cmp.visible_docs() then
			cmp.close_docs();
		elseif cmp.visible() then
			cmp.open_docs();
		end
	end,
	{ desc = "toggle completion documentation window" }
);
map(
	{ "i", "s", "n" }, "<C-f>", function() cmp.scroll_docs(-1); end,
	{ desc = "scroll down completion docs" }
);
map(
	{ "i", "s", "n" }, "<C-b>", function() cmp.scroll_docs(1); end,
	{ desc = "scroll up completion docs" }
);
map(
	{ "i", "s" }, "<Tab>",
	function()
		if cmp.visible() then
			cmp.select_next_item();
		elseif luasnip.expand_or_locally_jumpable() then
			luasnip.expand_or_jump();
		else
			emulate_keys(vim.keycode("<Tab>"), "ni");
		end
	end,
	{ desc = "select next completion suggestion" }

);
map(
	{ "i", "s" }, "<S-Tab>",
	function()
		if cmp.visible() then
			cmp.select_prev_item();
		elseif luasnip.locally_jumpable(-1) then
			luasnip.jump(-1);
		else
			emulate_keys(vim.keycode("<S-Tab>"), "ni");
		end
	end,
	{ desc = "select previous completion suggestion" }
);
map(
	{ "i", "s" }, "<CR>",
	function()
		if not cmp.visible() and not cmp.get_active_entry() then
			emulate_keys(vim.keycode("<CR>"), "ni");
			return;
		end

		if not cmp.confirm({ select = false }) then
			emulate_keys(vim.keycode("<CR>"), "ni");
		end
	end,
	{ desc = "pick selected completion suggestion" }
);

-- quality_of_life/trouble
nmap(
	"<leader>td", "<cmd>Trouble diagnostics toggle<CR>",
	{ desc = "open project wide trouble diagnostics" }
);
nmap(
	"<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "open trouble diagnostics for current buffer" }
);

-- quality_of_life/undotree
nmap(
	"U", "<cmd>UndotreeToggle<CR>",
	{ desc = "toggle the undo history tree" }
);

-- quality_of_life/todo_comment
local todo_comments = require("todo-comments");

nmap(
	"]t", function() todo_comments.jump_next(); end,
	{ desc = "jump to the next todo comment" }
);
nmap(
	"[t", function() todo_comments.jump_prev(); end,
	{ desc = "jump to the previous todo comment" }
);
nmap(
	"tl", "<cmd>TodoQuickFix<CR>",
	{ desc = "show all todo comments in project quick fix list" }
);

-- quality_of_life/comment
nmap(
	"<C-c>", "<Plug>(comment_toggle_linewise)",
	{ desc = "leader for linewise commenting motions" }
);
nmap(
	"<C-x>", "<Plug>(comment_toggle_blockwise)",
	{ desc = "leader for blockwise commenting motions" }
);

nmap(
	"<C-c><C-c>",
	function()
		return vim.api.nvim_get_vvar("count") == 0 and
		"<plug>(comment_toggle_linewise_current)" or
		"<plug>(comment_toggle_linewise_count)"
	end,
	{ expr = true, desc = "toggle single line commenting of the line" }
);
nmap(
	"<C-x><C-x>",
	function()
		return vim.api.nvim_get_vvar("count") == 0 and
		"<plug>(comment_toggle_blockwise_current)" or
		"<plug>(comment_toggle_blockwise_count)"
	end,
	{ expr = true, desc = "toggle block commenting of the line" }
);

map(
	"x", "<C-c><C-c>", "<Plug>(comment_toggle_linewise_visual)",
	{ desc = "toggle single line commenting selection" }
);
map(
	"x", "<C-x><C-x>", "<Plug>(comment_toggle_blockwise_visual)",
	{ desc = "toggle block commenting selection" }
);

-- quality_of_life/color_picker
nmap(
	"<leader>cp", "<cmd>CccPick<CR>",
	{ desc = "pick a color" }
);
nmap(
	"<leader>ch", "<cmd>CccHighlighterToggle<CR>",
	{ desc = "toggle color highlighting" }
);
nmap(
	"<leader>cc", "<cmd>CccConvert<CR>",
	{ desc = "convert color into other forms" }
);
