local _, ns = ...
ns.watch_leaked_globals()

local EventHorizon = ns.Class("EventHorizon")

function EventHorizon:initialize()
  self.ns = ns
  self:test_me()
end

local EH2 = ns.Class("EventHorizon")

function EH2:test_me()
  self:print("I'm tested!")
end


_G["EventHorizon"] = EventHorizon:new() -- Intentionally expose it as a global for easier debugging
