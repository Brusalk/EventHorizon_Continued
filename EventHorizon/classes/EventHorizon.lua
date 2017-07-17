local ehn, ns = ...
ns.watch_leaked_globals()

local EventHorizon = Class("EventHorizon")
local OrderedHash  = Class("OrderedHash")

function EventHorizon:initialize(ace_addon)
  _G["EventHorizon"] = self -- Intentionally expose for debugging purposes
  self.ace_addon = ace_addon
  self.ns = ns
  self.modules = OrderedHash()
end

function EventHorizon:enable()
  self:enable_database()
  self:enable_event_horizon()
  self:enable_modules()
end

function EventHorizon:disable()
  self:disable_modules()
  self:disable_event_horizon()
end

function EventHorizon:enable_database()
  self.db = ns.Class("Database").new()
end

function EventHorizon:enable_event_horizon()
  -- Set up event handlers, create frames, etc

  
end

function EventHorizon:disable_event_horizon()
  -- Unregister event handlers, destroy frames, etc
end

function EventHorizon:register_module(module_klass)
  self:assert(not self.modules[module_klass], function() return "EventHorizon:register_module(module_klass): A Module is already registered with the name '%s'":format(module_klass.name) end)
  self.modules[module_klass] = module_klass:default_state()
end

function EventHorizon:enable_modules()
  self.modules:each(module.enable)
end

function EventHorizon:disable_modules()
  self.modules:each(module.disable)
end
