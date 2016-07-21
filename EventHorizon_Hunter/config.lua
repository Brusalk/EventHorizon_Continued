function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 3044

	-- -- Steady/Cobra/Focusing
	-- self:newSpell({
		-- cast = {56641,77767,152245},
		-- recast = true,
	-- })


-- --BEAST MASTERY

	-- -- Kill Command
	-- self:newSpell({
		-- cooldown = 34026,
		-- requiredTree = 1,
	-- })

	-- -- Frenzy + Focus Fire (FF buff has the same duration as CD, no real reason to track it)
	-- self:newSpell({
		-- playerbuff = 19615,
		-- cooldown = 82692,
		-- auraunit = 'pet',
		-- unique = true,
		-- refreshable = true,
		-- --minstacks = 5,
		-- requiredTree = 1,
	-- })

	-- -- Bestial Wrath
	-- self:newSpell({
		-- playerbuff = 34471,
		-- cooldown = 19574,
		-- requiredTree = 1,
		-- requiredLevel = 40,
	-- })


-- --MARKSMANSHIP

	-- -- Chimaera Shot
	-- self:newSpell({
		-- cooldown = 53209,
		-- requiredTree = 2,
		-- requiredLevel = 60,
	-- })

	-- -- Aimed shot
	-- self:newSpell({
		-- cast = 19434,
		-- requiredTree = 2,
	-- })

	-- -- Rapid Fire  
	-- self:newSpell({
		-- cooldown = 3045,
		-- requiredLevel = 54,
		-- requiredTree = 2,
	-- })


-- --SURVIVAL

	-- -- Serpent Sting
	-- self:newSpell({
		-- debuff = {118253,3},
		-- refreshable = true,
		-- requiredTree = 3,
	-- })

	-- -- Black Arrow
	-- self:newSpell({
		-- debuff = {3674,3},
		-- cooldown = 3674,
		-- requiredTree = 3,
		-- requiredLevel = 50,
	-- })

    -- -- Lock and Load
    -- self:newSpell({
        -- playerbuff = 168980,
        -- requiredTree = 3
    -- })
	-- -- Explosive Shot
	-- self:newSpell({
		-- debuff = {53301,1},
		-- cooldown = 53301,
		-- requiredTree = 3,
	-- })


-- --TALENTS
-- -- Level 60 Talents

	-- -- Steady Focus
	-- self:newSpell({
		-- playerbuff = 177667,
		-- requiredLevel = 60,
		-- requiredTalent = 10,
	-- })

	-- --Dire Beast
	-- self:newSpell({
		-- cooldown = 120679,
        -- playerbuff = 120679,
		-- requiredLevel = 60,
		-- requiredTalent = 11,
	-- })

	-- --Thrill of the Hunt
	-- self:newSpell({
		-- playerbuff = 109306,
		-- requiredLevel = 60,
		-- requiredTalent = 12,
	-- })

-- -- Level 75 Talents

	-- -- A Murder of Crows
	-- self:newSpell({
		-- debuff = {131894,0},
		-- cooldown = 131894,
		-- requiredTalent = 13,
	-- })

	-- -- Stampede
	-- self:newSpell({
		-- cooldown = 121818,
		-- requiredTalent = 15
	-- })

-- -- Level 90 Talents

	-- -- Glaive Toss
	-- self:newSpell({
		-- cooldown = 117050,
		-- debuff = {117050,0},
		-- requiredTalent = 16,
	-- })

	-- -- Powershot
	-- self:newSpell({
		-- cooldown = 109259,
		-- cast = 109259,
		-- requiredTalent = 17,
	-- })

	-- -- Barrage
	-- self:newSpell({
		-- cooldown = 120360,
		-- channel = 120360,
		-- requiredTalent = 18,
	-- })

end