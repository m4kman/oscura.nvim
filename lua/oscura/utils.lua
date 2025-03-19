local M = {}

-- Helper function to highlight groups
function M.highlight(group, opts)
	opts.default = opts.default or false
	vim.api.nvim_set_hl(0, group, opts)
end

-- Get terminal colors for the config
function M.get_terminal_colors(colors)
	local terminal_colors = {
		terminal_color_0 = colors.black,
		terminal_color_8 = colors.comment,
		terminal_color_1 = colors.red,
		terminal_color_9 = colors.red1,
		terminal_color_2 = colors.green,
		terminal_color_10 = colors.green1,
		terminal_color_3 = colors.yellow,
		terminal_color_11 = colors.orange,
		terminal_color_4 = colors.blue,
		terminal_color_12 = colors.blue,
		terminal_color_5 = colors.magenta,
		terminal_color_13 = colors.purple,
		terminal_color_6 = colors.cyan,
		terminal_color_14 = colors.cyan,
		terminal_color_7 = colors.fg,
		terminal_color_15 = colors.fg_dark,
	}
	return terminal_colors
end

-- Set the terminal colors
function M.set_terminal_colors(colors)
	local terminal_colors = M.get_terminal_colors(colors)
	for k, v in pairs(terminal_colors) do
		vim.g[k] = v
	end
end

return M
