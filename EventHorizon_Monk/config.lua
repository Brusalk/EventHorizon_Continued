local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 115921 -- Legacy of the Emperor
	self.config.hastedSpellID = {115178,10} -- Resuscitate

    -- -- Chi Wave
    -- self:newSpell({
        -- cooldown = 115098,
        -- requiredTalent = 4,
    -- }) 
    
    -- -- Zen Spehere
    -- self:newSpell({
        -- cooldown = 124081,
        -- playerbuff = {124081, 2},
        -- requiredTalent = 5,
    -- })  
    
    -- -- Chi Burst
    -- self:newSpell({
        -- cooldown = 123986,
        -- cast = 123986,
        -- requiredTalent = 6,
    -- })  
    
    -- -- Rushing Jade Wind
    -- self:newSpell({
        -- cooldown = 116847,
        -- playerbuff = {116847, 1},
        -- requiredTalent = 16,
    -- })   
    
    -- -- Hurricane Strike
    -- self:newSpell({
        -- cooldown = 152175,
        -- requiredTalent = 19,
        -- requiredTree = {1, 3},
    -- })
    
    -- -- Breath of the Serpent
    -- self:newSpell({
        -- cooldown = 157535,
        -- playerbuff = 157627,
        -- requiredTree = 2,
        -- requiredTalent = 19,
    -- })
    
    -- -- Serenity
    -- self:newSpell({
        -- cooldown = 152173,
        -- playerbuff = 152173,
        -- requiredTalent = 21,
        -- requiredTree = {1, 3},
    -- })
    
	-- -- Mistweaver
        -- --Soothing Mist
        -- self:newSpell({
            -- refreshable = true,
            -- playerbuff = 115175,
            -- auraunit = usemouseover and 'mouseover' or 'target',
            -- hasted = true,
            -- requiredTree = 2,
            -- requiredLevel = 10,
        -- })

        -- --Renewing Mist
        -- self:newSpell({
            -- refreshable = true,
            -- playerbuff = 115151,
            -- auraunit = usemouseover and 'mouseover' or 'target',
            -- hasted = true,
            -- cooldown = 115151,
            -- requiredTree = 2,
            -- requiredLevel = 10,
        -- })
        
        -- --Enveloping Mist
        -- self:newSpell({
            -- cast = {124682,116694},
            -- refreshable = true,
            -- playerbuff = 124682,
            -- auraunit = usemouseover and 'mouseover' or 'target',
            -- hasted = true,
            -- requiredTree = 2,
            -- requiredLevel = 10,
        -- })

        -- --Mana Tea
        -- self:newSpell({
            -- playerbuff = 115867,
            -- cooldown = 123761,
            -- cast = 115867,
            -- channeled = 115867,
            -- requiredTree = 2,
            -- requiredLevel = 58,
        -- })
	
	-- --Windwalker
	
        -- --Tiger Power
        -- self:newSpell({
            -- playerbuff = 125359,
            -- requiredTree = 3,
            -- requiredLevel = 10,
        -- })
        
        -- --Rising Sun Kick
        -- self:newSpell({
            -- cooldown = 107428,
            -- debuff = 107428,
            -- requiredTree = 3,
            -- requiredLevel = 10,
        -- })
        
        -- --Fist of Fury + Spinning Crane Kick
        -- self:newSpell({
            -- cooldown = 113656,
            -- playerbuff = 101546,
            -- channeled = 113656,
            -- requiredTree = 3,
            -- requiredLevel = 10,
        -- })
        
        -- --Tigereye Brew
        -- self:newSpell({
            -- playerbuff = 125195,
            -- requiredTree = 3,
            -- requiredLevel = 60,
        -- })
		
    
    -- -- Brewmaster
        
        -- -- Elusive Brew
        -- self:newSpell({
            -- playerbuff = 128939,
            -- cooldown = 115308,
            -- requiredTree = 1,
        -- })
        
        -- -- Keg Smash
        -- self:newSpell({
            -- cooldown = 121253,
            -- requiredTree = 1,
        -- })
        
        -- -- Guard
        -- self:newSpell({
            -- cooldown = 115295,
            -- playerbuff = 115295,
            -- requiredTree = 1,
        -- })
        
        -- -- Expel Harm
        -- self:newSpell({
            -- cooldown = 115072,
            -- requiredTree = 1,
        -- })

        -- -- Fortifying Brew
        -- self:newSpell({
            -- cooldown = 115203,
            -- playerbuff = 120954,
            -- requiredTree = 1,
        -- })
        
        -- -- Zen Meditation
        -- self:newSpell({
            -- cooldown = 115176,
            -- channel = 115176,
            -- requiredTree = 1,
        -- })
        
        



















    
end
