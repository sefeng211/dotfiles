-- For mozilla related directory, I want to use FZF's
-- `Files` because it's fast. Hopefully in the future, I
-- can fully migrate to Telescope
function fuzzy_find_file()
    local path = vim.api.nvim_eval("getcwd()")
    if string.find(path, "mozilla") or string.find(path, "taskoo") then
	vim.api.nvim_command("Files")
    else
	vim.api.nvim_command("Telescope find_files")
    end
end

return {
    fuzzy_find_file = fuzzy_find_file,
}
