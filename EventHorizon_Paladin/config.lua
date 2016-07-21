local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 19750 -- Flash of Light
	self.config.hastedSpellID = {7328,10} -- Redemption, probably not needed at all
	
	--Protection	

	--Judgment
	self:newSpell({
		cooldown = 20271,
		requiredLevel = 1,
		requiredTree = 2,
	})		
	
	--Avenger's Shield
    self:newSpell({
        cooldown = 31935,
        requiredTree = 2,
		requiredLevel = 10,
	})
        
    --Consecration
    self:newSpell({
        cooldown = 26573,
        requiredTree = 2,
        requiredLevel = 32,
    })
		
	--Light of the Protector/Hand of the Protector (does not currently track artifact trait HoT)
	self:newSpell({
		cooldown = {184092, 213652},
		requiredTree = 2,
		requiredLevel = 12,
	})
		
	--Optional

	--Shield of the Righteous (does not display charges)
	--self:newSpell({
		--cooldown = 53600,
		--requiredLevel = 38,
		--requiredTree = 2,
		--playerbuff = 53600,
		--icon = 53600,
	--})

	--Hammer of the Righteous/Blessed Hammer combined (icon does not change)
	self:newSpell({
		cooldown = {53595, 204019},
		requiredTree = 2,
		requiredLevel = 10,			
	})

	--Hammer of the Righteous solo (Broken)
		--self:newSpell({
			--cooldown = 53595,
			--requiredTree = 2,
			--requiredLevel = 10,
			--requiredTalent = {13, 14},
		--})
		
	--Blessed Hammer solo
		--self:newSpell({
			--cooldown = 204019,
			--requiredTree = 2,
			--requiredLevel = 75,
			--requiredTalent = 15
		--})
    
        
    --Avenging Wrath
        --self:newSpell({
            --playerbuff = 31884,
            --cooldown = 31884,
            --requiredTree = 2,
        --})
  
        
    --Seraphim
        --self:newSpell({
            --cooldown = 152262,
            --playerbuff = 152262,
            --requiredTree = 2,
            --requiredTalent = 20,
        --})
		
	--Eye of Tyr
		--self:newSpell({
			--cooldown = 209202,
			--debuff = 209202,
			--requiredTree = 2,
			--requiredLevel = 100,
		--})
end