local _, ns = ...
ns.watch_leaked_globals()

--[[
    Trigger
    The entry-points to BehaviorChains. Represent Events/OnUpdate handlers, and output
    the arguments to those events/handlers to the chain
--]]
local Trigger = ns.NewClass("Trigger", "Behavior")

function Trigger:initialize(...)
  super(...)
end