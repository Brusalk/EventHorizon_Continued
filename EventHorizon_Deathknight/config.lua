function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 49998

	-- Blood

	-- Blood Plague & Blood Boil
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 55,
	  debuff = {55078,3},
	  cooldown = 50842,
	})

	-- Death and Decay & Crimson Scourge
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 56,
	  cooldown = 43265,
	  playerbuff = 81136,
	})

	-- Blooddrinker
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 3,
	  cooldown = 206931,
	  debuff = 206931,
	})

	-- Bonestorm
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 19,
	  cooldown = 194844,
	  debuff = 196528,
	})

	-- Blood Mirror
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 20,
	  cooldown = 206977,
	  debuff = 206977,
	})

	-- Marrowrend/Bone Shield & Consumption
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 55,
	  playerbuff = 195181,
	  cooldown = 205223,
	})

	-- Mark of Blood
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 10,
	  cooldown = 206940,
	  debuff = 206940,
	})

	-- Tombstone
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 12,
	  cooldown = 219809,
	  playerbuff = 219809,
	})

	-- Rune Tap
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 17,
	  cooldown = 194679,
	  playerbuff = 194679,
	})

	-- Anti-Magic Shell
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 57,
	  requiredTalentUnselected = 9,
	  cooldown = 48707,
	  playerbuff = {48707},
	})

	-- Anti-Magic Shell
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 9,
	  cooldown = 48707,
	  playerbuff = {205725,5},
	})

	-- Vampiric Blood
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 57,
	  cooldown = 55233,
	  playerbuff = 55233,
	})

	--Dancing Rune Weapon
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 57,
	  cooldown = 49028,
	  playerbuff = 49028,
	})

	-- Frost

	-- Frost Fever
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 55,
	  debuff = {55095,3},
	})

	-- Glacial Advance
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 21,
	  cooldown = 194913,
	})

	-- Pillar of Frost
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 57,
	  cooldown = 51271,
	  playerbuff = 51271,
	})

	-- Razorice & Horn of Winter
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 57,
	  debuff = {51714,0},
	  cooldown = 57330,
	})

	-- Remorseless Winter
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 57,
	  cooldown = 196770,
	  debuff = 196770,
	})

	-- Empower Rune Weapon
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 57,
	  cooldown = 47568,
	})

	-- Obliteration
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 19,
	  cooldown = 207256,
	  playerbuff = 207256,
	})

	-- Breath of Sindragosa
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 20,
	  channel = 152279,
	  cooldown = 152279,
	})

	-- Remove the --[[ and ]]-- from any of the damage reduction spells you'd like to track in Frost spec.
--[[
	-- Anti-Magic Shell
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 57,
	  cooldown = 48707,
	  playerbuff = 48707,
	})
]]--

--[[
	-- Icebound Fortitude
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 65,
	  cooldown = 48792,
	  playerbuff = 48792,
	})
]]--

	-- Unholy

	-- Virulent Plague & Epidemic
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 81,
	  debuff = {191587,3},
	  cooldown = 207317,
	  refreshable = true,
	})

	-- Festering Strike & Blighted Rune Weapon
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 57,
	  debuff = 194310,
	  cooldown = 194918,
	})

	-- Death and Decay, Sudden Doom and Dark Succor
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 74,
	  requiredTalentUnselected = 20,
	  cooldown = 43265,
	  playerbuff = {{101568}, {49530}},
	})

	-- Defile, Sudden Doom and Dark Succor
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 20,
	  cooldown = 152280,
	  playerbuff = {{101568}, {49530}},
	})

	-- Dark Transformation
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 74,
	  cooldown = 63560,
	  playerbuff = 63560,
	  auraunit = "pet",
	})

	-- Apocalypse
	self:newSpell({
	  requiredTree = 3,
	  requiredArtifactTalent = 220143,
	  cooldown = 220143,
	})

	-- Summon Gargoyle
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 75,
	  requiredTalentUnselected = 19,
	  cooldown = 49206,
	  static = 40,
	})

	-- Dark Arbiter
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 19,
	  cooldown = 207349,
	  static = 15,
	})

	-- Remove the --[[ and ]]-- from any of the damage reduction spells you'd like to track in Unholy spec.
--[[
	-- Corpse Shield
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 14,
	  cooldown = 207319,
	  playerbuff = 207319,
	})
]]--

--[[
	-- Anti-Magic Shell
	self:newSpell({
	  requiredTree = 3,
	  cooldown = 48707,
	  playerbuff = 48707,
	})
]]--

--[[
	-- Icebound Fortitude
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 65,
	  cooldown = 48792,
	  playerbuff = 48792,
	})
]]--

end
