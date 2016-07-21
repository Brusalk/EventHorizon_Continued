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