local M = {}
local utils = require("oscura.utils")

-- Configuration with defaults
M.config = {
	style = "default", -- reserved for future styles
	transparent = false, -- Enable transparent background
	terminal_colors = true, -- Set terminal colors
	styles = {
		comments = { italic = true },
		keywords = { italic = false },
		functions = { bold = false },
		variables = {},
		sidebars = "dark", -- style for sidebars
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help", "terminal", "packer", "NvimTree", "Trouble" },
	day_brightness = 0.3, -- reserved for future light theme
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false, -- When true, section headers in the lualine theme will be bold
}

-- Load the configuration and theme
function M.load()
	-- Reset colors
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "oscura"

	-- Load the colorscheme
	require("oscura.theme").setup(M.config)
end

-- Setup function
function M.setup(config)
	-- Extend default configuration with user config
	M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

return M
