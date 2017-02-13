local _, ns = ...
ns.watch_leaked_globals()

--[[
    Behavior
    Adds functionality to a SpellBar, when enabled by inclusion in a SpellBars config
    May declare dependencies on other Behaviors in order to be added to a SpellBar
--]]
local Behavior = ns.NewClass("Behavior")

function Behavior:initialize()

end