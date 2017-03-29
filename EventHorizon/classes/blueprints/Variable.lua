local _, ns = ...
ns.watch_leaked_globals()

--[[
    Variable
    A variable. Has a name, type, and value
--]]
local Variable = ns.NewClass("Variable")

function Variable:initialize(name, type)
  self.name = name
  self.type = type
  -- self.value
end

function Variable:set(new_val)
  self.value = new_val
  return new_val
end

function Variable:get()
  return self.value
end