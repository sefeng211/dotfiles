local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local modes = require('el.data').modes
local mode_highlights = require('el.data').mode_highlights

local mode_dispatch = setmetatable({}, {
  __index = function(parent, format_string)
    local dispatcher = setmetatable({}, {
      __index = function(child, k)
        local higroup = mode_highlights[k]
        local inactive_higroup = higroup .. "Inactive"

        local display_name = modes[k][2] -- This is the only modification I did compare to upstream
        local contents = string.format(format_string, display_name)
        local highlighter = sections.gen_one_highlight(contents)

        local val = function(window, buffer)
          return highlighter(
            window,
            buffer,
            (window.is_active and higroup) or inactive_higroup
          )
        end

        rawset(child, k, val)
        return val
      end
    })

    rawset(parent, format_string, dispatcher)
    return dispatcher
  end
})

-- Display the short name of modes
local gen_mode = function(window, buffer)
    local format_string = '[%s]'
    local mode = vim.api.nvim_get_mode().mode
    return mode_dispatch[format_string][mode](window, buffer)
end

require('el').setup {
  generator = function(_, _)
    return {
      gen_mode,
      ' ',
      sections.split,
      sections.maximum_width(
        builtin.tail,
        0.30
      ),
      sections.collapse_builtin {
        ' ',
        builtin.modified_flag
      },
      sections.split,
      '[', builtin.line_with_width(3), ':',  builtin.column_with_width(2), ']',
      sections.collapse_builtin {
        '[',
        builtin.help_list,
        builtin.readonly_list,
        ']',
      },
      builtin.filetype,
    }
  end
}
