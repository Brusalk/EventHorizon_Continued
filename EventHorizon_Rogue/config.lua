function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 1966
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- Assassination

  --[[ Blindside
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    playerbuff = 121153,
     barcolors = {
     playerbuff = {252/255, 020/255, 020/255, 0.7}
     },
  })
]]
  -- Garrote
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 12,
    debuff = {703,2},
    cooldown = 703,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.6},
     debuffmine = {191/255, 040/255, 101/255, 0.5}
     },
  })

  -- Rupture with Exsanguinate cooldown at half height if chosen.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 20,
    debuff = {1943,2},
    cooldown = 200806,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.6},
     debuffmine = {252/255, 000/255, 000/255, 0.4}
     },
  })

  -- Elaborate Planning
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 2,
    playerbuff = 193641,
     barcolors = {
     playerbuff = {252/255, 232/255, 060/255, 0.5}
     },
  })

  -- Envenom
  self:newSpell({
    requiredTree = 1,
    requiredTalentUnselected = 9,
    playerbuff = 32645,
     barcolors = {
     playerbuff = {030/255, 131/255, 000/255, 0.5}
     },
  })

  -- Envenom with Marked for Death cooldown at half height, if chosen.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 9,
    playerbuff = 32645,
    cooldown = 137619,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.6},
     playerbuff = {030/255, 131/255, 000/255, 0.5}
     },
  })

  -- Toxic Blade
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 17,
    debuff = 245389,
    cooldown = 245388,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.6},
     debuffmine = {111/255, 151/255, 070/255, 0.9}
     },
  })

  -- Vendetta
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 56,
    debuff = {79140,0},
    cooldown = 79140,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.5},
     debuffmine = {191/255, 171/255, 161/255, 0.5}
     },
  })

  -- Crimson Tempest with Vanish CD at half height.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    debuff = {121411, 2},
    smallCooldown = true,
    cooldown = 1856,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.6},
     debuffmine = {222/255, 060/255, 070/255, 0.4}
     },
   })

  -- Vanish
  self:newSpell({
    requiredTree = 1,
    requiredTalentUnselected = 21,
    cooldown = 1856,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.6},
     },
  })

  -- Outlaw

  -- Roll the Bones and Sprint cooldown at half height.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 40,
    requiredTalentUnselected = 18,
    icon = 193316,
    playerbuff = {{193356,0},{193357,0},{193358,0},{193359, 0},{199600,0},{199603,0}},
    cooldown = 2983,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.7},
     playerbuff = {252/255, 101/255, 101/255, 0.7}
     },
  })

  -- Slice and Dice and Sprint cooldown at half height.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 18,
    playerbuff = 5171,
    cooldown = 2983,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.7},
     playerbuff = {252/255, 101/255, 101/255, 0.7}
     },
  })

  -- Ghostly Strike
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 3,
    debuff = 196937,
    cooldown = 196937,
    refreshable = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.7},
     debuffmine = {222/255, 111/255, 111/255, 0.7}
     },
  })

  -- Opportunity with Marked for Death CD at half height if selected.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 11,
    playerbuff = 195627,
    cooldown = 137619,
    smallCooldown = true,
    icon = 185763,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.7},
     playerbuff = {252/255, 030/255, 040/255, 0.7}
     },
  })

  -- Alacrity
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {17, 19},
    playerbuff = 193539,
     barcolors = {
     playerbuff = {252/255, 252/255, 151/255, 0.6}
     },
  })

  -- Alacrity with Blade Rush cooldown at half height.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {17, 20},
    playerbuff = 193539,
    cooldown = 271877,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.9},
     playerbuff = {252/255, 252/255, 151/255, 0.6}
     },
  })

  -- Alacrity with Killing Spree cooldown at half height.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {17, 21},
    playerbuff = 193539,
    cooldown = 51690,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.9},
     playerbuff = {252/255, 252/255, 151/255, 0.6}
     },
  })

  -- Blade Rush if Alacrity not taken.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 20,
    requiredTalentUnselected = 17,
    cooldown = 271877,
  })

  -- Killing Spree if Alacrity not taken.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 21,
    requiredTalentUnselected = 17,
    cooldown = 51690,
  })

  -- Adrenaline Rush
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 56,
    playerbuff = 13750,
    cooldown = 13750,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.6},
     playerbuff = {242/255, 161/255, 040/255, 0.7}
     },
  })

  -- Remove the --[[ and ]]-- from around the next spell config if you'd like to track this stun finisher, probably a PvP option although solo and dungeons may sometimes find this useful.
--[[
  -- Between the Eyes
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 25,
    cooldown = 199804,
    debuff = 199804,
  })
]]--

  -- Remove the --[[ and ]]-- from around the next spell config if you'd like to track Vanish as an Outlaw. Not tracked by default as it doesn't provide a DPS buff for this spec.
--[[
  -- Vanish
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 48,
    cooldown = 1856,
  })
]]--

  -- Subtlety

  -- Nightblade with Marked for Death cooldown at half height, if selected.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 20,
    debuff = {195452,2},
    cooldown = 137619,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.7},
     debuffmine = {080/255, 030/255, 121/255, 0.6}
     },
  })

  -- Symbols of Death
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 36,
    playerbuff = 212283,
    cooldown = 212283,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.6},
     playerbuff = {232/255, 010/255, 232/255, 0.7}
     },
  })

  -- Shadow Dance
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 40,
    playerbuff = 185313,
    recharge = 185313,
     barcolors = {
     recharge = {121/255, 141/255, 191/255, 0.4},
     playerbuff = {010/255, 131/255, 202/255, 0.7}
     },
  })

  -- Alacrity
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {17, 19},
    playerbuff = 193539,
     barcolors = {
     playerbuff = {252/255, 252/255, 151/255, 0.6}
     },
  })

  -- Alacrity with Secret Technique cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {17, 20},
    playerbuff = 193539,
    cooldown = 280719,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.9},
     playerbuff = {252/255, 252/255, 151/255, 0.6}
     },
  })

  -- Alacrity with Shuriken Tornado cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {17, 21},
    playerbuff = 193539,
    cooldown = 277925,
    smallCooldown = true,
     barcolors = {
     cooldown = {171/255, 191/255, 181/255, 0.9},
     playerbuff = {252/255, 252/255, 151/255, 0.6}
     },
  })

  -- Vanish
  self:newSpell({
    requiredTree = 3,
    requiredTalentUnselected = 1, 
    requiredLevel = 48,
    cooldown = 1856,
  })

  -- Shadow Blades
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 56,
    playerbuff = 121471,
    cooldown = 121471,
     barcolors = {
     playerbuff = {111/255, 060/255, 202/255, 0.5}
     },
  })

  -- If you'd like any of the following defensive abilities tracked remove the --[[ and ]]-- surounding the spell config for the one you'd like. Depending on talents chosen this can make the bar list very long.

--[[
  -- Feint & Crimson Vial
  self:newSpell({
    requiredLevel = 16,
    playerbuff = {{1966}, {185311}},
    cooldown = 185311,
    smallCooldown = true,
  })
]]--

--[[
  -- Cloak of Shadows
  self:newSpell({
    requiredLevel = 80,
    playerbuff = 31224,
    cooldown = 31224,
  })
]]--

--[[
  -- Evasion / Riposte
  self:newSpell({
    requiredLevel = 10,
    playerbuff = {{5277}, {199754}},
    cooldown = {5277, 199754},
  })
]]--

end
