local EHN, ns = ...

ns.debug = GetAddOnMetadata(EHN, "X-Debug") == 'true'
_G["EHNS"] = ns

function ns.deep_copy(object)
  if type(object) == "table" then
    local copy = {}
    for key, value in next, object do -- Don't improperly use the __pairs metamethod in Lua 5.2
      copy[ns.deep_copy(key)] = ns.deep_copy(value)
    end
    setmetatable(copy, ns.deep_copy(getmetatable(object)))
    return copy
  end
  return object
end

-- Fun little function which causes the caller environment
-- to error when attempting to set a global variable. This
-- is to prevent purely accidental leakage of global vars.
-- Globals can still be set via _G. Ex: _G['var'] = 'test'
-- This is just to force solely conscious leakage of vars.
function ns.watch_leaked_globals()
  setfenv(2, setmetatable({
    -- "Global" methods
    Class = ns.Class
  }, {
    __index = getfenv(2),
    __newindex = function(table, key, value)
      error("LEAKED GLOBAL: " .. tostring(key) .. " => " .. tostring(value), 2)
    end
  }))
end
ns.watch_leaked_globals()

-- Injects the given metatable between the given object and
-- the original metatable (if it has one)
function ns.inject_metatable(object, metatable)
  local original_metatable = getmetatable(object)
  -- Cannot override the original metatable
  if original_metatable == false then return false end
  if original_metatable then
    metatable.__index = original_metatable
  end
  return setmetatable(object, metatable)
end
