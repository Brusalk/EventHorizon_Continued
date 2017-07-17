local ehn, ns = ...
ns.watch_leaked_globals()

local Array = Class("Array")
Array:__include("Enumerable")