function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 49895
	
	-- -- General Abilities (DoTs)
    
        -- -- Icy Touch
        -- self:newSpell({
            -- debuff = {55095,3},
            -- refreshable = true,
            -- hasted = false,
            -- cooldown = 77575,
            -- requiredTalentUnselected = 19, -- Hidden when Necrotic Plague is talented
        -- })
        
        -- -- Plague Strike
        -- self:newSpell({
            -- debuff = {55078,3},
            -- refreshable = true,
            -- hasted = false,
            -- cooldown = 77575,
            -- requiredTalentUnselected = 19,
        -- })
        
        -- -- Necrotic Plague replaces above two if talented
        -- self:newSpell({
            -- debuff = {152281,2},
            -- refreshable = true,
            -- hasted = false,
            -- cooldown = 77575,
            -- requiredTalent = 19,
        -- })
        
    -- -- Blood Abilities (WHY DOES BLOOD HAVE SO MANY COOLDOWNS!)
	
        -- -- Soul Reaper
        -- self:newSpell({
            -- cooldown = 114866,
            -- playerbuff = {50421, 0},
            -- requiredTree = 1,
        -- })
    
        -- -- Bone Shield
       	-- self:newSpell({
            -- playerbuff = 49222,
            -- cooldown = 49222,
            -- requiredTree = 1,
        -- })
    
        -- -- Rune Tap
        -- self:newSpell({
            -- playerbuff = 171049,
            -- cooldown = 48982,
            -- requiredTree = 1,
        -- })

    
        -- -- CDs
        -- -- Anti-magic Shell
        -- self:newSpell({
            -- cooldown = 48707,
            -- playerbuff = {48707, 0},
            -- requiredTree = 1,
        -- })
        
        -- -- Vampiric Blood
        -- self:newSpell({
            -- cooldown = 55233,
            -- playerbuff = {55233, 0},
            -- requiredTree = 1,
        -- })
        
        -- -- Dancing Rune Weapon
        -- self:newSpell({
            -- cooldown = 49028,
            -- playerbuff = {49028, 0},
            -- requiredTree = 1,
        -- })
        
        -- -- Death Pact
        -- self:newSpell({
            -- cooldown = 48743,
            -- debuff = {48743, 0},
            -- auraunit = "player",
            -- requiredTree = 1,
        -- })
        
        -- -- Icebound Fortitude
        -- self:newSpell({
            -- cooldown = 48792,
            -- playerbuff = {48792, 0},
            -- requiredTree = 1,
        -- })
	
	-- -- Frost tree
        -- -- Killing Machine
        -- self:newSpell({
            -- playerbuff = 51124,
            -- requiredTree = 2,
        -- })
        
        -- -- Freezing Fog
        -- self:newSpell({
            -- playerbuff = 59052,
            -- requiredTree = 2,
        -- })
        
        -- -- Pillar of Frost
        -- self:newSpell({
            -- playerbuff = 51271,
            -- cooldown = 51271,
            -- requiredTree = 2,
        -- })
        
	
	-- -- Unholy tree
       
        -- -- Sudden Doom
        -- self:newSpell({
            -- playerbuff = 81340,
            -- requiredTree = 3,
        -- })
        
        -- -- Shadow Infusion + Dark Transformation (Yes, they're exclusive)
        -- self:newSpell({
            -- playerbuff = {{91342,0},{63560,0}},
            -- auraunit = 'pet',
            -- requiredTree = 3,
        -- })

    -- -- All Specs
    
        -- -- Blood Tap/Runic Corruption
        -- self:newSpell({
            -- playerbuff = {{114851,0}, {51460, 0}},
            -- requiredTree = 1,
        -- })
        
        -- -- Death and Decay/Defile
        -- self:newSpell({
            -- cooldown = {43265, 152280},
        -- })
        
        -- -- Plague Leech/Unholy Blight
        -- self:newSpell({
            -- cooldown = {123693, 115989},
            -- playerbuff = 115989,
        -- })
end