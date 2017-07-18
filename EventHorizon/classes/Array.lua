local ehn, ns = ...
ns.watch_leaked_globals()

local Array = Class("Array")
local Enumerable = Class("Enumerable", "Include")

Array:__include(Enumerable)