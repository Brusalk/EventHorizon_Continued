local _, ns = ...
ns.watch_leaked_globals()

--[[
    Output
    An Output. Has a name and a type
--]]
local Output = ns.NewClass("Output", "Variable")

function Output:initialize(...)
  super(...)
end