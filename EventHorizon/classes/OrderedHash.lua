local ehn, ns = ...
ns.watch_leaked_globals()

local OrderedHash = Class("OrderedHash")
local metatable = {}

function OrderedHash:initialize()
  self.order = {} -- insert_order => hash_key
  self.hash = {}  -- hash_key => hash_value
  ns.inject_metatable(self, metatable)
end

function metatable:__index(key)
  return self.hash[key]
end

function metatable:__newindex(key, value)
  self.order:insert(key)
  self.hash[key] = value
end

function metatable:__len()
  return #self.order
end

-- Table union. Returns a new OrderedHash
-- If both a and b have the same key, b overrides a
-- Ordered according to original insert order of a, followed by b
function metatable:__add(a, b)
  local new = self.class()
  a:each(function(k, v)
    new[k] = v
  end)
  b:each(function(k, v)
    new[k] = v
  end)
  return new
end

-- Table subtraction. Returns a new OrderedHash
-- Returns table a, without any of the keys in b
function metatable:__sub(a, b)
  local new = self.class()
  a:each(function(k, v) do
    if b[k] ~= nil then
      new[k] = v
    end
  end)
end

-- Table equality. Does not check order.
-- Returns true if all elements in b exist in a, with the same values
function metatable:__eq(a, b)
  return a <= b and b <= a
end

-- Table subset check a is a subset of b, with the same values
-- but, returns false if the tables are equal
function metatable:__lt(a, b)
  return a <= b and not a == b
end

-- Table subset or equal check. True set equality
function metatable:__le(a, b)
  mismatch = a:each(function(k, v) do
    if b[k] ~= a[k] then
      return true
    end
  end)
  -- If we get through the whole table a with the same values in b,
  -- then we know that a is a subset of (or exactly equal to) b
  return not mismatch
end

-- Given an array where all elements are strings or numbers, 
-- returns table[i]..sep..table[i+1] ··· sep..table[j]. 
-- If i is greater than j, returns the empty string.
function OrderedHash:concat(separator, first, last)
  separator = separator or ""
  first = first or 1
  last = last or #self.order

  local str = ""
  for i=first, last do
    str = "%s%s%s":format(str, self[i], i<last and separator or "")
  end
  return str
end

function OrderedHash:each(callback)
  self:assert(type(callback)=="function", function() return "each(callback): Callback(key, value) must be a function" end)
  for i, k in ipairs(self.order) do
    local ret = callback(k, self[k])
    if ret ~= nil then return ret end
  end
end

function OrderedHash:eachi(callback)
  self:assert(type(callback)=="function", function() return "eachi(callback): Callback(inserted_order, value) must be a function" end)
  for i, k in ipairs(self.order) do
    local ret = callback(i, self[k])
    if ret ~= nil then return ret end
  end
end