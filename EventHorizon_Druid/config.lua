local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.
EventHorizon.config.staticheight = nil

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 17057 -- Bear Form
	self.config.hastedSpellID = {50769,10} -- Revive

	-- All Specs
	
	-- Moonfire
	self:newSpell({
	  debuff = {164812,2},
	  refreshable = true,
	  stance = {0,1,4},
	  requiredLevel = 10,
	})

	-- Balance
	
	-- Sunfire
	self:newSpell({
	  debuff = {164815,2},
	  stance = {0,4},
	  requiredTree = 1,
	  requiredLevel = 24,
	})

	-- Stellar Flare
	self:newSpell({
	  debuff = {202347,2},
	  stance = {0,4},
	  requiredTree = 1,
	  requiredTalent = 15,
	})

	-- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
	self:newSpell({
	  playerbuff = 164547,
	  stance = {0,4},
	  requiredTree = 1,
	  requiredLevel = 10,
	})

	self:newSpell({
	  playerbuff = 164545,
	  stance = {0,4},
	  requiredTree = 1,
	  requiredLevel = 10,
	})

--	-- Starfall  -- Not really sure if this needs to be tracked as the spell area is very obvious and the buff only affects targets within it.
--	self:newSpell({
--	  debuff = 197637,
--	  refreshable = true,
--	  stance = {0,4},
--	  requiredTree = 1,
--	  requiredLevel = 40,
--	})

	-- Force of Nature
	self:newSpell({
	  cooldown = 205636,
	  stance = {0,4},
	  requiredTree = 1,
	  requiredTalent = 1,
	})

	-- Warrior of Elune
	self:newSpell({
	  cooldown = 202425,
	  playerbuff = 202425,
	  stance = {0,1,2,4},
	  requiredTree = 1,
	  requiredTalent = 2,
	})

	-- Astral Communion
	self:newSpell({
	  cooldown = 202359,
	  stance = {0,4},
	  requiredTree = 1,
	  requiredTalent = 17,
	})

	-- Celestial Alignment
	self:newSpell({
	  cooldown = 194223,
	  playerbuff = 194223,
	  stance = {0,1,2,4},
	  requiredTree = 1,
	  requiredTalentUnselected = 14,
	})

	-- Incarnation: Chosen of Elune
	self:newSpell({
	  cooldown = 102560,
	  playerbuff = 102560,
	  stance = {0,1,2,4},
	  requiredTree = 1,
	  requiredTalent = 14,
	})

	-- Fury of Elune
	self:newSpell({
	  cooldown = 202770,
	  stance = {0,4},
	  requiredTree = 1,
	  requiredTalent = 19,
	})

	-- Feral Affinity

	-- Rake
	self:newSpell({
	   debuff = {1822,3},
	   refreshable = true,
	   stance = 2,
	   requiredTree = 1,
	   requiredTalent = 7,
	})

	-- Rip 
	self:newSpell({
	  debuff = {1079,2},
	  refreshable = true,
	  stance = 2,
	  requiredTree = 1,
	  requiredTalent = 7,
	})

	-- Guardian Affinity

	-- Mangle
	self:newSpell({
	  cooldown = 33917,
	  stance = 1,
	  requiredTree = 1,
	  requiredTalent = 8,
	})

	-- Trash 
	self:newSpell({
	  debuff = {77758,3},
	  cooldown = 77758,
	  refreshable = true,
	  stance = 1,
	  requiredTree = 1,
	  requiredTalent = 8,
	})

	-- Ironfur
	self:newSpell({
	  playerbuff = 192081,
	  stance = 1,
	  requiredTree = 1,
	  requiredTalent = 8,
	})

	-- Frenzied Regeneration
	self:newSpell({
	  playerbuff = 22842,
	  stance = 1,
	  requiredTree = 1,
	  requiredTalent = 8,
	})

	-- Restoration Affinity

	-- Rejuvenation
	self:newSpell({
	  playerbuff = {774,3},
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	  hasted = true,
	  stance = 0,
	  requiredTree = 1,
	  requiredTalent = 9,
	})

	-- Regrowth
	self:newSpell({
	  playerbuff = {8936,2},
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	  cast = 8936,
	  hasted = true,
	  stance = 0,
	  requiredTree = 1,
	  requiredTalent = 9,
	})

	-- Swiftmend
	self:newSpell({
	  cooldown = 18562,
	  stance = 0,
	  requiredTree = 1,
	  requiredTalent = 9,
	})

	-- Barkskin
	self:newSpell({
	  cooldown = 22812,
	  stance = {0,1,2,3,4},
	  requiredTree = 1,
	})

	-- Feral

	-- Moonfire
	self:newSpell({
	  debuff = {164812,2},
	  refreshable = true,
	  hasted = true,
	  requiredTree = 2,
	  requiredTalent = 3,
	  stance = 2,
	})

	-- Savage Roar
	self:newSpell({
	  playerbuff = 52610,
	  stance = 2,
	  requiredTree = 2,
	  requiredTalent = 15,
	})

	-- Rake
	self:newSpell({
	   debuff = {1822,3},
	   refreshable = true,
	   stance = 2,
	   requiredTree = 2,
	   requiredLevel = 6,
	   requiredTalentUnselected = 17,
	})

	-- Rake with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	   debuff = {1822,2},
	   refreshable = true,
	   stance = 2,
	   requiredTree = 2,
	   requiredLevel = 6,
	   requiredTalent = 17,
	})

	-- Rip 
	self:newSpell({
	  debuff = {1079,2},
	  refreshable = true,
	  stance = 2,
	  requiredTree = 2,
	  requiredTalentUnselected = 17,
	})

	-- Rip with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	  debuff = {1079,1.33},
	  refreshable = true,
	  stance = 2,
	  requiredTree = 2,
	  requiredTalent = 17,
	})

	-- Trash 
	self:newSpell({
	  debuff = {106830,3},
	  refreshable = true,
	  stance = 2,
	  requiredTree = 2,
	  requiredTalentUnselected = 17,
	})

	-- Thrash with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	  debuff = {106830,2},
	  refreshable = true,
	  stance = 2,
	  requiredTree = 2,
	  requiredTalent = 17,
	})

	-- Primal Instinct, from casting Healing Touch.
	self:newSpell({
	  playerbuff = 69369,
	  requiredTree = 2,
	  requiredTalent = 20,
	  stance = 2,
	})

	-- Bloodtalons
	self:newSpell({
	  playerbuff = 155672,
	  requiredTree = 2,
	  requiredTalent = 20,
	  stance = 2,
	})

	-- Brutal Slash
	self:newSpell({
	  cooldown = 202028,
	  stance = {2},
	  requiredTree = 2,
	  requiredTalent = 19,
	})
	
	-- Tiger's Fury
	self:newSpell({
	  cooldown = 5217,
	  playerbuff = 5217,
	  stance = 2,
	  requiredTree = 2,
	  requiredLevel = 12,
	})

	-- Elune's Guidance
	self:newSpell({
	  cooldown = 202060,
	  stance = 2,
	  requiredTree = 2,
	  requiredTalent = 18,
	})

	-- Beserk
	self:newSpell({
	  cooldown = 106951,
	  playerbuff = 106951,
	  stance = 2,
	  requiredTree = 2,
	  requiredTalentUnselected = 14,
	})

	-- Incarnation
	self:newSpell({
	  cooldown = 102543,
	  playerbuff = 102543,
	  stance = 2,
	  requiredTree = 2,
	  requiredTalent = 14,
	})

	-- Moment of Clarity/Omen of Clarity
	self:newSpell({
	  playerbuff = 135700,
	  stance = 2,
	  requiredTree = 2,
	})

	-- Balance Affinity

	-- Sunfire
	self:newSpell({
	  debuff = {93402,2},
	  stance = 4,
	  requiredTree = 2,
	  requiredTalent = 7,
	})

	-- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
	self:newSpell({
	  cooldown = 197626,
	  playerbuff = 164547,
	  icon = 164547,
	  cast = 197626,
	  hasted = true,
	  stance = 4,
	  requiredTree = 2,
	  requiredTalent = 7,
	  recast = true,
	})

	self:newSpell({
	  cooldown = 197626,
	  playerbuff = 164545,
	  icon = 164545,
	  cast = 197626,
	  hasted = true,
	  stance = 4,
	  requiredTree = 2,
	  requiredTalent = 7,
	  recast = true,
	})

	-- Guardian Affinity

	-- Mangle
	self:newSpell({
	  cooldown = 33917,
	  stance = 1,
	  requiredTree = 2,
	  requiredTalent = 8,
	})

	-- Trash 
	self:newSpell({
	  cooldown = 77758,
	  debuff = {192090,3},
	  refreshable = true,
	  stance = 1,
	  requiredTree = 2,
	})

	-- Ironfur
	self:newSpell({
	  playerbuff = {192081,6},
	  stance = 1,
	  requiredTree = 2,
	  requiredTalent = 8,
	})

	-- Frenzied Regeneration
	self:newSpell({
	  playerbuff = 22842,
	  stance = 1,
	  requiredTree = 2,
	  requiredTalent = 8,
	})

	-- Restoration Affinity

	-- Rejuvenation
	self:newSpell({
	  playerbuff = {774,3},
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	  hasted = true,
	  stance = 0,
	  requiredTree = 2,
	  requiredTalent = 9,
	})

	-- Regrowth
	self:newSpell({
	  playerbuff = {8936,2},
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	  cast = 8936,
	  hasted = true,
	  stance = 0,
	  requiredTree = 2,
	  requiredTalent = 9,
	})

	-- Swiftmend
	self:newSpell({
	  cooldown = 18562,
	  stance = 0,
	  requiredTree = 2,
	  requiredTalent = 9,
	})

	-- Guardian bars

	-- Mangle
	self:newSpell({
	  unique = true,
	  refreshable = true,
	  hasted = true,
	  cooldown = 33917,
	  stance = 1,
	  requiredTree = 3,
	})

	-- Thrash
	self:newSpell({
	  debuff = {77758,3},
	  refreshable = true,
	  hasted = true,
	  cooldown = 77758,
	  stance = 1,
	  requiredTree = 3,
	})

	-- Pulverize
	self:newSpell({
	  playerbuff = 158792,
	  requiredTree = 3,
	  stance = 1,
	  requiredTalent = 21,
	})

	-- Maul
	self:newSpell({
	  cooldown = 6807,
	  requiredTree = 3,
	  stance = 1,
	})

	-- Earthwarden
	self:newSpell({
	  playerbuff = {203975,0},
	  stance = {0,1,2,3,4},
	  requiredTree = 3,
	  requiredTalent = 19,
	})

	-- Ironfur
	self:newSpell({
	  cooldown = 192081,
	  playerbuff = {192081,6},
	  requiredTree = 3,
	  stance = 1,
	})
	
	-- Mark of Ursal
	self:newSpell({
	  cooldown = 192083,
	  playerbuff = 192083,
	  requiredTree = 3,
	  stance = 1,
	})

	-- Frenzied Regen
	self:newSpell({
	  cooldown = 22842,
	  playerbuff = 22842,
	  requiredTree = 3,
	  stance = 1,
	})

	-- Balance Affinity

	-- Sunfire
	self:newSpell({
	  debuff = 93402,
	  stance = 4,
	  requiredTree = 3,
	  requiredTalent = 7,
	})

	-- Starsurge
	self:newSpell({
	  cooldown = 197626,
	  playerbuff = 164547,
	  cast = 197626,
	  hasted = true,
	  stance = 4,
	  requiredTree = 3,
	  requiredTalent = 7,
	  recast = true,
	})

	self:newSpell({
	  cooldown = 197626,
	  playerbuff = 164545,
	  cast = 197626,
	  hasted = true,
	  stance = 4,
	  requiredTree = 3,
	  requiredTalent = 7,
	  recast = true,
	})

	-- Feral Affinity

	-- Rake
	self:newSpell({
	   debuff = {1822,3},
	   refreshable = true,
	   stance = 2,
	   requiredTree = 3,
	   requiredTalent = 8,
	})

	-- Rip 
	self:newSpell({
	  debuff = {1079,2},
	  refreshable = true,
	  stance = 2,
	  requiredTree = 3,
	  requiredTalent = 8,
	})

	-- Restoration Affinity

	-- Rejuvenation
	self:newSpell({
	  playerbuff = {774,3},
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	  hasted = true,
	  stance = 0,
	  requiredTree = 3,
	  requiredTalent = 9,
	})

	-- Regrowth
	self:newSpell({
	  playerbuff = {8936,2},
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	  hasted = true,
	  cast = 8936,
	  stance = 0,
	  requiredTree = 3,
	  requiredTalent = 9,
	})

	-- Swiftmend
	self:newSpell({
	  cooldown = 18562,
	  stance = 0,
	  requiredTree = 3,
	  requiredTalent = 9,
	})

	-- Lunar Beam
	self:newSpell({
	  cooldown = 204066,
	  playerbuff = 204066,
	  stance = {0,1,2,3,4},
	  requiredTree = 3,
	  requiredTalent = 20,
	})

	-- Barkskin
	self:newSpell({
	  cooldown = 22812,
	  playerbuff = 22812,
	  requiredTree = 3,
	  stance = {0,1,2,3,4},
	})

	-- Survival Instincts
	self:newSpell({
	  cooldown = 61336,
	  playerbuff = 61336,
	  requiredTree = 3,
	  stance = {0,1,2,3,4},
	})

	-- Incarnation: Guardian of Ursoc
	self:newSpell({
	  cooldown = 102558,
	  playerbuff = 102558,
	  requiredTree = 3,
	  stance = {0,1,2,3,4},
	  requiredTalent = 14,
	})


	-- Resto bars

	-- Lifebloom
	self:newSpell({
	  playerbuff = {33763,1},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  hasted = true,
	  refreshable = true,
	  requiredLevel = 32,
	  requiredTree = 4,
	  stance = 0,
	})

	-- Rejuvenation
	self:newSpell({
	  playerbuff = {774,3},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  hasted = true,
	  refreshable = true,
	  requiredTree = 4,
	  stance = 0,
	})

	-- Regroth
	self:newSpell({
	  playerbuff = {8936,2},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  hasted = true,
	  refreshable = true,
	  requiredTree = 4,
	  stance = 0,
	})

	-- Swiftmend
	self:newSpell({
	  cooldown = 18562,
	  requiredTree = 4,
	  stance = 0,
	})

	-- Cenarion Ward
	self:newSpell({
	  playerbuff = {102352,2},
	  cooldown = 102351,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  hasted = true,
	  requiredTree = 4,
	  stance = {0,1,2,3,4},
	  requiredTalent = 2,
	})

	-- Wild Growth
	self:newSpell({
	  cooldown = 48438,
	  requiredTree = 4,
	  stance = 0,
	})

	-- Innervate
	-- Put "--" at the start of the stance line below to show this bar in both balance and resto or just resto.
	self:newSpell({
	  cooldown = 29166,
	  requiredTree = {1,4},
	  stance = {0,4}, -- Balance and Resto (default).
--	  stance = 0, -- Just Resto.
	})

end
