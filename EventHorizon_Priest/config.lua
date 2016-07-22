local usemouseover = true -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 33076 -- Shadow Word: Pain
  self.config.hastedSpellID = {2006, 10} -- Resurrection

  -- Shadow
  -- Void Bolt
  self:newSpell({
    cast = 205448,
    cooldown = 205448,
    requiredTree = 3,
  })

  -- Mind Blast
  self:newSpell({
    cast = 8092,
    cooldown = 8092,
    requiredTree = 3,
  })

  -- Shadow Word: Death
  self:newSpell({
    cast = 32379,
    cooldown = 32379,
    requiredTree = 3,
  })

  -- Vampiric Touch
  self:newSpell({
    debuff = {34914, 3},
    cast = 34914,
    recast = true,
    refreshable = true,
    hasted = true,
    requiredTree = 3,
  })

  -- Shadow Word: Pain
  self:newSpell({
    debuff = {589, 3},
    cast = 589,
    refreshable = true,
    hasted = true,
    requiredTree = 3,
  })

  -- Mind Flay or Mind Sear
  self:newSpell({
    channeled = {15407, 4}, {48045, 5},
    hasted = true,
    requiredTree = 3,
  })

end
