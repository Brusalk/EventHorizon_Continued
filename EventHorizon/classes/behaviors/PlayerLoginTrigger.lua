local _, ns = ...
ns.watch_leaked_globals()

--[[
    PlayerLoginTrigger
    Entry point based off of the PLAYER_LOGIN event
--]]
local PlayerLoginTrigger = ns.NewClass("PlayerLoginTrigger", "Trigger")
local Output = ns.classes.Output

function PlayerLoginTrigger:initialize(...)
  super(...)
  self.inputs = {
    Input.new("message", "string"),
    Input.new("sender", "string"),
    Input.new("language", "string"),
    Input.new("channelString", "string"),
    Input.new("target", "string"),
    Input.new("flags", "string"),
    Input.new("unknown", "number"),
    Input.new("channelNumber", "number"),
    Input.new("channelName", "string"),
    Input.new("unknown2", "number"),
    Input.new("counter", "number"),
    Input.new("guid", "guid"),
  }
  self.outputs = {
    Output.new("message", "string"),
    Output.new("sender", "string"),
    Output.new("language", "string"),
    Output.new("channelString", "string"),
    Output.new("target", "string"),
    Output.new("flags", "string"),
    Output.new("unknown", "number"),
    Output.new("channelNumber", "number"),
    Output.new("channelName", "string"),
    Output.new("unknown2", "number"),
    Output.new("counter", "number"),
    Output.new("guid", "guid"),
  }
  self:register_event("PLAYER_LOGIN")
end