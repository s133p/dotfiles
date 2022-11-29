vim.g.asyncrun_open = 10
vim.g.asynctasks_profile = 'release'
vim.g.asynctasks_term_close = 1

-- function! CloseQfOnSuccess()
--     if g:asyncrun_code == 0
--         cclose
--         lua vim.notify("Build succeeded", "info", {title = 'Build'})
--     else
--         lua vim.notify("Build failed!", "error", {title = 'Build'})
--         copen
--         norm gwp
--     endif
-- endfunction
-- function! CloseQfForBuild()
--     if g:asynctasks_last != 'run' && g:asynctasks_last != 'test'
--         cclose
--     endif
-- endfunction

function CloseQfOnSuccess()
  local type = vim.g.asynctasks_last
  if (type == "run" or type == "build") then
  	if (vim.g.asyncrun_code == 0) then
  	  vim.cmd("cclose")
  	  vim.notify("Build succeeded", "info", {title = 'Build'})
  	else
      vim.notify("Build failed!", "error", {title = 'Build'})
      vim.cmd("copen")
      vim.cmd("norm gwp")
  	end
  end

  --[[ if (vim.g.asyncrun_code == 0) then
  	vim.cmd("cclose")
  	vim.notify("Build succeeded", "info", {title = 'Build'})
  else
    vim.notify("Build failed!", "error", {title = 'Build'})
    vim.cmd("copen")
    vim.cmd("norm gwp")
  end ]]
end

function CloseQfForBuild()
  local type = vim.g.asynctasks_last
  local profile = vim.g.asynctasks_profile

  if (type == "run" or type == "build") then
  	vim.notify(type .. "ing " .. profile, "info", {title = "Build"})

  	if (type == "run") then
  	  vim.cmd("cclose")
  	end
  end
end

local AsyncGroup = vim.api.nvim_create_augroup("MyAsync", {clear = true })
vim.api.nvim_create_autocmd("user", {
		pattern = "AsyncRunStart",
		command = "lua CloseQfForBuild()",
		group = AsyncGroup
})
--[[ vim.api.nvim_create_autocmd("user", {
		pattern = "AsyncRunStart",
		command = "lua vim.notify(vim.api.nvim_get_var(\"asynctasks_last\") .. \"ing \" .. vim.api.nvim_get_var(\"asynctasks_profile\"), \"info\", {title = \"Build\"})",
		group = AsyncGroup
}) ]]
vim.api.nvim_create_autocmd("user", {
		pattern = "AsyncRunStop",
		command = "lua CloseQfOnSuccess()",
		group = AsyncGroup
})
-- augroup MyAsyncRun
--     autocmd!
--     autocmd User AsyncRunStart call CloseQfForBuild()
--     autocmd User AsyncRunStart lua vim.notify(vim.api.nvim_get_var("asynctasks_last") .. "ing " .. vim.api.nvim_get_var("asynctasks_profile"), "info", {title = "Build"})
--     autocmd User AsyncRunStop call CloseQfOnSuccess()
-- augroup END
