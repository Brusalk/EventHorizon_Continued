local _, ns = ...
ns.watch_leaked_globals()

-- This file contains all of the stdlib extensions this addon defines on the global scope.
-- THESE ARE POTENTIALLY DANGEROUS, AND CAN EASILY COLLIDE WITH OTHER ADDONS WHO DO THE SAME THING

-- This is functionally the same as string.format, except it calls tostring on vararg automatically
function string:fformat(...)
  local args = { n = select("#", ...), ... }
  for i=1, args.n do
    if type(args[i]) ~= "string" then
      args[i] = tostring(args[i])
    end
  end
  return self:format(unpack(args, 1, args.n))
end