local ehn, ns = ...
ns.watch_leaked_globals()

local EventHorizon = Class("EventHorizon")
local OrderedHash  = Class("OrderedHash")
local Database     = Class("Database")
_G["EventHorizon"] = EventHorizon -- Intentionally expose for debugging purposes

EventHorizon.registered_modules = OrderedHash() -- module_klass => true

function EventHorizon:initialize(ace_addon)
  self.ace_addon = ace_addon
  self.modules = OrderedHash() -- module_klass => module_state
  self:initialize_modules()
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
  self.db = Database:new()
end

function EventHorizon:enable_event_horizon()
  -- Set up event handlers, create frames, etc


end

function EventHorizon:disable_event_horizon()
  -- Unregister event handlers, destroy frames, etc
end

-- Module API

function EventHorizon:register_module(module_klass)
  self:assert(not self.registered_modules[module_klass], function() return ("EventHorizon:register_module(module_klass): A Module is already registered with the name '%s'"):fformat(module_klass.name) end)
  self.registered_modules[module_klass] = true
end

function EventHorizon:initialize_module(module_klass)
  module = module_klass()
  self.modules[module_klass] = ModuleState(module)
end

function EventHorizon:initialize_modules()
  self.registered_modules:each(function(module_klass)
    self:initialize_module(module_klass)
  end)
end

function EventHorizon:enable_module(module_klass)
  self.modules[module_klass]:enable()
end

function EventHorizon:enable_modules()
  self.modules:each(function(module_klass)
    self:enable_module(module_klass)
  end)
end

function EventHorizon:disable_module(module_klass)
  self.modules[module_klass]:disable()
end

function EventHorizon:disable_modules()
  self.modules:each(function(module_klass)
    self:disable_module(module_klass)
  end)
end