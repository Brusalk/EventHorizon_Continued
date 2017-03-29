local usemouseover = true   -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 370 -- Searing Totem
  self.config.hastedSpellID = {2008,10} -- Ancestral Spirit

  -- Elemental

  -- Ascendance (Elemental)
  self:newSpell({
    cooldown = 114050,
    playerbuff = 114050,
    requiredTree = 1,
    requiredTalent = 19
  })

  -- Fire Elemental
  self:newSpell({
    cooldown = 198067,
    playerbuff = 198067,
    requiredTree = 1
  })

  -- Flame Shock
  self:newSpell({
    debuff = {188389,2},
    cooldown = 188389,
    requiredTree = {0,1},
    requiredLevel = 5
  })

  -- Lava Burst
  self:newSpell({
    cast = 51505,
    cooldown = 51505,
    requiredTree = 1,
    requiredLevel = 12
  })

  -- Elemental Blast
  self:newSpell({
    cast = 117014,
    cooldown = 117014,
    playerbuff = 117014,
    requiredTalent = 15,
    requiredTree = 1
  })

  -- Icefury
  self:newSpell({
    cast = 210714,
    cooldown = 210714,
    playerbuff = 210714,
    requiredTalent = 21,
    requiredTree = 1
  })

  -- Lightning Bolt + Chain Lightning
  self:newSpell({
    cast = {188196,188443,205495},
    cooldown = 205495,
    playerbuff = 205495,
    requiredTree = 1
  })

  -- Power of the Maelstrom
  self:newSpell({
    playerbuff = 191861,
    requiredTree = 1
  })

  -- Liquid Magma, currently unable to track totem uptime
  self:newSpell({
    cooldown = 192222,
    requiredTalent = 16,
    requiredTree = 1
  })

  -- Totem Mastery, currently unable to track totem uptime
  self:newSpell({
    cooldown = 210643,
    requiredTalent = 3,
    requiredTree = 1
  })

  -- Enhance
  -- Stormstrike
  self:newSpell({
    cooldown = 17364,
    playerbuff = 201846,
    requiredTree = 2
  })

  -- Lightning + Overcharge
  self:newSpell({
    cooldown = 187837,
    requiredTree = 2,
    requiredTalent = 14
  })

  -- Windsong
  self:newSpell({
    cooldown = 201898,
    playerbuff = 201898,
    requiredTree = 2,
    requiredTalent = 1
  })

  -- Hot Hand
  self:newSpell({
    playerbuff = 215785,
    requiredTree = 2,
    requiredTalent = 2
  })

  -- Earthen Spike
  self:newSpell({
    cooldown = 188089,
    debuff = 188089,
    requiredTree = 2,
    requiredTalent = 21
  })

  -- Boulderfist
  self:newSpell({
    cooldown = 201897,
    playerbuff = 218825,
    requiredTree = 2,
    requiredTalent = 3
  })

  -- Landslide
  self:newSpell({
    playerbuff = 202004,
    requiredTree = 2,
    requiredTalent = 20,
    requiredTalentUnselected = 3
  })

  -- Flametongue
  self:newSpell({
    cooldown = 193796,
    playerbuff = 194084,
    requiredTree = 2
  })

  -- Frostbite + Hailstorm
  self:newSpell({
    cooldown = 196834,
    playerbuff = 196834,
    requiredTree = 2,
    requiredTalent = 12
  })

  -- Crash Lightning
  self:newSpell({
    cooldown = 187874,
    playerbuff = 187878,
    requiredTree = 2
  })

  -- Sundering
  self:newSpell({
    cooldown = 197214,
    requiredTree = 2,
    requiredTalent = 18
  })

  -- Feral Beasts
  self:newSpell({
    cooldown = 51533,
    requiredTree = 2
  })

  -- Ascendance (Enhancement)
  self:newSpell({
    cooldown = 114051,
    playerbuff = 114051,
    requiredTree = 2,
    requiredTalent = 19
  })
end