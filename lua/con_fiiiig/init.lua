--[[ initialize all parts of the config in order ]]

-- core
require("con_fiiiig.core.preconfig");
require("con_fiiiig.core.statusline");
require("con_fiiiig.core.neovim_options");
require("con_fiiiig.core.neovim_keymaps");
require("con_fiiiig.core.autocommands");

-- plugin manager (plugins and related are initialized by this file)
require("con_fiiiig.plugin.manager");
