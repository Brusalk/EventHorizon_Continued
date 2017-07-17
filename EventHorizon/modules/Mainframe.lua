local ehn, ns = ...
ns.watch_leaked_globals()

local Mainframe = Class("Mainframe")
local OrderedHash = Class("OrderedHash")

function Mainframe:initialize()
  self.hash = OrderedHash()
  self.array = Array()
end

function Mainframe:enable()
  self:print(hash)
  self:print(array)


end

function Mainframe:disable()
end

function Mainframe:default_state()
  return true
end

function Mainframe:dependencies()
  return {}
end