local _, ns = ...
ns.watch_leaked_globals()

--[[
    Class
    Allows the creation of standard Object Classes, which support single-inheritance.
    All classes eventually inherit from Object
--]]

local class_color = "EE99FF"
local instance_color = "99FFEE"

-- Holds all created classes.
-- string => class
ns.classes = {}

local function asserts(name, parent_class)
  ns.Object:assert(name and type(name) == "string", "NewClass(String name, [Class parent_class]) must be given a name (string) for the class")
  ns.Object:assert(not ns.classes[name], function() return "NewClass(String name, [Class parent_class]) does not allow reopening of existing classes. The class " .. name .. " has already been created" end)
  ns.Object:assert(type(parent_class) ~= "table" or ns.classes[parent_class.name], function() return "NewClass(String name, Class parent_class) must be given a proper EventHorizon class. Given: " .. parent_class end)
  ns.Object:assert(type(parent_class) ~= "string" or ns.classes[parent_class], function() return "NewClass(String name, String parent_class) must be given the name of an already created Class. Given: " .. parent_class end)
end

local function normalize_parent_class(parent_class)
  if type(parent_class) == "string" then
    parent_class = ns.classes[parent_class]
  elseif not parent_class then
    parent_class = ns.classes["Object"]
  end

  return parent_class
end

-- Metatable madness which proxies a function to allow the body of that function
-- to call super(), which is the function on the parent class.
-- MUST NOT BE CALLED AS A TAIL CALL -- If ever used as a tail call getfenv will be at the wrong level
-- This is because a tail call doesn't add onto the call stack so as a tail call we actually want the
-- environment of our function execution, rather than one up the call stack as one would normally expect
local function wrap_super(class, instance, function_name)
  local previous_fenv = getfenv(2)
  local super_env = setmetatable({
    super = function(...)
      if type(class.parent[function_name]) == "function" then
        local rets = {wrap_super(class.parent, instance, function_name)(instance, ...)} -- Continue the fun all the way up the super chain
        return unpack(rets) -- Have to do this so we don't have a tail call, and we properly add to the stack
      else
        error("Attempted to call super() in " .. tostring(class) .. ":" .. function_name .. " when parent class " .. tostring(class.parent) .. " does not have that method", 2)
      end
    end
  }, {
    __index = previous_fenv,
    __newindex = function(_, key, value)
      previous_fenv[key] = value
    end
  })
  return setfenv(class[function_name], super_env)
end

local function create_instance_table(class, ...)
  local instance = {}
  local instance_metatable = {__metatable=false} -- Disallow overriding of the metatable of the instance
  local unique_id = class.__instance_counter
  setmetatable(instance, instance_metatable)

  function instance_metatable:__index(key)
    if key:find("__") == 1 and class[key] then -- Improper attempt to access class method
      error("Attempting to call a class method on an instance. Must call on class directly", 2)
      return
    end
    if key:find("__") == 1 then return end -- These are private/class methods, so we shouldn't return anything
    -- Instance method defined on class
    if class[key] ~= nil then 
      if type(class[key])=="function" then
        local super = wrap_super(class, instance, key) -- Give the method access to calling super
        return super -- Have to do this so we don't have a tail call, and we properly add to the stack
      else
        return class[key]
      end
    end
  end

  function instance_metatable:__tostring()
    return tostring(class) .. "#" .. unique_id
  end

  function instance:print(...)
    class.print(self, self:colorize_string("[" .. unique_id.. "]", instance_color), ...)
  end

  -- Get the class
  instance.class = class

  -- Call the init method
  wrap_super(class, instance, 'initialize')(instance, ...)

  -- Book-keeping
  class.__instance_counter = class.__instance_counter + 1
  table.insert(class.__instances, instance)

  return instance
end

local function create_class_table(name, parent_class)
  local class = {
    name = name,
    parent = parent_class
  }
  local class_metatable = {
    __metatable = false, -- Don't allow overriding of the metatable of the class
    __index = parent_class -- Fall-back to the parent class for method references
  }
  setmetatable(class, class_metatable)

  -- List of all current instances of the class
  class.__instances = setmetatable({}, {__mode="v"}) -- Weak-table. Doesn't prevent garbage collection
  class.__instance_counter = 1 -- Lua begins indicies at 1, so do this for consistency :[

  function class_metatable:__tostring()
    return "EventHorizon::" .. name -- Example: EventHorizon::SpellFrame
  end

  function class:print(...)
    parent_class.print(self, self:colorize_string("[" .. name .. "]", class_color), ...)
  end

  function class:new(...)
    return create_instance_table(self, ...)
  end

  -- Book-keeping
  ns.classes[name] = class

  return class
end

function ns.NewClass(name, parent_class)
  asserts(name, parent_class)
  parent_class = normalize_parent_class(parent_class)
  return create_class_table(name, parent_class)
end

-- Base Object class that all classes eventually inherit from
ns.Object = create_class_table("Object", {})