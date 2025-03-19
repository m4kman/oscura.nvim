local M = {}

--- @param group string
--- @param color vim.api.keyset.highlight
function M.highlight(group, color)
	vim.api.nvim_set_hl(0, group, color)
end

return M
