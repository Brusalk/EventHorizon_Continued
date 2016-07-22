local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 8042 -- Searing Totem
	self.config.hastedSpellID = {2008,10} -- Ancestral Spirit
	
	-- Elemental
	
	-- Ascendance (Elemental)
    self:newSpell({
        cooldown = 114050,
        playerbuff = 114050,
        requiredTree = 1,
		requiredTalent = 19
    })
	
	-- Fire Elemental
	self:newSpell({
        cooldown = 198067,
        playerbuff = 198067,
        requiredTree = 1
    })
		
	-- Flame Shock
	self:newSpell({
		debuff = {188389,2},
		cooldown = 188389,
		requiredTree = {0,1},
		requiredLevel = 5
	})

	-- Lava Burst
	self:newSpell({
		cast = 51505,
		cooldown = 51505,
		requiredTree = 1,
		requiredLevel = 12
	})
	
    -- Elemental Blast
    self:newSpell({
		cast = 117014,
        cooldown = 117014,
        playerbuff = 117014,
        requiredTalent = 10
    })
		
	-- Icefury
	self:newSpell({
		cast = 210714,
		cooldown = 210714,
		playerbuff = 210714,
		requiredTalent = 20
	})
	
	-- Lightning Bolt + Chain Lightning
	self:newSpell({
		cast = {188196,188443,205495},
		cooldown = 205495,
		playerbuff = 205495,
		requiredTree = 1		
	})
	
	-- Power of the Maelstrom
	self:newSpell({
		playerbuff = 191861 
	})

    -- Liquid Magma, currently unable to track totem uptime
    self:newSpell({
		cooldown = 192222,
        requiredTalent = 21,
        requiredTree = 1
    })

    -- Totem Mastery, currently unable to track totem uptime
    self:newSpell({
		cooldown = 210643,
        requiredTalent = 3,
        requiredTree = 1
    }) 	
end