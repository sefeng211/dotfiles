local M = {}

local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local finders = require('telescope.finders')
local putils = require('telescope.previewers.utils')

M.taskoo_list_gtd_work = function()
	--local results = vim.fn.system("tt list c:gtd +work | sed -r 's/\\x1B\\[(;?[0-9]{1,3})+[mGK]//g'")
	--local results = vim.fn.system("tt list c:gtd +work")
	local results = vim.fn.system("echo '\\u001b[31mHelloWorld'")
	local split = vim.split(results, "\n")
	pickers.new {
	  -- results_title = 'Taskoo: c:gtd +work',
	  -- Run an external command and show the results in the finder window
	  finder = finders.new_table(split),
	  sorter = sorters.get_fuzzy_file(),
	  -- previewer = previewers.new_buffer_previewer {
	  --   -- Execute another command using the highlighted entry
	  --   define_preview = function(self, entry, status)
	  --       return
	  --   end
	  -- },
	}:find()
end

return M
