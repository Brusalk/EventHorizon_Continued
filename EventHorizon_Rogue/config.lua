function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 1966
  self.config.past = -1 -- Number of seconds to show in the past. Default = -3
  self.config.future = 11 -- Number of seconds to show in the future. Default = 11

  -- Assassination

  --[[ Blindside
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    playerbuff = 121153,
     barcolors   = {
     playerbuff  = {252/255, 020/255, 020/255, 0.7}
     },
  })
]]
  -- Slice and Dice with Vanish CD at half height.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 9,
    playerbuff = 315496,
    smallCooldown = true,
    cooldown = 1856,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {242/255, 242/255, 040/255, 0.6}
     },
  })

  -- Garrote
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 16,
    debuff = {703,2},
    cooldown = 703,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {191/255, 040/255, 101/255, 0.5}
     },
  })

  -- Rupture with Exsanguinate cooldown at half height if chosen.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 20,
    debuff = {1943,2},
    cooldown = 200806,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {252/255, 000/255, 000/255, 0.4}
     },
  })

  -- Elaborate Planning
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 2,
    playerbuff = 193641,
     barcolors   = {
     playerbuff  = {252/255, 232/255, 060/255, 0.5}
     },
  })

  -- Envenom
  self:newSpell({
    requiredTree = 1,
    requiredTalentUnselected = 9,
    playerbuff = 32645,
     barcolors   = {
     playerbuff  = {030/255, 131/255, 000/255, 0.5}
     },
  })

  -- Envenom with Marked for Death cooldown at half height, if chosen.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 9,
    playerbuff = 32645,
    cooldown = 137619,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {030/255, 131/255, 000/255, 0.5}
     },
  })

  -- Shiv (currently guessing at debuff name for the Rank 2 version)
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 32,
    cooldown = 5938,
    debuff = 319032,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {111/255, 151/255, 070/255, 0.9}
     },
  })

  -- Vendetta
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 42,
    debuff = {79140,0},
    cooldown = 79140,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.5},
     debuffmine  = {191/255, 171/255, 161/255, 0.5}
     },
  })

  -- Crimson Tempest
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    debuff = {121411, 2},
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {222/255, 060/255, 070/255, 0.4}
     },
   })

--[[ testing this as a CD under the S&D bar.
   -- Vanish
  self:newSpell({
    requiredTree = 1,
    requiredTalentUnselected = 21,
    cooldown = 1856,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     },
  })
]]
  -- Outlaw

  -- Slice and Dice with Roll the Bones CD at half height. 315341
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 9,
    playerbuff = 315496,
    cooldown = 315508,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.8},
     playerbuff  = {242/255, 242/255, 040/255, 0.6}
     },
  })

  -- Between the Eyes
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 40,
    debuff = 315341,
    cooldown = 315341,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.8},
     debuffmine  = {161/255, 090/255, 020/255, 0.6}
     },
  })

  -- Ghostly Strike
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 3,
    debuff = 196937,
    cooldown = 196937,
    refreshable = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     debuffmine  = {252/255, 161/255, 010/255, 0.7}
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
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {252/255, 030/255, 040/255, 0.7}
     },
  })

  -- Blade Flurry
  self:newSpell({
    requiredTree = 2,
    playerbuff = 13877,
    cooldown = 13877,
    refreshable = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.3},
     playerbuff  = {252/255, 101/255, 101/255, 0.7}
     },
  })
--[[
  -- Blade Rush
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 20,
    playerbuff = 271896,
    cooldown = 271877,
  })

  -- Killing Spree
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 21,
    cooldown = 51690,
  })
]]
    -- Alacrity
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {17, 19},
    playerbuff = 193539,
     barcolors   = {
     playerbuff  = {252/255, 252/255, 151/255, 0.6}
     },
  })

  -- Alacrity with Blade Rush cooldown at half height.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {17, 20},
    playerbuff = 193539,
    cooldown = 271877,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.9},
     playerbuff  = {252/255, 252/255, 151/255, 0.5}
     },
  })

  -- Alacrity with Killing Spree cooldown at half height.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {17, 21},
    playerbuff = 193539,
    cooldown = 51690,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.9},
     playerbuff  = {252/255, 252/255, 151/255, 0.5}
     },
  })

  -- Blade Rush if Alacrity not taken.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 20,
    requiredTalentUnselected = 17,
    playerbuff = 271896,
    cooldown = 271877,
  })

  -- Dreadblades
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 18,
    playerbuff = 343142,
    cooldown = 343142,
    barcolors = {
      cooldown    = {202/255, 161/255, 050/255, 0.5},
      },
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
    requiredLevel = 42,
    playerbuff = 13750,
    cooldown = 13750,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {252/255, 202/255, 121/255, 0.7},
     },
  })

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

  -- Slice and Dice with Vanish CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 9,
    playerbuff = 315496,
    smallCooldown = true,
    cooldown = 1856,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {242/255, 242/255, 040/255, 0.6}
     },
  })

  -- Rupture with Marked for Death cooldown at half height, if selected.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 17,
    debuff = {1943,2},
    cooldown = 137619,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {252/255, 000/255, 000/255, 0.4}
     },
  })

  -- Symbols of Death
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 29,
    playerbuff = 212283,
    cooldown = 212283,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {232/255, 010/255, 232/255, 0.7}
     },
  })

  -- Shadow Dance
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 22,
    playerbuff = 185313,
    recharge = 185313,
     barcolors   = {
     recharge    = {121/255, 141/255, 191/255, 0.4},
     playerbuff  = {010/255, 131/255, 202/255, 0.7}
     },
  })

  -- Find Weakness
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 37,
    requiredTalent = 19,
    debuff  = 316220,
     barcolors   = {
     debuffmine  = {010/255, 212/255, 080/255, 0.6}
     },
  })

  -- Find Weakness with Secret Technique cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 37,
    requiredTalent = 20,
    debuff  = 316220,
    cooldown = 280719,
    smallCooldown = true,
     barcolors   = {
     debuffmine  = {010/255, 212/255, 080/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.9}
     },
  })

  -- Find Weakness with Shuriken Tornado cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 37,
    requiredTalent = 21,
    debuff  = 316220,
    cooldown = 277925,
    smallCooldown = true,
     barcolors   = {
     debuffmine  = {010/255, 212/255, 080/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.9}
     },
  })

  --[[ Not sure if this should be tracked or not.
  -- Alacrity
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 17,
    playerbuff  = 193539,
     barcolors   = {
     playerbuff  = {252/255, 252/255, 151/255, 0.6}
     },
  })
]]

  -- Shadow Blades
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 42,
    playerbuff = 121471,
    cooldown = 121471,
     barcolors   = {
     playerbuff  = {111/255, 060/255, 202/255, 0.5}
     },
  })

  -- If you'd like any of the following defensive abilities tracked remove the --[[ and ]]-- surounding the spell config for the one you'd like. Depending on talents chosen this can make the bar list very long.

--[[
  -- Feint & Crimson Vial
  self:newSpell({
    requiredLevel = 8,
    playerbuff = {{1966}, {185311}},
    cooldown = 185311,
    smallCooldown = true,
  })
]]--

--[[
  -- Cloak of Shadows
  self:newSpell({
    requiredLevel = 47,
    playerbuff = 31224,
    cooldown = 31224,
  })
]]--

--[[
  -- Evasion
  self:newSpell({
    requiredLevel = 10,
    playerbuff   = 5277,
    cooldown     = 5277,
  })
]]--


end
