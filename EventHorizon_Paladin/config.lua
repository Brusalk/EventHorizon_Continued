local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 19750 -- Flash of Light
	self.config.hastedSpellID = {7328,10} -- Redemption, probably not needed at all
	

	-- Holy

	-- Judgment
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 3,
	  cooldown = 20271,
	  debuff = 214222,
	})

	-- Holy Shock
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 10,
	  cooldown = 20473,
	  cast = {19750, 82326},
	})

	-- Light of Dawn
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 58,
	  cooldown = 85222,
	})

	-- Bestow Faith
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 1,
	  cooldown = 223306,
	})

	-- Beacon of Virtue
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 21,
	  cooldown = 200025,
	  playerbuff = 200025,
	  auraunit = usemouseover and 'mouseover' or 'target',
	})

	-- Holy Prism
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 15,
	  cooldown = 114165,
	})

	-- Light's Hammer
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 2,
	  cooldown = 114158,
	})

	-- Tyr's Deliverance
	self:newSpell({
	  requiredTree = 1,
	  requiredArtifactTalent = 200652,
	  cooldown = 200652,
	  playerbuff = 200652,
	  auraunit = usemouseover and 'mouseover' or 'target',
	})

	-- Holy Avenger
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 14,
	  cooldown = 105809,
	  playerbuff = 105809,
	})

	-- Avenging Wrath
	self:newSpell({
	  requiredTree = 1,
	  cooldown = 31842,
	  playerbuff = 31842,
	})

	-- Aura of Mercy
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 12,
	  cooldown = 183415,
	})

	-- Aura Mastery
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 65,
	  cooldown = 31821,
	  playerbuff = 31821,
	})


	-- Protection

	-- Judgment
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 3,
	  cooldown = 20271,
	  debuff = 196941,
	})

	-- Consecration
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 32,
	  cooldown = 26573,
	  debuff = {26573,1},
	})

	-- Hammer of the Righteous/Blessed Hammer
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 10,
	  cooldown = {53595, 204019},
	  debuff = 204301,
	})

	-- Avenger's Shield
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 10,
	  cooldown = 31935,
	})

	-- Shield of the Righteous & Seraphim
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 24,
	  cooldown = {53600, 152262},
	  playerbuff = {53600, 152262},
	})

	-- Knight Templar
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 14,
	  cooldown = 204139,
	  playerbuff = 204139,
	})

	-- Light of the Protector/Hand of the Protector
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 12,
	  cooldown = {184092, 213652},
	})

	-- Eye of Tyr
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 100,
	  cooldown = 209202,
	  debuff = 209202,
	})

	-- Avenging Wrath
	self:newSpell({
	  requiredTree = 2,
	  cooldown = 31884,
	  playerbuff = 31884,
	})

	-- Bastion of Light
	self:newSpell({
	  requiredTree = 2,
	  cooldown = 204035,
	})

	-- Blessing of Spellwarding
	self:newSpell({
	  requiredTree = 2,
	  cooldown = 204018,
	  playerbuff = 204018,
	  auraunit = usemouseover and 'mouseover' or 'player',
	})

	-- Aegis of Light
	self:newSpell({
	  requiredTree = 2,
	  cooldown = 204150,
	  playerbuff = 204150,
	  auraunit = usemouseover and 'mouseover' or 'player',
	})

	-- Retribution

	-- Judgment
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 3,
	  cooldown = 20271,
	  debuff = {197277,0},
	})

	-- Crusader Strike
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 1,
	  requiredTalentUnselected = 5,
	  cooldown = 35395,
	})

	-- Zeal
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 5,
	  cooldown = 217020,
	  debuff = {217020,0},
	})

	-- Blade of Justice
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 16,
	  requiredTalentUnselected = 11,
	  cooldown = 184575,
	})

	-- Blade of Wrath
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 11,
	  cooldown = 202270,
	  debuff = {202270,2},
	})

	-- Divine Hammer
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 12,
	  cooldown = 198034,
	  debuff = {198034,2},
	})

	-- Execution Sentence
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 2,
	  cooldown = 213757,
	  debuff = {213757,7},
	  hasted = true,
	})

	-- Consecration
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 3,
	  cooldown = 205228,
	})

	-- Wake of Ashes
	self:newSpell({
	  requiredTree = 3,
	  requiredArtifactTalent = 205273,
	  cooldown = 205273,
	  debuff = 205273,
	})

	-- Eye for an Eye
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 14,
	  cooldown = 205191,
	  playerbuff = 205191,
	})

	-- Avenging Wrath
	self:newSpell({
	  requiredTree = 3,
	  requiredTalentUnselected = 20,
	  cooldown = 31884,
	  playerbuff = 31884,
	})

	-- Crusade
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 20,
	  cooldown = 224668,
	  playerbuff = 224668,
	})

	-- Shield of Vengeance
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 9,
	  cooldown = 115750,
	  playerbuff = 115750,
	})

	-- Holy Wrath
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 21,
	  cooldown = 210220,
	})

	-- Divine Shield
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 18,
	  cooldown = 642,
	  playerbuff = 642,
	})

	-- Situational CC spells, not included by default.
--[[
	-- Repentance
	self:newSpell({
	  requiredTree = 1,2,3,
	  requiredTalent = 8,
	  cooldown = 20066,
	})
]]--

--[[
	-- Blinding Light
	self:newSpell({
	  requiredTree = 1,2,3,
	  requiredTalent = 9,
	  cooldown = 115750,
	})
]]--

end
