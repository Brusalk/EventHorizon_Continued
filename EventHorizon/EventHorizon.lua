local _, ns = ...
ns.watch_leaked_globals()

local EventHorizon = ns.Class("EventHorizon")

function EventHorizon:initialize()
  self.ns = ns
end

function EventHorizon:test(input)

end


-- Intentionally expose as a global for easier debugging
_G["EventHorizon"] = EventHorizon:new()
