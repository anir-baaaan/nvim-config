--[[ set keymaps concerning stuff available in core neovim ]]

vim.g.mapleader = " ";
vim.g.maplocalleader = "//";

-- open messages
nmap(
	"<leader>ms", "<cmd>messages<CR>", 
	{ desc = "open the messages window" }
);

-- netrw
local netrw_extn = require("con_fiiiig.core.netrw_extn");
nmap(
	"<leader>e", netrw_extn.toggle_sidebar,
	{ desc = "open the netrw sidebar" }
);
nmap(
	"<leader>E", netrw_extn.toggle_full,
	{ desc = "open the netrw fullscreen explorer" }
);

-- live option changes
--nmap(
--	"<leader>cl",
--	"<cmd>" .. custom_commands["ChangeColorColumn"] .. "<CR>",
--	{ desc = "change the color column position" }
--);
--nmap(
--	"<leader>in",
--	"<cmd>" .. custom_commands["ChangeIndentation"] .. "<CR>",
--	{ desc = "change indentation style and tab length" }
--);

-- moving text
-- NOTE: using "<cmd>" instead of ":" breaks these commands
nmap(
	"<M-j>", "v:m '>+1<CR>gv=<Esc>",
	{ desc = "move the current line up" }
);
nmap(
	"<M-k>", "v:m '<-2<CR>gv=<Esc>",
	{ desc = "move the current line down" }
);
map(
	"v", "<M-j>", ":m '>+1<CR>gv=<Esc>gv",
	{ desc = "move the selection down" }
);
map(
	"v", "<M-k>", ":m '<-2<CR>gv=<Esc>gv",
	{ desc = "move the selection up" }
);

-- stationary cursor
nmap(
	"<leader>lc",
	function()
		vim.opt.scrolloff = 999 - vim.o.scrolloff
	end,
	{ desc = "toggles between moving text and moving cursor" }
);

nmap(
	"J", "mzJ`z",
	{ desc = "don't move the cursor when joining the next line" }
);
nmap(
	"<C-d>", "<C-d>zz",
	{ desc = "keep the cursor at the center when scrolling down" }
);
nmap(
	"<C-u>", "<C-u>zz",
	{ desc = "keep the cursor at the center when scrolling up" }
);
nmap(
	"n", "nzzzv",
	{ desc = "keep the cursor at the center navigating search results" }
);
nmap(
	"N", "Nzzzv",
	{ desc = "keep the cursor at the center navigating search results" }
);

-- modification/extensions of existing keymaps
map(
	{ "n", "v" }, "x", "\"_x",
	{ desc = "remove character or selection without copying" }
);
map(
	"x", "<leader>p", "\"_dP",
	{ desc = "paste over selection without copying" }
);
map(
	{ "n", "v" }, "<leader>y", "\"+y",
	{ desc = "yank to system clipboard" }
);
nmap(
	"<leader>Y", "\"+Y",
	{ desc = "yank current line to system clipboard" }
);
map(
	{ "n", "v" }, "<leader>d", "\"_d",
	{ desc = "delete without copying" }
);
nmap(
	"<leader>D", "\"_D",
	{ desc = "delete till end of line without copying" }
);
map(
	{ "n", "v" }, "<leader>c", "\"_c",
	{ desc = "delete and edit without copying" }
);
nmap(
	"<leader>C", "\"_C",
	{ desc = "delete till end of line and edit without copying" }
);

-- split resizing
nmap(
	"-", "<cmd>wincmd <<CR>",
	{ desc = "increase window width" }
);
nmap(
	"+", "<cmd>wincmd ><CR>",
	{ desc = "decrease window width" }
);
nmap(
	"<leader>=", "<cmd>wincmd +<CR>",
	{ desc = "increase window height" }
);
nmap(
	"<leader>-", "<cmd>wincmd -<CR>",
	{ desc = "decrease window height" }
);

-- substitutions
--nmap(
--	"<leader>sw",
--	"<cmd>" .. custom_commands["SubstituteWordQuick"] .. "<CR>",
--	{ desc = "substitute standalone occurences of word under cursor" }
--);
--nmap(
--	"<leader>sW",
--	"<cmd>" .. custom_commands["SubstituteWord"] .. "<CR>",
--	{ desc = "substitute standalone occurences of inputted word" }
--);
--nmap(
--	"<leader>ss",
--	"<cmd>" .. custom_commands["SubstituteCharsQuick"] .. "<CR>",
--	{ desc = "substitute occurences of character sequence under cursor" }
--);
--nmap(
--	"<leader>sS",
--	"<cmd>" .. custom_commands["SubstituteChars"] .. "<CR>",
--	{ desc = "substitute occurences of character sequence inputted" }
--);

-- quick fix list
nmap(
	"<leader>q", "<cmd>copen<CR>",
	{ desc = "open the quick fix list" }
);
nmap(
	"<leader>Q", "<cmd>ccl<CR>",
	{ desc = "close the quick fix list" }
);
nmap(
	"]q", "<cmd>cnext<CR>",
	{ desc = "walk forward in the quick fix list" }
);
nmap(
	"[q", "<cmd>cprev<CR>",
	{ desc = "walk backward in the quick fix list" }
);

-- lsp keymaps
nmap(
	"gD", vim.lsp.buf.declaration,
	{ desc = "goto the declaration of the term under cursor" }
);
