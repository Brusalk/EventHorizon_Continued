local _, ns = ...
ns.watch_leaked_globals()

--[[
    BlueprintGroup

    A grouping of Behavior. Provides the interface through which behavior relate to each other, and sets up/begins
    the execution path of related Behavior.
--]]
local BlueprintGroup = ns.NewClass("BlueprintGroup")


function BlueprintGroup:initialize(name, blueprint)
  self.name = name
  self.blueprint = blueprint

  -- Events
  self.events = {
    -- event_name => [Trigger, ..., ]
  }
  self.event_frame = CreateFrame("frame")
  self.event_frame:SetScript("OnEvent", function(frame, event, ...) return self:event_handler(event, ...) end)
end

function BlueprintGroup:event_hander(event, ...)
  for i, trigger in ipairs(self.events[event]) do
    self:run_chain(trigger, ...)
  end
end

function BlueprintGroup:run_chain(trigger, ...)
  -- Track visited Behavior and results of function
  local cache = {
    -- Behavior => {Output, ...}
  }
  self:run_subchain(cache, trigger)
end

function BlueprintGroup:run_subchain(cache, currentBehavior)
  for _, parent in currentBehavior:each_parent() do
    if not cache[parent] then
      self:run_parents(cache, parent) -- Now we've run/cached every parent dependency of this child
  end
end

-- Need to run back up the tree and run all parents that have not run yet so we can run the current node
function BlueprintGroup:run_parents(cache, behavior)
  for _, parent in behavior:each_parent() do
    if not cache[parent] then
      self:run_parents(cache, parent) -- Keep going up the tree
    end
    -- All parents ran, run this node
    cache[behavior] = behavior:run(input_args)
  end
end



-- Register 
function BlueprintGroup:register_event(event, behavior)
  if not BlueprintGroup.events[event] then
    BlueprintGroup.events[event] = {}
    self.event_frame:RegisterEvent(event)
  end
  table.insert(BlueprintGroup.events[event], behavior)
end