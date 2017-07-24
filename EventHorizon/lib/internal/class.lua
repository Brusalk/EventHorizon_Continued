local _, ns = ...

--[[
    Class
    Allows the creation of standard Object Classes, which support single-inheritance.
    All classes eventually inherit from Object
--]]

local class_color = "EE99FF"
local instance_color = "99FFEE"
local metamethods = {
  __add = true,
  __sub = true,
  __mul = true,
  __div = true,
  __mod = true,
  __pow = true,
  __unm = true,
  __concat = true,
  __len = true,
  __eq = true,
  __lt = true,
  __le = true,
  __index = true,
  __newindex = true,
  __call = true,
}

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
  if type(class_reference) == "table" and class_reference.__inherits and class_reference:__inherits("Object") then
    klass = class_reference
  elseif type(class_reference) == "string" then
    klass = ns.classes[class_reference]
  elseif not class_reference then
    klass = ns.classes["Object"]
  end
  if not klass then error(("Unable to normalize class reference '%s'. Class reference must be either a string of a Class that was already defined, or the class itself."):fformat(class_reference), 2) end
  return klass
end

-- Metatable madness which proxies a function to allow the body of that function
-- to call super(), which is the function on the parent class.
-- MUST NOT BE CALLED AS A TAIL CALL -- If ever used as a tail call getfenv will be at the wrong level
-- This is because a tail call doesn't add onto the call stack so as a tail call we actually want the
-- environment of our function execution, rather than one up the call stack as one would normally expect
--
-- Resume_mro is an iterator, but returns a function which is in reality calling coroutine.resume(), so we can
-- continue right where we left off in this closure by calling the function. It yields the next object in
-- mro order. This must be passed in on the initial call
local function wrap_super(function_to_wrap, object, function_name, resume_mro)
  local previous_fenv = getfenv(2)
  local super_env = setmetatable({
    super = function(...)
      local next_level = resume_mro()
      local next_function = rawget(next_level, function_name) or function(...) return super(...) end -- If the next mro object is missing, just pass through
      local rets = { wrap_super(next_function, next_level, function_name, resume_mro)(...) } -- Continue the fun all the way up the super chain
      return unpack(rets) -- Have to do this so we don't have a tail call, and we properly add to the stack
    end
  }, {
    __index = previous_fenv,
    __newindex = function(_, key, value) previous_fenv[key] = value end
  })
  return setfenv(function_to_wrap or function(...) return super(...) end, super_env) -- If we don't get a real function to wrap, we'll assume there's one higher up the chain
end

local function create_instance_table(class, ...)
  local instance = {}
  local instance_metatable = {}
  local unique_id = class.__instance_counter
  setmetatable(instance, instance_metatable)

  function instance_metatable:__index(key)
    local value = class[key]
    if key:find("__") == 1 and value then -- Improper attempt to access class method
      error("Attempting to call a class method on an instance. Must call on class directly", 2)
      return
    end
    if key:find("__") == 1 then return end -- These are private/class methods, so we shouldn't return anything
    -- Instance method defined on class
    if value ~= nil then 
      if type(value)=="function" then
        -- Give the method access to calling super
        -- The rawget looks weird, but this way we don't end executing the same function twice.
        -- Indexing class[key] will potentially hit class:__index, which will look all the way up the mro chain
        -- If we get a hit in the mro chain, we don't know where it was (or if it was on the class itself and
        -- this bypassed __index entirely). Thus, we use rawget here so that we always start at the lowest level
        -- and allow the recursive super() chain to resolve the mro order only-once
        -- If we used the found value, rather than rawget, we'll execute class[key]() twice, once in the first
        -- super call, and then eventually again if that super call calls its' super()
        local super = wrap_super(rawget(class, key), instance, key, instance.class:__each_mro())
        return super -- Have to do this so we don't have a tail call, and we properly add to the stack
      else
        return value
      end
    end
  end

  function instance_metatable:__tostring()
    return tostring(class) .. "#" .. unique_id
  end

  function instance:__each_mro()
    return instance.class:__each_mro()
  end

  function instance:print(...)
    class.print(self, self:colorize_string("[" .. unique_id.. "]", instance_color), ...)
  end

  -- Get the class
  instance.class = class

  -- Call the init method
  wrap_super(rawget(class, 'initialize'), instance, 'initialize', class:__each_mro())(instance, ...)

  -- Book-keeping
  class.__instance_counter = class.__instance_counter + 1
  table.insert(class.__instances, instance)

  return instance
end

local function create_class_table(name, parent_class)
  local class = {
    name = name,
    parent = parent_class,
    includes = {} -- Included classes
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
    print("__index", self, key)
    for candidate in self:__each_mro() do
      local thing = rawget(candidate, key)
      print("__index", self, key, candidate, thing, not not thing)
      if thing then
        return thing
      end
    end
  end

  function class:print(...)
    parent_class.print(self, self:colorize_string("[" .. name .. "]", class_color), ...)
  end

  function class:__inherits(klass_or_name)
    local ancestor_klass = normalize_class_reference(klass_or_name)
    for ancestor in self:__each_ancestor() do
      if ancestor == ancestor_klass then
        return true
      end
    end
    return false
  end

  -- Order:
  -- Class A
  -- Class A's Includes
  -- Class A Parent
  -- Class A Parent's Includes, etc
  local yield = coroutine.yield
  function class:__each_mro(callback)
    return coroutine.wrap(function()
      yield(self)
      for i, included_klass in self:__each_include() do
        yield(included_klass)
      end
      for ancestor in self:__each_ancestor() do
        yield(ancestor)
        for i, included_klass in ancestor:__each_include() do
          yield(included_klass)
        end
      end
    end)
  end

  function class:__each_ancestor()
    local terminator = ns.classes["Object"].parent
    local iterator = function(invariant, current_klass)
      local parent = current_klass.parent
      if parent ~= terminator then
        return parent
      end
    end
    return iterator, nil, self
  end

  function class:__each_include()
    return ipairs(self.includes)
  end

  function class:__includes(klass)
    return self.__each_include(function(included_klass)
      if klass == included_klass then
        return true
      end
    end) or false
  end

  function class:__include(klass_or_name)
    print("Including ", klass_or_name, "onto", self)
    local klass = normalize_class_reference(klass_or_name)
    print("include - normalized klass", klass)
    self:assert(
      klass and klass:__inherits("Include"),
      function() return ("%s:__include(klass): klass must inherit from Include. Got %s"):fformat(self, klass) end
    )
    table.insert(self.includes, 1, klass)
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
  local parent_klass = normalize_class_reference(parent_class)
  local class = ns.classes[name]
  if class then -- Need to check if we can reopen it
    if class.parent == parent_klass then
      print("Reopening class for editing:", name, " < ", parent_klass)
      return class -- We can
    else
      error(("ns.Class(name, parent_class): Unable to reopen class '%s' with the given parent_klass '%s'. " ..
             "Original definition: ns.Class('%s', '%s') " ..
             "The Class may have been improperly defined earlier, or with a different parent class. " ..
             "You can only reopen a class with the same name and parent."):fformat(class, parent_klass, class, class.parent))
    end
  else
    -- Need to make a new class.
    print("Creating new class:", name, " < ", parent_klass)
    return create_class_table(name, parent_klass)
  end
end

-- Base Object class that all classes eventually inherit from
-- Since we don't want it inheiriting from itself, we manually create the class table
create_class_table("Object", {})