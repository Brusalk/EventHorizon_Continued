function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 1966

	-- Assassination

	-- Garrote
	self:newSpell({
	  requiredTree = 1,
	  debuff = {703,2},
	  cooldown = 703,
	})

	-- Rupture & Marked for Death cooldown at half height if chosen.
	self:newSpell({
	  requiredTree = 1,
	  debuff = {1943,2},
	  cooldown = 137619,
	  smallCooldown = true,
	})

	-- Kingsbane if Master Poisoner is chosen, half height for consistency with the following two options.
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 1,
	  requiredArtifactTalent = {192759,1},
--	  debuff = {192759,2},
	  cooldown = 192759,
	  smallCooldown = true,
	})

	-- Elaborate Planning and the Kingsbane cooldown at half height if you have it.
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 2,
	  playerbuff = 193641,
	  cooldown = 192759,
	  smallCooldown = true,
	})

	--Hemmorrhage and the Kingsbane cooldown at half height if you have it.
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 3,
	  debuff = {16511,0},
	  cooldown = 192759,
	  smallCooldown = true,
	})

	-- Envenom
	self:newSpell({
	  requiredTree = 1,
	  requiredTalentUnselected = 21,
	  playerbuff = {32645,0},
	})

	-- Envenom & Death from Above
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 21,
	  playerbuff = {32645,0},
	  cooldown = 152150,
	  smallCooldown = true,
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

	-- Opportunity
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 11,
	  playerbuff = 195627,
	})

	-- Roll the Bones and Sprint cooldown at half height.
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 36,
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
	})

	-- Death from Above
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 21,
	  cooldown = 152150,
	})

	-- Marked for Death
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 20,
	  debuff = {137619,0},
	  cooldown = 137619,
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
	  requiredLevel = 72,
	  playerbuff = 13750,
	  cooldown = 13750,
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
	  requiredLevel = 34,
	  cooldown = 1856,
	})
]]--

	-- Subtlety

	-- Symbols of Death
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 34,
	  playerbuff = 212283,
	  cooldown = 212283,
	})

	-- Nightblade
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 46,
	  requiredTalentUnselected = 21,
	  debuff = {195452,2},
	})

	-- Nightblade & Death from Above
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 21,
	  debuff = {195452,2},
	  cooldown = 152150,
	  smallCooldown = true,
	})

	  -- Enveloping Shadows
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 18,
	  playerbuff = {206237,0},
	})

	  -- Goremaw's Bite
	self:newSpell({
	  requiredTree = 3,
	  requiredArtifactTalent = 209782,
	  playerbuff = {220901,0},
	  cooldown = 209782,
	})

	-- Vanish with Master of Subtlety talent.
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 1, 
	  requiredLevel = 34,
	  cooldown = 1856,
	  playerbuff = 31665,
	})

	-- Vanish
	self:newSpell({
	  requiredTree = 3,
	  requiredTalentUnselected = 1, 
	  requiredLevel = 34,
	  cooldown = 1856,
	})

	-- Shadow Dance
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 5,
	  playerbuff = {185313,0},
	  cooldown = 185313,
	})

	-- Marked for Death
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 20,
	  debuff = {137619,0},
	  cooldown = 137619,
	})

	-- Shadow Blades
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 72,
	  playerbuff = 121471,
	  cooldown = 121471,
	})

	-- If you'd like any of the following defensive abilities tracked remove the --[[ and ]]-- surounding the spell config for the one you'd like. Depending on talents chosen this can make the bar list very long.

--[[
	-- Feint & Crimson Vial
	self:newSpell({
	  requiredLevel = 14,
	  playerbuff = {{1966},{185311}},
	  cooldown = 185311,
	  smallCooldown = true,
	})
]]--

--[[
	-- Cloak of Shadows
	self:newSpell({
	  requiredLevel = 58,
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
