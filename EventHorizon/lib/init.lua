local _, ns = ...

ns.debug = true
ns.utils = setmetatable({}, {__tostring = function() return "EventHorizon::Utils" end})
