local _, ns = ...

local tag_color = "FFEE99"


--  Takes pairs of input | string, color |
--  Produces a colored string, of each paired string colorized according to the paired color.
--  <color> may be either a HEX string (#FFFFFF) or nil/false. If not a string, the color will default to white.
--  Returns a table of the colorized strings
function ns.utils:colorize_string(...)
  local return_values = {}
  for string, color in ns.utils:array_pairs(...) do
    table.insert(return_values, "|cFF" .. (color or "FFFFFF") .. string .. "|r")
  end
  return unpack(return_values)
end

-- Prints a message, tagged with the EventHorizon tag
function ns.utils:print(...)
  print(self:colorize_string("[EventHorizon]", tag_color), ...)
end

--  Prints debug information. Wrapper around print
--  no-op if ns.debug is not enabled
--  Prints the class to aid in debugging
function ns.utils:debug(...)
  if not ns.debug then return end
  self:print(...)
end

