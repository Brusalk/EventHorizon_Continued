local usemouseover = true   -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 370 -- Searing Totem
  self.config.hastedSpellID = {2008,10} -- Ancestral Spirit
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- Elemental

  -- Lava Burst recharge, Lava Surge proc and spell casts.
  self:newSpell({
    requiredTree = 1,
    cast = {188196, 188443, 51505, 51514, 8004},
    playerbuff = 77762,
    recharge = 51505,
    barcolors = {
     recharge    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {232/255, 050/255, 020/255, 0.5}
     },
  })

  -- Flame Shock and Fire Elemental at half height.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 3,
    cooldown = 198067,
    smallCooldown = true,
    playerbuff = 205495,
    debuff = {188389, 2},
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     tick        = {222/255, 040/255, 010/255, 0.9},
     debuffmine  = {242/255, 141/255, 010/255, 0.5}
     },
  })

  -- Elemental Blast
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 15,
    cast = 117014,
    cooldown = 117014,
    playerbuff = {{118522}, {173183}, {173184}}, -- 118522 crit, 173183 haste, 173184 mastery
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {171/255, 070/255, 161/255, 0.6}
     },
  })

  -- Icefury
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    cast = 210714,
    cooldown = 210714,
    playerbuff = 210714,
  })

  -- Stormkeeper (Artifact) CD and Power of the Maelstrom buff, CD at half height for less ambiguity.
  self:newSpell({
    requiredTree = 1,
    requiredArtifactTalent = 205495,
    cast = 205495,
    cooldown = 205495,
    smallCooldown = true,
    playerbuff = {{205495}, {191861}},
    barcolors = {
     cooldown    = {202/255, 161/255, 055/255, 0.7},
     playerbuff  = {080/255, 141/255, 191/255, 0.6}
     },
  })

  -- Liquid Magma Totem, currently unable to track totem uptime
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 16,
    cooldown = 192222,
  })

  -- Totem Mastery
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    playerbuff = {{202192}, {210652}, {210659}, {210658}},
    icon = 210643,
    barcolors = {
--     cooldown    = {171/255, 191/255, 181/255, 0.7},
--     playerbuff  = {232/255, 191/255, 181/255, 0.4}
     },
  })

  -- Elemental Mastery
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 12,
    cooldown = 16166,
    playerbuff = 16166,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {232/255, 191/255, 181/255, 0.4}
     },
  })

  -- Ascendance
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 19,
    cooldown = 114050,
    playerbuff = 114050,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {232/255, 191/255, 181/255, 0.4}
     },
  })

  -- Enhancement

  -- Rockbiter
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 10,
    requiredTalent = 1,
    recharge = 193786,
    barcolors = {
     recharge    = {171/255, 191/255, 181/255, 0.3}
     },
  })

  -- Rockbiter recharge and Hot Hand proc, if taken.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 10,
    requiredTalent = 2,
    recharge = 193786,
    playerbuff = 215785,
    barcolors = {
     playerbuff  = {222/255, 080/255, 010/255, 0.6},
     recharge    = {171/255, 191/255, 181/255, 0.3}
     },
  })

  -- Rockbiter recharge and Landslide buff, if taken.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 10,
    requiredTalent = 3,
    recharge = 193786,
    playerbuff = 202004,
    barcolors = {
     playerbuff  = {121/255, 020/255, 030/255, 0.7},
     recharge    = {171/255, 191/255, 181/255, 0.3}
     },
  })

  -- Flametongue
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 12,
    cooldown = 193796,
    playerbuff = 194084,
    barcolors = {
     playerbuff  = {252/255, 141/255, 040/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Frostbrand + Doomhammer CD at half height.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 38,
    cooldown = 204945,
    smallCooldown = true,
    playerbuff = 196834,
    barcolors = {
     playerbuff  = {080/255, 111/255, 151/255, 0.5},
     cooldown    = {202/255, 161/255, 050/255, 0.8},
     },
  })

  -- Overcharge
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 14,
    cooldown = 187837,
  })

  -- Windsong
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 1,
    cooldown = 201898,
    playerbuff = 201898,
    barcolors = {
     playerbuff  = {151/255, 242/255, 242/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Stormstrike
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 20,
    cooldown = 17364,
    playerbuff = 201846,
    barcolors = {
     playerbuff  = {010/255, 010/255, 171/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Earthen Spike
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 21,
    cooldown = 188089,
    debuff = 188089,
    barcolors = {
     cooldown    = {111/255, 090/255, 050/255, 0.4},
     debuffmine  = {101/255, 080/255, 040/255, 0.6}
     },
  })

  -- Crash Lightning
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 28,
    cooldown = 187874,
    playerbuff = 187878,
  })

  -- Sundering
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 18,
    cooldown = 197214,
  })

  -- Fury of Air and Feral Spirit cooldown at half height.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 36,
    cooldown = 51533,
    smallCooldown = true,
    playerbuff = 197211,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {212/255, 212/255, 242/255, 0.4}
     },
  })

  -- Ascendance
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 19,
    cooldown = 114051,
    playerbuff = 114051,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {232/255, 191/255, 181/255, 0.4}
     },
  })

  -- Restoration

  -- Lava Burst recharge, Lava Surge proc and spell casts.
  self:newSpell({
    requiredTree = 3,
    cast = {403, 421, 1064, 8004, 51505, 51514, 73920, 77472, 207778},
    playerbuff = 77762,
    recharge = 51505,
    barcolors = {
     recharge    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {232/255, 050/255, 020/255, 0.5}
     },
  })

  -- Flame Shock
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 3,
    cooldown = 188838,
    debuff = {188838, 3},
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     tick        = {222/255, 040/255, 010/255, 0.9},
     debuffmine  = {242/255, 141/255, 010/255, 0.5}
     },
  })

  -- Riptide
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 10,
    recharge = 61295,
    playerbuff = {61295, 3},
    auraunit = 'mouseover' or 'target',
    barcolors = {
     recharge    = {171/255, 191/255, 181/255, 0.7},
     tick        = {040/255, 181/255, 020/255, 0.9},
     playerbuff  = {030/255, 090/255, 090/255, 0.6}
     },
  })

  -- Healing Rain
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 40,
    cooldown = 73920,
    barcolors = {
     cooldown    = {010/255, 101/255, 232/255, 0.7},
     playerbuff  = {080/255, 181/255, 131/255, 0.5}
     },
  })

  -- Unleashed Life
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 2,
    cooldown = 73685,
    playerbuff = 73685,
    barcolors = {
     cooldown    = {090/255, 191/255, 191/255, 0.7},
     playerbuff  = {080/255, 181/255, 131/255, 0.5}
     },
  })

  -- Healing Stream Totem
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 14,
    recharge = 5394,
--    totem = 5394,
    barcolors = {
     recharge    = {080/255, 161/255, 202/255, 0.7},
     playerbuff  = {080/255, 161/255, 202/255, 0.4}
     },
  })

  -- Tidal Waves buff and Gift of the Queen (artifact) cooldown at half height, if you have it.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 34,
    playerbuff = 53390,
    cooldown = 207778,
    smallCooldown = true,
    barcolors = {
     cooldown    = {202/255, 161/255, 055/255, 0.7},
     },
  })

  -- Earthen Shield Totem
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 14,
    cooldown = 198838,
    playerbuff = 201633,
    auraunit = 'mouseover' or 'target',
--    totem = 198838,
    barcolors = {
     cooldown    = {040/255, 090/255, 090/255, 0.6},
     playerbuff  = {232/255, 090/255, 242/255, 0.7}
     },
  })

  -- Ancestral Guidance
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 11,
    cooldown = 108281,
    playerbuff = 108281,
    barcolors = {
     cooldown    = {16/255, 252/255, 252/255, 0.6},
--     playerbuff  = {232/255, 191/255, 181/255, 0.4}
     },
  })

  -- Healing Tide Totem
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 80,
    cooldown = 108280,
--    totem = 108280,
    barcolors = {
     cooldown    = {151/255, 242/255, 222/255, 0.7},
     playerbuff  = {151/255, 242/255, 222/255, 0.4}
     },
  })

  -- Ascendance
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 19,
    cooldown = 114052,
    playerbuff = 114052,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {232/255, 191/255, 181/255, 0.4}
     },
  })

-- Utility spells or long cooldowns, hidden by default as there are already many bars for this spec. Remove the comment "--[[ ]]--" block lines to show the ones you'd like.
--[[
  -- Spiritwalker's Grace
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 34,
    cooldown = 79206,
    playerbuff = 79206,
  })
]]--

--[[
  -- Ancestral Protection Totem
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 13,
    cooldown = 207399,
    playerbuff = 207498,
    auraunit = 'mouseover' or 'target',
--    totem = 207399,
    barcolors = {
     playerbuff  = {232/255, 010/255, 010/255, 0.7}
     },
  })
]]--
end
