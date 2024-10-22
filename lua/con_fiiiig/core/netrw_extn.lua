--[[ configuring netrw toggling ]]

local is_netrw_open_sidebar = false;

function netrw_toggle_sidebar()
	if vim.bo.filetype == "netrw" and not is_netrw_open_sidebar then
		return;
	end

	if not is_netrw_open_sidebar then
		vim.g.netrw_banner = 0;                                        -- disable banner to remove clutter in small sidebar
		vim.g.netrw_liststyle = 3;                                     -- use a tree format to display files
		vim.cmd("Lexplore %:p:h");                                     -- %:p:h for current directory
	else
		vim.cmd("Lexplore");
		vim.g.netrw_banner = 1;                                        -- re-enable banner
		vim.g.netrw_liststyle = 0;                                     -- use default layout for files
		vim.g.netrw_chgwin = -1;                                       -- lex changes this and doesn't reset it causing ex to act up (bug fix?)
	end
	is_netrw_open_sidebar = not is_netrw_open_sidebar;
end

function netrw_toggle_full()
	if is_netrw_open_sidebar then
		netrw_toggle_sidebar();                                        -- close (toggle) sidebar if open
	end

	if vim.bo.filetype == "netrw" then
		vim.cmd("Rexplore");                                           -- this toggles netrw but doesn't support %:p:h and hence is only used in closing
	else
		vim.cmd("Explore %:p:h");                                      -- %:p:h for current directory
	end
end

return {
	toggle_sidebar = netrw_toggle_sidebar,
	toggle_full = netrw_toggle_full
};
