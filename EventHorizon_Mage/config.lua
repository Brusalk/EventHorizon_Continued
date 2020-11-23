function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 118 -- Polymorph
  self.config.hastedSpellID = {118,1.7}
  self.config.past = -1 -- Number of seconds to show in the past. Default = -1
  self.config.future = 9 -- Number of seconds to show in the future. Default = 9

-- Arcane

  -- Clearcasting proc, Touch of the Magi CD, at half height and spell casts. *Note: I removed Arcane Barrage CD as it seemed pointless.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 10,
    cast = {116, 118, 759, 30451, 116011, 190336, 321507},
    channel = {5143, 5},
    playerbuff = 276743,
    cooldown = 321507,
    smallCooldown = true,
    channel = {5143, 5},
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     },
  })

  -- Nether Tempest
  self:newSpell({
    requiredTree = 1,
    requiredTalent = {12,16},
    debuff = {114923, 1},
     barcolors   = {
     debuffmine  = {252/255, 212/255, 252/255, 0.7},
     },
  })

  -- Nether Tempest with Arcane Orb CD at half height, if both talents are taken.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = {12,17},
    cooldown = 153626,
    smallCooldown = true,
    debuff = {114923, 1},
     barcolors   = {
     debuffmine  = {252/255, 212/255, 252/255, 0.7},
     cooldown    = {121/255, 141/255, 131/255, 0.9},
     },
  })

  -- Nether Tempest with Supernova at half height, if both talents are taken.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = {12,18},
    cooldown = 157980,
    smallCooldown = true,
    debuff = {114923, 1},
     barcolors   = {
     debuffmine  = {252/255, 212/255, 252/255, 0.7},
     cooldown    = {121/255, 141/255, 131/255, 0.9},
     },
  })

  -- Arcane Orb
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 17,
    requiredTalentUnselected = 12,
    cooldown = 153626,
     barcolors   = {
     cooldown  = {242/255, 161/255, 252/255, 0.65},
     },
  })

  -- Supernova
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 18,
    requiredTalentUnselected = 12,
    cooldown = 157980,
  })

  -- Rune of Power
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 9,
    recharge = 116011,
    playerbuff = 116011,
    cast = 116011,
     barcolors   = {
     playerbuff  = {171/255, 070/255, 171/255, 0.5},
     recharge    = {171/255, 191/255, 181/255, 0.4}
     },
  })

-- Presence of Mind
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 42,
    cooldown = 205025,
    playerbuff = 205025,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
    },
  })

--Arcane Power
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 29,
    cooldown = 12042,
    playerbuff = 12042,
     barcolors   = {
     playerbuff  = {000/255, 000/255, 232/255, 0.6},
     },
  })

-- Evocate
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 27,
    channel = {12051, 3},
    recharge = 12051,
     barcolors   = {
     recharge    = {202/255, 161/255, 252/255, 0.5}
    },
  })

--  Fire

  -- Heating up with casts and Fireblast recharge.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 10,
    cast = {133, 116, 118, 2120, 2948, 11366, 116011, 190336},
    playerbuff = 48107,
    recharge = 108853,
     barcolors   = {
     playerbuff  = {212/255, 111/255, 010/255, 0.7},
     recharge    = {171/255, 191/255, 181/255, 0.4},
     },
  })

  -- Hot Streak! and Phoenix's Flames recharge.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 14,
    recharge = 257541,
    playerbuff = 48108,
     barcolors   = {
     playerbuff  = {252/255, 020/255, 080/255, 0.6},
     recharge    = {202/255, 161/255, 050/255, 0.4},
     },
  })

-- Ignite and Dragon's Breath CD at half height.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 14,
    debuff = {12654, 1},
    cooldown = 31661,
    smallCooldown = true,
     barcolors   = {
     debuffmine  = {202/255, 030/255, 000/255, 0.7},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

-- Living Bomb
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 18,
    cooldown = 44457,
    debuff = 44457,
     barcolors   = {
     debuffmine  = {252/255, 161/255, 040/255, 0.7},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

-- Meteor
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 21,
    cooldown = 153561,
     barcolors   = {
     cooldown    = {222/255, 060/255, 010/255, 0.4},
     },
  })

  -- Rune of Power
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 9,
    recharge = 116011,
    playerbuff = {116011,18},
    cast = 116011,
     barcolors   = {
     playerbuff  = {171/255, 070/255, 171/255, 0.5},
     recharge    = {151/255, 191/255, 252/255, 0.4}
     },
  })

-- Combustion
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 29,
    cooldown = 190319,
    playerbuff = 190319,
     barcolors   = {
     playerbuff  = {191/255, 191/255, 010/255, 0.6},
     cooldown    = {171/255, 171/255, 171/255, 0.4},
     },
  })

  -- Pyroclasm
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 20,
    playerbuff = 269650,
  })

-- Frost

  -- Brain Freeze with spell casts and Blizzard CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 10,
    playerbuff = 190447,
    icon = 190447,
    cooldown = 190356,
    smallCooldown = true,
    cast = {116, 31687, 190336, 190356, 199786, 257537, 319836},
     barcolors   = {
     playerbuff  = {252/255, 232/255, 252/255, 0.5},
     cooldown    = {030/255, 030/255, 252/255, 0.9},
     },
  })

  -- Fingers of Frost with Frozen Orb CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 13,
    playerbuff = 112965,
    cooldown = 84714,
    smallCooldown = true,
     barcolors   = {
     playerbuff  = {030/255, 101/255, 191/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     },
  })

  -- Bone Chilling buff with Freeze CD at half height (pet ability), if you don't want to track the pet CD put -- infront of cooldown. It doesn't add an extra bar with this talent so I thought it was worthwhile.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 1,
    playerbuff = 205766,
    cooldown = 33395,
    smallCooldown = true,
  })
--[[
  -- Chain Reaction - I tried tracking this to see if you can keep it up by holding FoF procs but it's just too random, uncomment this spell if you'd like to try.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 11,
    playerbuff = 278309,
    smallCooldown = true,
  })
]]--
  -- Ice Nova
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 3,
    debuff = 157997,
    cooldown = 157997,
     barcolors   = {
     cooldown    = {212/255, 222/255, 232/255, 0.4},
    },
  })

  -- Comet Storm
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 18,
    cooldown = 153595,
  })

  -- Ebonbolt
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 12,
    requiredTalentUnselected = 21,
    cooldown = 257537,
     barcolors   = {
     cooldown    = {040/255, 252/255, 252/255, 0.6},
     },
  })

  -- Icicles, so we get a count for using Glacial Spike without Ebonbolt.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 21,
    requiredTalentUnselected = 12,
    playerbuff = 205473,
    icon = 205473,
     barcolors   = {
     playerbuff  = {242/255, 212/255, 252/255, 0.5},
     },
  })

  -- Icicles, so we get a count for using Glacial Spike, with Ebonbolt CD at half height, if chosen.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {12, 21},
    playerbuff = 205473,
    icon = 205473,
    cooldown = 257537,
    smallCooldown = true,
     barcolors   = {
     playerbuff  = {242/255, 212/255, 252/255, 0.5},
     cooldown    = {040/255, 252/255, 252/255, 0.6},
     },
  })

  -- Rune of Power
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 9,
    recharge = 116011,
    playerbuff = 116011,
    cast = 116011,
     barcolors   = {
     playerbuff  = {171/255, 070/255, 171/255, 0.5},
     recharge    = {171/255, 191/255, 181/255, 0.4}
     },
  })

  -- Ray of Frost
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 20,
    debuff = {205021, 1},
    cooldown = 205021,
    channel = 205021,
     barcolors   = {
     cooldown    = {040/255, 040/255, 232/255, 0.4},
    },
  })

  -- Ice Veins
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 40,
    cooldown = 12472,
    playerbuff = 12472,
     barcolors   = {
     playerbuff  = {030/255, 040/255, 252/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     },
  })

  -- Ice Flows
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 6,
    recharge = 108839,
     barcolors   = {
     recharge    = {101/255, 202/255, 242/255, 0.6},
     },
  })

end
