function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 1966

  -- Assassination

  -- Garrote
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 12,
	debuff = {703,2},
	cooldown = 703,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.6},
		debuffmine	= {191/255, 040/255, 101/255, 0.5}
	  },
  })

  -- Rupture with Kingsbane cooldown at half height if you have it.
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 20,
	debuff = {1943,2},
	cooldown = 192759,
	smallCooldown = true,
	  barcolors = {
		cooldown	= {202/255, 161/255, 050/255, 0.6},
		debuffmine	= {252/255, 000/255, 000/255, 0.4}
	  },
  })

  -- Elaborate Planning
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 2,
	playerbuff = 193641,
	  barcolors = {
		playerbuff	= {252/255, 232/255, 060/255, 0.5}
	  },
  })

  --Hemmorrhage
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 3,
	debuff = {16511,0},
	  barcolors = {
		debuffmine	= {232/255, 090/255, 090/255, 0.6}
	  },
  })

  -- Surge of Toxins if you've got the artifact trait.
  self:newSpell({
	requiredTree = 1,
	requiredArtifactTalent = 192424,
	debuff = 192425,
	  barcolors = {
		debuffmine	= {090/255, 090/255, 030/255, 0.5},
	  },
  })

  -- Envenom with Marked for Death or Death from Above cooldown at half height, if chosen.
  self:newSpell({
	requiredTree = 1,
	playerbuff = 32645,
	cooldown = {137619, 152150},
	smallCooldown = true,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.6},
		playerbuff	= {030/255, 131/255, 000/255, 0.5}
	  },
  })

  -- Toxic Blade
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 16,
	debuff = 245389,
	cooldown = 245388,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.6},
		debuffmine	= {111/255, 151/255, 070/255, 0.9}
	  },
  })

  -- Alacrity
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 17,
	playerbuff = 193539,
	  barcolors = {
		playerbuff	= {252/255, 252/255, 151/255, 0.7}
	  },
  })

  -- Exsanguinate
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 18,
	cooldown = 200806,
  })

  -- Vendetta
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 56,
	debuff = {79140,0},
	cooldown = 79140,
  })

  -- Vanish
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 4,
	cooldown = 1856,
  })

  -- Outlaw

  -- Roll the Bones and Sprint cooldown at half height.
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 40,
	requiredTalentUnselected = 19,
	icon = 193316,
	playerbuff = {{193356,0},{193357,0},{193358,0},{193359, 0},{199600,0},{199603,0}},
	cooldown = 2983,
	smallCooldown = true,
  })

  -- Slice and Dice and Sprint cooldown at half height.
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 19,
	playerbuff = 5171,
	cooldown = 2983,
	smallCooldown = true,
  })

  -- Ghostly Strike
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 1,
	debuff = 196937,
	refreshable = true,
	  barcolors = {
		debuffmine	= {222/255, 111/255, 111/255, 0.7}
	  },
  })

  -- Opportunity
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 11,
	playerbuff = 195627,
	icon = 185763,
	  barcolors = {
		playerbuff	= {252/255, 030/255, 040/255, 0.7}
	  },
  })

  -- Alacrity
  self:newSpell({
	requiredTree = 2,
	requiredTalent = {17, 19},
	playerbuff = 193539,
	  barcolors = {
		playerbuff	= {252/255, 252/255, 151/255, 0.7}
	  },
  })

  -- Alacrity with Marked for Death cooldown at half height.
  self:newSpell({
	requiredTree = 2,
	requiredTalent = {17, 20},
	playerbuff = 193539,
	cooldown = 137619,
	smallCooldown = true,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.7},
		playerbuff	= {252/255, 252/255, 151/255, 0.4}
	  },
  })

  -- Alacrity with Death from Above cooldown at half height.
  self:newSpell({
	requiredTree = 2,
	requiredTalent = {17, 21},
	playerbuff = 193539,
	cooldown = 152150,
	smallCooldown = true,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.7},
		playerbuff	= {252/255, 252/255, 151/255, 0.4}
	  },
  })

  -- Marked for Death if Alacrity not taken.
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 20,
	requiredTalentUnselected = 17,
	cooldown = 137619,
  })

  -- Death from Above if Alacrity not taken.
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 21,
	requiredTalentUnselected = 17,
	cooldown = 152150,
  })

  -- Cannonball Barrage
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 16,
	cooldown = 185767,
  })

  -- Curse of the Dreadblades
  self:newSpell({
	requiredTree = 2,
	requiredArtifactTalent = 202665,
	playerbuff = 202665,
	cooldown = 202665,
	  barcolors = {
		cooldown	= {202/255, 161/255, 050/255, 0.6},
		playerbuff	= {202/255, 161/255, 050/255, 0.7}
	  },
  })

  -- Killing Spree
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 18,
	playerbuff = 51690,
	cooldown = 51690,
  })

  -- Adrenaline Rush
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 56,
	playerbuff = 13750,
	cooldown = 13750,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.6},
		playerbuff	= {242/255, 161/255, 040/255, 0.7}
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

  -- Symbols of Death
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 36,
	playerbuff = 212283,
	cooldown = 212283,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.6},
		playerbuff	= {232/255, 010/255, 232/255, 0.7}
	  },
  })

  -- Nightblade with Goremaw's Bite cooldown at half height, if you've got it.
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 20,
	debuff = {195452,2},
--	cooldown = 209782,
	cooldown = 137619,
	smallCooldown = true,
	  barcolors = {
		cooldown	= {202/255, 161/255, 050/255, 0.7},
		debuffmine	= {080/255, 030/255, 121/255, 0.6}
	  },
  })

  -- Shadow Dance
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 40,
	playerbuff = 185313,
	recharge = 185313,
	  barcolors = {
		recharge	= {171/255, 191/255, 181/255, 0.5},
		playerbuff	= {010/255, 131/255, 202/255, 0.7}
	  },
  })

  -- Alacrity
  self:newSpell({
	requiredTree = 3,
	requiredTalent = {17, 19},
	playerbuff = 193539,
	  barcolors = {
		playerbuff	= {252/255, 252/255, 151/255, 0.3}
	  },
  })

  -- Alacrity with Marked for Death cooldown at half height.
  self:newSpell({
	requiredTree = 3,
	requiredTalent = {17, 20},
	playerbuff = 193539,
	cooldown = 137619,
	smallCooldown = true,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.7},
		playerbuff	= {252/255, 252/255, 151/255, 0.4}
	  },
  })

  -- Alacrity with Death from Above cooldown at half height.
  self:newSpell({
	requiredTree = 3,
	requiredTalent = {17, 21},
	playerbuff = 193539,
	cooldown = 152150,
	smallCooldown = true,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.7},
		playerbuff	= {252/255, 252/255, 151/255, 0.4}
	  },
  })

  -- Master of Subtlety buff with Vanish cooldown at half height.
  self:newSpell({
	requiredTree = 3,
	requiredTalent = 1, 
	cooldown = 1856,
	smallCooldown = true,
	playerbuff = 31665,
	  barcolors = {
		cooldown	= {171/255, 191/255, 181/255, 0.7},
		playerbuff	= {121/255, 000/255, 020/255, 0.5}
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
		playerbuff	= {111/255, 060/255, 202/255, 0.5}
	  },
  })

  -- If you'd like any of the following defensive abilities tracked remove the --[[ and ]]-- surounding the spell config for the one you'd like. Depending on talents chosen this can make the bar list very long.

--[[
  -- Feint & Crimson Vial
  self:newSpell({
	requiredLevel = 16,
	playerbuff = {{1966},{185311}},
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
