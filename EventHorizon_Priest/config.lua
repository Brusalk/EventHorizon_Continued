local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 33076 -- Shadow Word: Pain
	self.config.hastedSpellID = {2006,10} -- Resurrection

	-- -- Holy/Disc
	-- -- Evangelism/Archangel now disc only
	-- self:newSpell({
		-- playerbuff = 81662,
		-- cooldown = 81700,
		-- refreshable = true,
		-- requiredTree = 1,
		-- requiredLevel = 50,
	-- })

	-- -- Renew/PoM CD
	-- self:newSpell({
		-- playerbuff = 139,
		-- auraunit = usemouseover and 'mouseover' or 'target',
		-- cooldown = 33076,
		-- refreshable = true,
		-- hasted = true,
		-- requiredLevel = 26,
		-- stance = 0, -- keep it from being shown in shadowform
	-- })

	-- -- Casts + Serendipity / Borrowed Time
	-- self:newSpell({
		-- cast = {32546,2061,2060,14914,724,32375,129250,596,585,88685,121135,120517,33076, 155245},
		-- playerbuff = {{63731,0},{59887,0}},
		-- stance = 0,-- keep it from being shown in shadowform
	-- })

	-- -- Discipline
        -- -- Penance + Grace
        -- self:newSpell({
            -- playerbuff = 47930,
            -- channeled = 47540,
            -- numhits = 0,
            -- cooldown = 47540,
            -- refreshable = true,
            -- auraunit = usemouseover and 'mouseover' or 'target',
            -- requiredTree = 1,
        -- })

        -- -- Weakened Soul/inner focus
        -- self:newSpell({
            -- debuff = 6788,
            -- cooldown = 89485,
            -- auraunit = usemouseover and 'mouseover' or 'target',
            -- requiredTree = 1,
        -- })
	-- -- Holy
    
        -- -- Holy Word: Chastise + Chakra effects
        -- self:newSpell({
            -- playerbuff = {{88682,0},{88684,0}},
            -- auraunit = usemouseover and 'mouseover' or 'target',
            -- cooldown = 88684,
            -- requiredTree = 2,
        -- })

        -- -- Circle of Healing
        -- self:newSpell({
            -- playerbuff = 88689,
            -- cooldown = 34861,
            -- requiredTree = 2,
            -- requiredLevel = 59,
        -- })

        -- -- Chakra
        -- self:newSpell({
            -- playerbuff = {{81207,0},{81209,0},{81206,0},{81208,0}},
            -- cooldown = 81206,
            -- requiredTree = 2,
            -- requiredLevel = 49,
        -- })


	-- -- Shadow
        -- -- Vampiric Touch/swd cd
        -- self:newSpell({
            -- debuff = {34914,3},
            -- cast = 34914,
            -- cooldown = 32379,
            -- refreshable = true,
            -- hasted = true,
            -- recast = true,
            -- requiredTree = 3,
            -- requiredLevel = 28,
        -- })

        -- -- Shadow Word: Pain/mind bender cd
        -- self:newSpell({
            -- debuff = {589,3},
            -- hasted = true,
            -- cooldown = {123040, 34433},
            -- refreshable = true,
            -- requiredTree = 3,
            -- requiredLevel = 4,
        -- })

        -- -- Mind Blast/Spike/Melt
        -- self:newSpell({
            -- cast = {8092,73510},
            -- cooldown = 8092,
            -- playerbuff = 81292,
            -- refreshable = true,
            -- requiredTree = 3,
        -- })

        -- -- Mind Flay/Devouring Plague (by request)
        -- self:newSpell({
            -- channel = {15407,3},
            -- debuff = {2944,1},
            -- requiredTree = 3,
        -- })

	-- --lvl 90 talents
        -- -- Halo
        -- self:newSpell({
            -- cooldown = 120517,
            -- requiredLevel = 90,
            -- requiredTalent = 18,
            -- requiredTree = {1,2},
        -- })
        -- self:newSpell({
            -- cooldown = 120644,
            -- requiredLevel = 90,
            -- requiredTalent = 18,
            -- requiredTree = 3,
        -- })

        -- -- Divine Star
        -- self:newSpell({
            -- cooldown = 110744,
            -- requiredLevel = 90,
            -- requiredTalent = 17,
            -- requiredTree = {1,2}
        -- })
        -- self:newSpell({
            -- cooldown = 122121,
            -- requiredLevel = 90,
            -- requiredTalent = 17,
            -- requiredTree = 3,
        -- })

        -- -- Cascade
        -- self:newSpell({
            -- cooldown = 121135,
            -- requiredLevel = 90,
            -- requiredTalent = 16,
            -- requiredTree = {1,2},
        -- })
        -- self:newSpell({
            -- cooldown = 127632,
            -- requiredLevel = 90,
            -- requiredTalent = 16,
            -- requiredTree = 3,
        -- })

    -- -- Level 100 talents
        -- -- Saving Grace
        -- self:newSpell({
            -- cast = 152116,
            -- debuff = 155274,
            -- auraunit = "PLAYER",
            -- requiredTalent = 21,
            -- requiredTree = {1, 2},
        -- })
        
        -- -- Void Entropy
        -- self:newSpell({
            -- cast = 155361,
            -- debuff = {155361, 3},
            -- requiredTalent = 20,
            -- requiredTree = 3,
        -- })
end