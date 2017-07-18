local _, ns = ...

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
  if not (name and type(name) == "string") then
    error("NewClass(String name, [Class parent_class]) must be given a name (string) for the class " .. name)
  end
  if not(type(parent_class) ~= "table" or ns.classes[parent_class.name]) then
    error("NewClass(String name, Class parent_class) must be given an EventHorizon class. Given: " .. parent_class)
  end
  if not(type(parent_class) ~= "string" or ns.classes[parent_class]) then
    error("NewClass(String name, String parent_class) must be given the name of an already created Class. Given: " .. parent_class)
  end
end

local function normalize_class_reference(class_reference)
  local klass
  if type(class_reference) == "table" and class_reference.__inherits and class_reference.__inherits("Object") then
    klass = class_reference
  elseif type(class_reference) == "string" then
    klass = ns.classes[class_reference]
  else
    klass = ns.classes["Object"]
  end
  print("Normalized Klass:", klass)
  if not klass then error(("Unable to normalize class reference '%s'. Class reference must be either a string of an Class that was already defined, or the class itself."):fformat(class_reference)) end
  return klass
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
        error(("Attempted to call super() in %s: %s when parent class %s does not have that method"):fformat(class, function_name, class.parent), 2)
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
  local instance_metatable = {}
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
    parent = parent_class,
    mro = { parent_class } -- Method resolution order
  }

  local class_metatable = {
    __metatable = false, -- Don't allow overriding of the metatable of the class
  }
  setmetatable(class, class_metatable)

  -- List of all current instances of the class
  class.__instances = setmetatable({}, {__mode="v"}) -- Weak-table. Doesn't prevent garbage collection
  class.__instance_counter = 1 -- Lua begins indicies at 1, so do this for consistency :[

  function class_metatable:__tostring()
    return ("EventHorizon::%s"):fformat(name) -- Example: EventHorizon::SpellFrame
  end

  -- Allow instantiation of instances via `Class(args..)` syntax
  function class_metatable:__call(...)
    return create_instance_table(self, ...)
  end

  -- Methods are defined according to the MRO (Reference: Python)
  -- Last element is always the parent class
  -- Values are last-write wins. Most recent Include is found first
  function class_metatable:__index(key)
    print(("%s - Finding Key in MRO: %s"):fformat(class.name, key))
    for _, klass in ipairs(self.mro) do
      print(("%s - Checking klass %s"):fformat(class.name, klass))
      if klass[key] then
        print(("%s - Found in klass %s"):fformat(class.name, klass))
        return klass[key]
      end
    end
    print(("%s - Failed to find in MRO"):fformat(class.name))
  end

  function class:print(...)
    parent_class.print(self, self:colorize_string("[" .. name .. "]", class_color), ...)
  end

  function class:__inherits(klass_or_name)
    local ancestor_klass = normalize_class_reference(klass_or_name)
    local Object = ns.classes["Object"]
    -- Exit early if ancestor_klass is Object since all classes inherit from Object
    if ancestor_klass == Object then return true end

    local current_klass = self
    print("current_klass", current_klass)
    while current_klass ~= Object or not current_klass do
      print("parent_klass", current_klass.parent, "ancestor_klass", ancestor_klass)
      if current_klass.parent == ancestor_klass then
        return true
      end
      current_klass = current_klass.parent
    end
    return false
  end

  function class:__includes(klass)
    for i, included_klass in ipairs(self.mro) do
      if included_klass == klass then
        return true
      end
    end
    return false
  end

  function class:__include(klass_or_name)
    print("klass_or_name", klass_or_name)
    local klass = normalize_class_reference(klass_or_name)
    print("klass", klass)
    self:assert(
      klass and klass:__inherits("Include"),
      function() return ("%s:__include(klass): klass must inherit from Include. Got %s"):fformat(self, klass) end
    )
    table.insert(self.mro, 1, klass)
    klass:__included(self) -- Included callback on the included klass
  end

  function class:new(...)
    print(("%s.new("):fformat(self), ..., ")")
    return self(...)
  end

  -- Book-keeping
  ns.classes[name] = class

  return class
end

-- Opens a class for editing
function ns.Class(name, parent_class)
  if name == "Object" then return ns.classes["Object"] end -- Always reopen the original object class

  asserts(name, parent_class)
  parent_class = normalize_class_reference(parent_class)
  local class = ns.classes[name]
  if class then -- Need to check if we can reopen it
    if class.parent == parent_class then
      print("Reopening class for editing:", name, " < ", parent_class)
      return class -- We can
    else
      error(("ns.Class(name, parent_class): Unable to reopen class '%s' with the given parent_class '%s'. " ..
             "Original definition: ns.Class('%s', '%s') " ..
             "The Class may have been improperly defined earlier, or with a different parent class. " ..
             "You can only reopen a class with the same name and parent."):fformat(class, parent_class, class, class.parent))
    end
  else
    -- Need to make a new class.
    print("Creating new class:", name, " < ", parent_class)
    return create_class_table(name, parent_class)
  end
end

-- Base Object class that all classes eventually inherit from
-- Since we don't want it inheiriting from itself, we manually create the class table
create_class_table("Object", {})