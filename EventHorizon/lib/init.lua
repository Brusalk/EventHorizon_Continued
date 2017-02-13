local EHN, ns = ...

ns.debug = GetAddOnMetadata(EHN, "X-Debug") == 'true'

-- Fun little function which causes the caller environment
-- to error when attempting to set a global variable. This
-- is to prevent purely accidental leakage of global vars.
-- Globals can still be set via _G. Ex: _G['var'] = 'test'
-- This is just to force solely conscious leakage of vars.
function ns.watch_leaked_globals()
  setfenv(2, setmetatable({}, {
    __index = getfenv(2),
    __newindex = function(table, key, value)
      error("LEAKED GLOBAL: " .. tostring(key) .. " => " .. tostring(value), 2)
    end
  }))
end
ns.watch_leaked_globals()