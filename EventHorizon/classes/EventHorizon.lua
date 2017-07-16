local ehn, ns = ...
ns.watch_leaked_globals()

local EventHorizon = ns.Class("EventHorizon")

function EventHorizon:initialize(ace_addon)
  _G["EventHorizon"] = self -- Intentionally expose for debugging purposes
  self.ace_addon = ace_addon
  self.modules = {
    -- Denormalized for lookup speed while maintaining load order semantics
    -- TODO: Abstract this out into OrderedHash
    classes = {},
    ordered = {}
  }
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

function EventHorizon:register_module(ModuleClass)
  self:assert(not self.modules.classes[ModuleClass], function() return "EventHorizon:register_module(ModuleClass): A Module is already registered with the name '%s'":format(ModuleClass.name) end)
  self.modules.classes[ModuleClass] = true
  self.modules.ordered:insert(ModuleClass)
end

function EventHorizon:each_module()
  return ipairs(self.modules.ordered)
end

function EventHorizon:enable_modules()
  for i, module in self:each_module() do
    module:enable()
  end
end

function EventHorizon:disable_modules()
  for i, module in self:each_module() do
    module:disable()
  end
end
