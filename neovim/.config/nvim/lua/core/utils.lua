local M = {}

function M.exe_exists(exe)
	local handle = io.popen("which " .. exe .. " 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()
		return result ~= ""
	end
	return false
end

return M
