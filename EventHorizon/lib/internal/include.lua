local _, ns = ...
ns.watch_leaked_globals()

local Include = Class("Include")

-- Called when a subclass is included into klass
function Include:__included(klass)
end
