local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 17057 -- Bear Form
	self.config.hastedSpellID = {50769,10} -- Revive
	
	-- -- Feral bars

	-- -- Savage Roar
	-- self:newSpell({
		-- playerbuff = 52610,
		-- stance = 2,
		-- requiredTree = 2,
	-- })

	-- -- Rake
	-- self:newSpell({
		-- debuff = {1822,3},
		-- refreshable = true,
		-- stance = 2,
		-- requiredTree = 2,
		-- requiredLevel = 8,
	-- })

	-- -- Moonfire
	-- self:newSpell({
		-- debuff = {155625,2},
		-- refreshable = true,
		-- hasted = true,
		-- requiredTree = 2,
		-- requiredTalent = 19,
		-- stance = 2,
	-- })
	
	-- -- Rip 
	-- self:newSpell({
		-- debuff = {1079,2},
		-- refreshable = true,
		-- stance = 2,
		-- requiredTree = 2,
	-- })

	-- -- Trash 
	-- self:newSpell({
		-- debuff = {106830,3},
		-- refreshable = true,
		-- stance = {1,2},
		-- requiredTree = 2,
	-- })
	
	-- -- Bloodtalons
	-- self:newSpell({
		-- playerbuff = 145152,
		-- requiredTree = 2,
		-- requiredTalent = 20,
		-- stance = 2,
	-- })

	-- -- Tiger's Fury,
	-- self:newSpell({
		-- cooldown = 5217,
		-- playerbuff = 5217,
		-- stance = 2,
		-- requiredTree = 2,
		-- requiredLevel = 24,
	-- })	


	-- -- Guardian bars
	
	-- -- Mangle
	-- self:newSpell({
		-- unique = true,
		-- refreshable = true,
		-- cooldown = 33917,
		-- stance = 1,
	-- })	
	
	-- -- Lacerate
	-- self:newSpell({
		-- debuff = {33745,3},
		-- refreshable = true,
		-- cooldown = 33745,
		-- stance = 1,
		-- requiredTree = 3,
		-- requiredLevel = 18,
	-- })
	
	-- -- Thrash
	-- self:newSpell({
		-- debuff = {106830,3},
		-- refreshable = true,
		-- cooldown = 106830,
		-- stance = {1,2},
		-- requiredTree = 3,
		-- requiredLevel = 28,
	-- })	

	-- -- Savage Defense
	-- self:newSpell({
		-- cooldown = 62606,
		-- playerbuff = 132402,
		-- requiredTree = 3,
		-- stance = 1,
	-- })
	
	-- -- Pulverize
	-- self:newSpell({
		-- playerbuff = 80313,
		-- cooldown = 80313,
		-- requiredTree = 3,
		-- requiredTalent = 20,
		-- stance = 1,
	-- })

	-- -- Berserk
	-- self:newSpell({
		-- playerbuff = 50334,
		-- cooldown = 50334,
		-- stance = {1,2},
		-- requiredTree = {2,3},
		-- requiredLevel = 69,
	-- })


	-- -- Balance bars - NOTE: Untalented Druids will see some of these.
	
	-- -- Starsurge
	-- self:newSpell({
		-- cast = 78674,
		-- cooldown = 78674,
		-- playerbuff = 93400, -- Shooting Stars
		-- requiredTree = 1,
	-- })

	-- -- Wrath
	-- self:newSpell({
		-- playerbuff = 48517, -- If using another method to track Eclipse phases, can monitor Solar Empowerment with "129633"
		-- cast = 5176,
		-- requiredTree = {0,1},
	-- })
	
	-- -- Starfire
	-- self:newSpell({
		-- playerbuff = 48518, -- If using another method to track Eclipse phases, can monitor Lunar Empowerment with "129632"
		-- cast = 2912,
		-- requiredLevel = 8,
		-- requiredTree = {0,1},
	-- })

	-- -- Stellar Flare
	-- self:newSpell({
		-- debuff = 152221,
		-- refreshable = true,
		-- requiredTalent = 20,
		-- requiredTree = {0,1},
	-- })
	
	-- -- [Sun/Moon]fire
	-- self:newSpell({
		-- debuff = {8921,0},
		-- refreshable = true,
		-- requiredLevel = 4,
		-- requiredTree = {0,1},
	-- })
	
	-- -- [Sun/Moon]fire
	-- self:newSpell({
		-- debuff = {93402,0},
		-- refreshable = true,
		-- requiredLevel = 4,
		-- requiredTree = {0,1},
	-- })
	

	-- -- Starfall
	-- self:newSpell({
		-- playerbuff = {48505, 1},
		-- cooldown = 48505,
		-- requiredLevel = 69,
		-- requiredTree = 1,
	-- })
	
	-- -- Resto bars
	
	-- -- Lifebloom
	-- self:newSpell({
		-- playerbuff = {33763,1},
		-- auraunit = usemouseover and 'mouseover' or 'target',
		-- hasted = true,
		-- refreshable = true,
		-- requiredLevel = 64,
		-- requiredTree = 4,
	-- })
	
	-- -- Rejuvenation + Swiftmend
	-- self:newSpell({
		-- playerbuff = {774,3},
		-- cooldown = 18562,
		-- auraunit = usemouseover and 'mouseover' or 'target',
		-- hasted = true,
		-- requiredTree = 4,
	-- })

	-- -- Casted Heals + Nature's Swiftness/Cenarion Ward
	-- self:newSpell({
		-- cast = {8936,5185},
		-- cooldown = {102351},
		-- playerbuff = {8936,2},
		-- auraunit = usemouseover and 'mouseover' or 'target',
		-- hasted = true,
		-- requiredTree = 4,
	-- })
	
	-- -- Wild Growth + Harmony
	-- self:newSpell({
		-- cooldown = 48438,
		-- playerbuff = 100977,
		-- requiredTree = 4,
	-- })	
    
    -- -- Incarnation
    -- self:newSpell({
        -- cooldown = {33891, 102543, 102560, 102558},
        -- playerbuff = {{33891, 0}, {102543, 0}, {102560, 0}, {102558, 0}},
        -- requiredTalent = 11,
    -- })
		
end