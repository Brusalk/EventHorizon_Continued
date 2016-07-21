function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 17962
	self.config.hastedSpellID = {6201,3} -- Create Healthstone
	

	-- *** Destruction *** --
	
	--Immolate
	self:newSpell({
		cast = 348,
		debuff = {348,3},
		recast = true,
		requiredTree = 3,
	})
	
	--Conflag/backdraft/incinerate/chaos bolt
	self:newSpell({
		playerbuff = 117828,
		cooldown = 17962, 
		cast = {116858, 29722, 5740},
		channeled = {689, 6},
		icon = 17962,
		requiredTree = 3,
	})
	
	-- Chaos Bolt/Eradication
	self:newSpell({
		debuff = 196414,
		requiredTree = 3,
		requiredTalent = 10,
	})
	
	-- Channel Demonfire
	self:newSpell({
		cooldown = 196447,
		hasted = true,
		channeled = {196447, 15},
		requiredTree = 3,
		requiredTalent = 20,
	})
	
	--Havoc
	self:newSpell({
		debuff = {80240,0},
		cooldown = 80240,
		requiredTree = 3,
	})
    
	--Mana Tap (BLIZZARD PLEASE REMOVE, FOR THE LOVE OF GOD)
	self:newSpell({
		playerbuff = 196104,
		requiredTree = 3,
		requiredTalent = 6,
	})
	
	-- Cata
	self:newSpell({
		cast = 152108,
		cooldown = 152108,
		requiredTree = 3,
		requiredTalent = 11,
	})
	
	-- Soul Harvest
	self:newSpell({
		cast = 196098,
		cooldown = 196098,
		requiredTree = 3,
		requiredTalent = 12,
	})
	
	-- GrimService
	self:newSpell({
		cooldown = 111859,
		requiredTree = 3,
		requiredTalent = 17,
	})
	
    -- Summon Doomguard/Infernal
	self:newSpell({
		cooldown = {18540, 1122},
		requiredTree = 3,
	})
    
	
    
end






