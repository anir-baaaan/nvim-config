--[[ settings core neovim options ]]
-- line numbers
vim.opt.number = true;                                                         -- turn on basic line numbers
vim.opt.relativenumber = true;                                                 -- convert line numbers relative to the current line

-- text wrapping
vim.opt.wrap = false;                                                          -- disables wrapping text if it gets longer than the window
vim.opt.textwidth = 0;                                                         -- disables wrapping text if it gets longer than a certain length

-- cursor wrapping
vim.opt.whichwrap:append("h");                                                 -- wrap around to previous line when pressing h at the start of a line
vim.opt.whichwrap:append("l");                                                 -- wrap around to next line when pressing l at the end of a line

-- tui
vim.opt.updatetime = 250;                                                      -- decreased update time
vim.opt.cursorline = true;                                                     -- highlights the current line of the cursor
vim.opt.termguicolors = true;                                                  -- 24 bit colors
vim.o.termguicolors = true;                                                    -- 24 bit colors (some docs have termgui in vim.o, failsafe)
vim.opt.splitright = true;                                                     -- open new vertical splits to the right
vim.opt.splitbelow = true;                                                     -- open new horizontal splits below
vim.opt.signcolumn = "yes";                                                    -- show the sign column
vim.opt.colorcolumn = options.intial_colorcolumn;                              -- show the text length guide column
vim.opt.showmode = false;                                                      -- don't show the current mode in command line
vim.opt.scrolloff = 7;                                                         -- minimum distance between cursor and top/bottom
vim.opt.mouse = "";                                                            -- disables mouse
vim.opt.ruler = false;                                                         -- turn off command line ruler

-- tooling options
vim.opt.ignorecase = true;                                                     -- ignore case when searching
vim.opt.smartcase = true;                                                      -- ignore case when searching in lowecase
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" };            -- completion popup stuff (idk exactly what this does)
vim.opt.inccommand = "split";                                                  -- preview substitutions live and also show off screen ones in separate window
vim.opt.wrapscan = true;                                                       -- wrap to the top is search reaches file end
vim.g.netrw_winsize = 20;                                                       -- netrw window size when not fullscreen
vim.opt.jumpoptions = "stack,view";                                            -- making jumping around more consistent https://www.reddit.com/r/neovim/comments/1cytkbq/comment/l7cqdmq

-- tab formatting
vim.opt.expandtab = options.initial_expand_tabs;                               -- whether to expand the tabs into spaces or not
vim.opt.tabstop = options.initial_tab_length;                                  -- *number of spaces a tab is equivalent to (normal mode?)
vim.opt.shiftwidth = 0;                                                        -- *number of spaces equal to each level of indentation (tabstop when 0)
vim.opt.softtabstop = -1;                                                      -- *number of spaces a tab is equivalent to while editing text (shiftwidth when -ve)
vim.opt.autoindent = true;                                                     -- *auto indent new lines based on current line
vim.opt.smartindent = true;                                                    -- *smartly indent lines based on context, etc

-- invisible characters
vim.opt.listchars = {};                                                        -- reset
vim.opt.listchars:append({ lead = "∙" });                                      -- leading spaces
vim.opt.listchars:append({ tab = "▎ " });                                      -- tabs
vim.opt.listchars:append({ trail = "ˍ" });                                     -- trailing spaces
vim.opt.list = true;                                                           -- show some invisible characters using assigned character

-- backup and undo history
vim.opt.swapfile = false;                                                      -- *do not use a swap file for the buffer
vim.opt.backup = false;                                                        -- do not create a backup before overwriting a file
vim.opt.writebackup = false;                                                   -- do not create temporary backups before overwriting a file
vim.opt.undofile = true;                                                       -- create undofiles to store undo history
