local _, ns = ...
ns.watch_leaked_globals()

--[[
    Object
    Base class for all EH Classes. Defines a standard library of helper functions that subclasses can use
--]]
local Object = ns.classes["Object"] -- Actually initially instantiated in class.lua, so we just fetch it here

-- Default initialize (noop)
function Object:initialize()
end

local tag_color = "FFEE99"

-- Lazily evaluates the error message via loadstring
-- This lets an assert's error message execute under the assumption of failure
-- Also means that the error message won't be evaluated at all unless it is a failed assert
-- Example:
--  Object:assert(name and type(name) == "string", function() return "NewClass(String name, \[Class parent_class\]) must be given a name (string) for the class" end)
function Object:assert(condition, message_or_function)
  if condition then return end -- Lazily evaluate assertion
  local message = type(message_or_function) == "function" and message_or_function() or message_or_function
  -- Duplicate error to chat log
  self:print("ASSERTION_FAILED", message)
  error(message, 2) -- Redirect source of error to correct location (caller is 2nd on callstack)
end

--  Takes pairs of input | string, color |
--  Produces a colored string, of each paired string colorized according to the paired color.
--  <color> may be either a HEX string (#FFFFFF) or nil/false. If not a string, the color will default to white.
--  Returns a table of the colorized strings
function Object:colorize_string(...)
  local return_values = {}
  for string, color in self:array_pairs(...) do
    table.insert(return_values, "|cFF" .. (color or "FFFFFF") .. string .. "|r")
  end
  return unpack(return_values)
end

-- Prints a message, tagged with the EventHorizon tag
function Object:print(...)
  print(self:colorize_string("[EventHorizon]", tag_color), ...)
end

--  Prints debug information. Wrapper around print
--  no-op if ns.debug is not enabled
--  Prints the class to aid in debugging
function Object:debug(...)
  if not ns.debug then return end
  self:print(...)
end

-- Iterates over pairs of input arguments
function Object:array_pairs(...)
  local args = {...} -- We may lose nils
  local current_index = -1
  return function()
    current_index = current_index + 2
    return args[current_index], args[current_index+1]
  end
end