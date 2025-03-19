local M = {}

-- Core palette
M.colors = {
	-- Base colors
	bg = "#0B0B0F",
	bg_dark = "#080809",
	bg_float = "#161616",
	bg_highlight = "#232323",
	bg_popup = "#2C2C31",
	bg_sidebar = "#0B0B0F",
	bg_statusline = "#0B0B0F",
	bg_visual = "#EAEC8A16",
	black = "#151820",
	blue = "#479FFA",
	border = "#282828",
	border_highlight = "#E6E7A3",
	comment = "#46474F",
	cyan = "#54C0A3",
	dark3 = "#34343480",
	dark5 = "#343434",
	fg = "#E6E6E6",
	fg_dark = "#C1C1C1",
	fg_gutter = "#32333B",
	fg_sidebar = "#9592A4",
	green = "#4EBE96",
	green1 = "#D6D876",
	green2 = "#E6E7A3",
	hint = "#C1C1C1",
	info = "#E6E7A3",
	magenta = "#6E678E",
	orange = "#F9B98C",
	purple = "#9592A4",
	red = "#D84F68",
	red1 = "#FF5C5C",
	teal = "#54C0A3",
	terminal_black = "#000000",
	warning = "#FFA16C",
	yellow = "#E6E7A3",

	-- Extended colors
	delta = {
		add = "#E6E6E615",
		delete = "#D84F6815",
	},
	brackets = { "#5C6974", "#6E678E", "#6A7782", "#6A7782", "#6A7782", "#6A7782" },
	none = "NONE",
}

-- Get the color table based on configuration
function M.get_colors(config)
	local colors = M.colors

	-- Handle transparent background if enabled
	if config.transparent then
		colors.bg = "NONE"
		colors.bg_sidebar = "NONE"
		colors.bg_statusline = "NONE"
	end

	return colors
end

return M
