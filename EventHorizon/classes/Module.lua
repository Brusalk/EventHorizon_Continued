local ehn, ns = ...
ns.watch_leaked_globals()

local Module = ns.Class("Module")

-- Initialize the module. Called upon login
-- Corresponding WoW Event: PLAYER_LOGIN
function Module:initialize()
  self.enabled = false
end

-- Called when the module is enabled.
-- If default_state(), then corresponding WoW Event: PLAYER_ENTERING_WORLD
function Module:enable()
  if self.enabled then return end -- If we've already been enabled, latch
  -- If we have any dependant modules, load them first
  for i, module in ipairs(self:dependencies()) do
    module:enable()
  end
  -- Now we're enabled
  self.enabled = true
end

-- Called when the module is being disabled.
-- TODO: Disable all modules which depend on us. This should be pulled up a level so modules don't have to call SUPER and we don't break if they don't
function Module:disable()

end

-- Returns the default state of the module upon login.
-- Override to return false for Load on Demand-like behavior
function Module:default_state()
  return true
end

-- Returns a table of Modules that must be loaded and enabled before enabling this module
function Module:dependencies()
  return {}
end