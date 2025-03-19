local M = {}

--- @class OscuraConfig
M.config = {
	cursorline = vim.o.cursorline,
	transparent_background = false,
	nvim_tree_darker = false,
	undercurl = true,
	italic_string = false,
	italic_keyword = false,
	italic_type = {
		normal = false,
		builtin = false,
		definition = false,
	},
	italic_constant = {
		builtin = false,
	},
	italic_function = {
		declaration = false,
		call = false,
		method = {
			declaration = false,
			call = false,
		},
	},
	custom_dark_background = nil,
	treesitter_context_bg = true,
	float_borderless = false,
}

--- @param theme_dark OscuraThemeDark
--- @return string
local function generate_lines(theme_dark)
	local lines = {
		string.format([[return string.dump(function()
vim.cmd.highlight('clear')
vim.g.colors_name="oscura"
local h=vim.api.nvim_set_hl
vim.opt.termguicolors=true]]),
	}

	local hgs_dark = require("oscura.hlgroups").get(theme_dark)
	for group, color in pairs(hgs_dark) do
		table.insert(lines, string.format([[h(0,"%s",%s)]], group, vim.inspect(color, { newline = "", indent = "" })))
	end

	table.insert(lines, "end,true)")

	return table.concat(lines, "\n")
end

--- @overload fun(config?: OscuraConfig)
function M.setup(config)
	M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

--- @param theme_dark OscuraThemeDark
function M.compile(theme_dark)
	local oscura_cache_dir = vim.fn.stdpath("cache") .. "/oscura/"

	if vim.fn.isdirectory(oscura_cache_dir) == 0 then
		vim.fn.mkdir(oscura_cache_dir, "p")
	end

	local concataned_lines = generate_lines(theme_dark)
	local f = loadstring(concataned_lines)
	if not f then
		local path_debug_file = vim.fn.stdpath("state") .. "/oscura-debug.lua"

		local msg = string.format("[oscura.nvim] error, open %s for debugging", path_debug_file)
		vim.notify(msg, vim.log.levels.ERROR)

		local debug_file = io.open(path_debug_file, "wb")
		if debug_file then
			debug_file:write(concataned_lines)
			debug_file:close()
		end
		return
	end

	local file = io.open(oscura_cache_dir .. "/cache", "wb")
	if file then
		file:write(f())
		file:close()
	else
		vim.notify("[oscura.nvim] error trying to open cache file", vim.log.levels.ERROR)
	end
end

local function compile_if_not_exist()
	local compiled = vim.fn.stdpath("cache") .. "/oscura/cache"
	if vim.fn.filereadable(compiled) == 0 then
		local palette = require("oscura.colors")

		local theme_dark = require("oscura.theme").dark(palette, M.config)
		M.compile(theme_dark)
	end
end

function M.load()
	compile_if_not_exist()

	local cache = vim.fn.stdpath("cache") .. "/oscura/cache"
	local f = loadfile(cache)
	if f ~= nil then
		f()
	else
		vim.notify("[oscura.nvim] error trying to load cache file", vim.log.levels.ERROR)
	end
end

vim.api.nvim_create_user_command("OscuraCompile", function()
	local palette = require("oscura.colors")

	local theme_dark = require("oscura.theme").dark(palette, M.config)
	M.compile(theme_dark)

	vim.notify("[oscura.nvim] colorscheme compiled", vim.log.levels.INFO)
	vim.cmd.colorscheme("oscura")
end, {})

--- @param theme_dark OscuraThemeDark
--- @param path string
function M.generate_colorscheme_file(theme_dark, path)
	local concataned_lines = generate_lines(theme_dark)

	local file = io.open(path, "wb")
	if file then
		file:write(concataned_lines)
		file:close()
	else
		vim.notify("[oscura.nvim] error trying to generate colorscheme file", vim.log.levels.ERROR)
	end
end

vim.api.nvim_create_user_command("OscuraColorschemeFile", function()
	local palette = require("oscura.colors")

	local theme_dark = require("oscura.theme").dark(palette, M.config)

	local oscura_state_dir = vim.fn.stdpath("state") .. "/oscura"
	if vim.fn.isdirectory(oscura_state_dir) == 0 then
		vim.fn.mkdir(oscura_state_dir, "p")
	end

	local path = oscura_state_dir .. "/oscura.lua"
	M.generate_colorscheme_file(theme_dark, path)

	local msg = string.format("[oscura.nvim] colorscheme file generated at %s", path)
	vim.notify(msg, vim.log.levels.INFO)
end, {})

return M
