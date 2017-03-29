local _, ns = ...
ns.watch_leaked_globals()

--[[
    Behavior
    Base-class for functionality of code-chunks of Behavior
--]]
local Behavior = ns.NewClass("Behavior")

local noop = function(...) return ... end

function Behavior:initialize(blueprint_group, parents, children)
  self.blueprint_group = blueprint_group
  -- Input arguments
  self.inputs = {}
  -- Output arguments
  self.outputs = {}
  -- Parent Behavior
  self.parents = parents or {}
  -- Child Behavior
  self.children = children or {}
  self.function = noop
end

function Behavior:input_arity()
  return #self.inputs
end

function Behavior:output_arity()
  return #self.outputs
end

-- https://www.lua.org/pil/7.3.html
local i_iterator = function(table, index)
  index = index + 1
  local value = table[index]
  if value then
    return index, value
  end
end

function Behavior:each_parent()
  return i_iterator, self.parents, 0
end

function Behavior:each_child()
  return i_iterator, self.children, 0
end

function Behavior:run(...)
  self:assert(self:input_arity() == #(...), "Behavior:run() mismatch between arity of input and what was expected")
  local rets = {self:function(...)}
  self:assert(self:output_arity() == #rets, "Behavior:run() mismatch between arity of output and what was expected")
  -- store return values
  for index, output in ipairs(self.outputs) do
    output:set(rets[index])
  end
  return unpack(rets)
end

-- Register ourselves with the blueprint group
function Behavior:register_event(event)
  self.blueprint_group:register_event(event, self)
end