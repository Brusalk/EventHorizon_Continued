local ehn, ns = ...
ns.watch_leaked_globals()

local AceAddon = LibStub("AceAddon-3.0"):NewAddon(ehn, "AceConsole-3.0")
local EventHorizon = Class("EventHorizon")

function AceAddon:OnInitialize()
  self.event_horizon = EventHorizon:new(self)
end

function AceAddon:OnEnable()
  self.event_horizon:enable()
end

function AceAddon:OnDisable()
  self.event_horizon:disable()
end