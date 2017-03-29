local _, ns = ...
ns.watch_leaked_globals()

--[[
    Input
    An Input. Has a name and a type
--]]
local Input = ns.NewClass("Input", "Variable")

function Input:initialize(...)
  super(...)
end