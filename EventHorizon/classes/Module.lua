local ehn, ns = ...
ns.watch_leaked_globals()

local Module = Class("Module")

-- Initialize the module. Called upon login
-- Corresponding WoW Event: PLAYER_LOGIN
function Module:initialize()
end

-- Called when the module is enabled.
-- If default_state(), then corresponding WoW Event: PLAYER_ENTERING_WORLD
function Module:enable()
end

-- Called when the module is being disabled.
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