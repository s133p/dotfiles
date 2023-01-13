vim.g.asyncrun_open = 10
vim.g.asynctasks_profile = 'release'
vim.g.asynctasks_term_close = 1

function CloseQfOnSuccess()
	local type = vim.g.asynctasks_last

	if(type == "build") then
		if (vim.g.asyncrun_code == 0) then
			vim.cmd("cclose")
			vim.notify("Build succeeded", "info", {title = 'Build'})
		else
			vim.notify("Build failed!", "error", {title = 'Build'})
			vim.cmd("copen")
			vim.cmd("norm gwp")
		end
	elseif (type == "run") then
		vim.cmd("cclose")
	elseif (type == "grep") then
		vim.notify("Search complete", "info", {title = 'Search'})
	end

	if (type == "run") then
	end
end

function CloseQfForBuild()
	local type = vim.g.asynctasks_last
	local profile = vim.g.asynctasks_profile

	if (type == "run" or type == "build") then
		vim.notify(type .. "ing " .. profile, "info", {title = "Build"})

		if (type == "run") then
			vim.cmd("cclose")
		end
	elseif (type == "grep") then
		vim.notify("Searching...", "info", {title = "Search"})
	end
end

local AsyncGroup = vim.api.nvim_create_augroup("MyAsync", {clear = true })
vim.api.nvim_create_autocmd("user", {
	pattern = "AsyncRunStart",
	command = "lua CloseQfForBuild()",
	group = AsyncGroup
})
vim.api.nvim_create_autocmd("user", {
	pattern = "AsyncRunStop",
	command = "lua CloseQfOnSuccess()",
	group = AsyncGroup
})

