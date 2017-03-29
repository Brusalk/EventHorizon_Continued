local _, ns = ...
ns.watch_leaked_globals()

--[[
    Blueprint

    A collection of BlueprintGroups.
--]]
local Blueprint = ns.NewClass("Blueprint")

function Blueprint:initialize(name, groups)
  self.name = name
  self.groups = groups
end