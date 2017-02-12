local _, ns = ...

local class_color = "EE99FF"
local instance_color = "99FFEE"

function ns.utils.NewClass(name)
  ns.utils:assert(name and type(name) == "string", "NewClass(name) must be given a name (string) for the class")

  local class = {}
  local class_metatable = {__metatable = false} -- Don't allow overriding of the metatable of the class
  setmetatable(class, class_metatable)

  -- List of all current instances of the class
  local instance_counter = 0
  class.__instances = setmetatable({}, {__mode="v"}) -- Weak-table. Doesn't prevent garbage collection

  function class_metatable:__tostring()
    return "EventHorizon::" .. name -- EventHorizon::SpellFrame
  end

  function class_metatable:__index(key)
    if key:find("__") == 1 then return end -- These are private/class methods, so we shouldn't return anything
    if ns.utils[key] ~= nil then return ns.utils[key] end -- Fall back to ns.utils for utility common functions
  end

  function class:print(...)
    ns.utils.print(self, self:colorize_string("[" .. name .. "]", class_color), ...)
  end

  function class:new(...)
    local instance = {}
    local instance_metatable = {__metatable=false} -- Disallow overriding of the metatable of the instance
    local unique_id = instance_counter
    setmetatable(instance, instance_metatable)

    function instance_metatable:__index(key)
      if key:find("__") == 1 and class[key] then -- Improper attempt to access class method
        error("Attempting to call a class method on an instance. Must call on class directly", 2)
        return
      end
      if key:find("__") == 1 then return end -- These are private/class methods, so we shouldn't return anything
      if class[key] ~= nil then return class[key] end -- Instance method defined on class
    end

    function instance_metatable:__tostring()
      return tostring(class) .. "#" .. unique_id
    end

    function instance:print(...)
      class.print(self, self:colorize_string("[" .. unique_id.. "]", instance_color), ...)
    end

    -- Get the class
    instance.class = class

    -- Call the init method if it exists
    if class.initialize then class.initialize(self, ...) end

    -- Bookkeeping
    instance_counter = instance_counter + 1
    table.insert(class.__instances, instance)
    return instance
  end

  return class
end