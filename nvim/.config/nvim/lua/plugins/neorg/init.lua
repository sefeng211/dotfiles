
-- neorg conf
local neorg_leader = "<leader>o"
local neorg_callbacks = require('neorg.callbacks')

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

  keybinds.map_event_to_mode("norg", {
    n = {
      { "gld", "core.norg.qol.todo_items.todo.task_done" },
      { "glu", "core.norg.qol.todo_items.todo.task_undone" },
      { "glp", "core.norg.qol.todo_items.todo.task_pending" },
      { "gln", "core.norg.qol.todo_items.todo.task_cycle" },
      { "glf", "core.integrations.telescope.find_linkable" }
    },
  }, { silent = true, noremap = true })

end)

require'neorg'.setup {
         -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.integrations.telescope"] = {}, -- Enable the telescope module
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          personal = "~/.local/Dropbox/norg/personal",
          work = "~/.local/Dropbox/norg/work",
        }
      }
    }
  },
}
