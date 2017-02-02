local _, ns = ...
EH = ns

SpellFrame = ns.utils.NewClass("SpellFrame")

function SpellFrame:__class_method()
  self:debug("__class_method")
end

function SpellFrame:instance_method()
  self:debug("instance_method")
end

function SpellFrame:initialize(arg1)
  self:debug("initialize", arg1)
end

ns.utils:debug("SpellFrame:", SpellFrame)
spellframe = SpellFrame:new("testing")
SpellFrame:__class_method()
spellframe:instance_method()
spellframe.class:__class_method()

for i,v in pairs(SpellFrame.__instances) do
  v:debug(i, v)
end