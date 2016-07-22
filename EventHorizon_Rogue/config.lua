function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 1966

	-- Assassination
	
	-- Rupture
	self:newSpell({
		debuff = {1943,2},
		requiredTree = 1,
	})

	-- Garrote
	self:newSpell({
		debuff = {703,2},
		cooldown = 703,
		requiredTree = {1},
	})
	
	--Hemmorrhage
	self:newSpell({
		debuff = {16511,0},
		requiredTree = 1,
		requiredTalent = 3,
	})
	
	-- Envenom
	self:newSpell({
		playerbuff = {32645,0},
		requiredTree = 1,
	})
	
	-- Exsanguinate
	self:newSpell({
		cooldown = 200806,
		requiredTree = 1,
		requiredTalent = 18,
	})

	--Kingsbanee
	self:newSpell({
		debuff = {192759,2},
		cooldown = 192759,
		requiredTree = 1,
	})
	
	-- Vendetta
	self:newSpell({
		debuff = {79140,0},
		cooldown = 79140,
		requiredTree = 1,
	})
	
	-- Vanish
	self:newSpell({
		cooldown = 1856,
		requiredTree = 1,
		requiredTalent = 4,
	})

	-- Subtlety

	-- Symbols of Death
	self:newSpell({
		playerbuff = 212283,
		requiredTree = 3,
		requiredLevel = 34,
	})

	-- Enveloping Shadows
	self:newSpell({
		playerbuff = 206237,
		requiredTree = 3,
		requiredLevel = 90,
		requiredTalent = 18, 
	})
	
	-- Nightblade
	self:newSpell({
		debuff = {195452,2},
		requiredTree = 3,
		requiredLevel = 46,
	})

	-- Vanish
	self:newSpell({
		cooldown = 1856,
		requiredTree = 3,
		requiredLevel = 34,
	})
	
	-- Shadow Dance
	self:newSpell({
		playerbuff = {185313,0},
		cooldown = 185313,
		requiredTree = 3,
		requiredLevel = 5,
	})   

	-- Shadow Blades
	self:newSpell({
		playerbuff = 121471,
		cooldown = 121471,
		requiredTree = 3,
		requiredLevel = 72,
	})
	
	-- Common

	-- 100 Talents

	-- Marked for Death
	self:newSpell({ 
		debuff = {137619,0},
		cooldown = 137619,
		requiredTalent = 20,
	})
	
	-- Death from Above
	self:newSpell({
			cooldown = 152150,
			requiredTalent = 21,
	})

	-- Feint
	self:newSpell({
		playerbuff = {1966},
	})
	
end