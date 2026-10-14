-- luacheck: globals hs

local super_key = { "ctrl", "alt", "cmd" }

-- Keep the local hs command-line interface available across config reloads.
require("hs.ipc")

require("mouse").setup(super_key)
require("teams").setup(super_key)
