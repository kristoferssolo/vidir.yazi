--- @sync entry

return {
	entry = function()
		local selected_items = cx.active.selected
		if #selected_items >= 1 then
			-- For selected files, pass them directly to vidir
			local files = ""
			for _, v in pairs(selected_items) do
				files = files .. ya.quote(tostring(v)) .. " "
			end

			ya.manager_emit("shell", { "vidir " .. files, block = true, confirm = true })
		else
			-- If no selection, use current directory (.)
			ya.manager_emit("shell", { "vidir .", block = true, confirm = true })
		end
	end,
}
