local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 17057 -- Bear Form
	self.config.hastedSpellID = {50769,10} -- Revive


	-- Balance
	
	-- Moonfire
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,1,2,4},
	  requiredLevel = 10,
	  debuff = {164812,2},
	  refreshable = true,
	})

	-- Sunfire
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredLevel = 24,
	  debuff = {164815,2},
	})

	-- Stellar Flare
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredTalent = 15,
	  debuff = {202347,2},
	})

	-- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredLevel = 10,
	  playerbuff = 164547,
	  cast = 194153,
	})

	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredLevel = 10,
	  playerbuff = 164545,
	  cast = 190984,
	})

--	-- Starfall  -- Not really sure if this needs to be tracked as the spell area is very obvious and the buff only affects targets within it.
--	self:newSpell({
--	  requiredTree = 1,
--	  stance = {0,4},
--	  requiredLevel = 40,
--	  debuff = 197637,
--	  refreshable = true,
--	})

	-- Force of Nature
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredTalent = 1,
	  cooldown = 205636,
	})

	-- Warrior of Elune
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,1,2,4},
	  requiredTalent = 2,
	  cooldown = 202425,
	  playerbuff = 202425,
	})

	-- Astral Communion
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredTalent = 17,
	  cooldown = 202359,
	})

	-- Celestial Alignment
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,1,2,4},
	  requiredLevel = 64,
	  requiredTalentUnselected = 14,
	  cooldown = 194223,
	  playerbuff = 194223,
	})

	-- Incarnation: Chosen of Elune
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,1,2,4},
	  requiredTalent = 14,
	  cooldown = 102560,
	  playerbuff = 102560,
	})

	-- Fury of Elune
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredTalent = 19,
	  cooldown = 202770,
	})

	-- Feral Affinity

	-- Rake
	self:newSpell({
	   requiredTree = 1,
	   stance = 2,
	   requiredTalent = 7,
	   debuff = {1822,3},
	   refreshable = true,
	})

	-- Rip 
	self:newSpell({
	  requiredTree = 1,
	  stance = 2,
	  requiredTalent = 7,
	  debuff = {1079,2},
	  refreshable = true,
	})

	-- Guardian Affinity

	-- Mangle
	self:newSpell({
	  requiredTree = 1,
	  stance = 1,
	  requiredTalent = 8,
	  cooldown = 33917,
	})

	-- Trash 
	self:newSpell({
	  requiredTree = 1,
	  stance = 1,
	  requiredTalent = 8,
	  debuff = {77758,3},
	  cooldown = 77758,
	  refreshable = true,
	})

	-- Ironfur
	self:newSpell({
	  requiredTree = 1,
	  stance = 1,
	  requiredTalent = 8,
	  playerbuff = 192081,
	})

	-- Frenzied Regeneration
	self:newSpell({
	  requiredTree = 1,
	  stance = 1,
	  requiredTalent = 8,
	  playerbuff = 22842,
	})

	-- Restoration Affinity

	-- Rejuvenation + Swiftmend CD
	self:newSpell({
	  requiredTree = 1,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {774,3},
	  cooldown = 18562,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  hasted = true,
	})

--	-- Regrowth
	self:newSpell({
	  requiredTree = 1,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {8936,2},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  cast = 8936,
	  hasted = true,
	  recast = true,
	})

--	-- Barkskin - uncomment this section if you want it viewable on your Balance bars.
--	self:newSpell({
--	  requiredTree = 1,
--	  stance = {0,1,2,3,4},
--	  requiredLevel = 36,
--	  cooldown = 22812,
--	})

	-- Feral

	-- Moonfire
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 3,
	  debuff = {164812,2},
	  refreshable = true,
	  hasted = true,
	})

	-- Savage Roar
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 15,
	  playerbuff = 52610,
	})

	-- Rake
	self:newSpell({
	   requiredTree = 2,
	   stance = 2,
	   requiredLevel = 6,
	   requiredTalentUnselected = 17,
	   debuff = {1822,3},
	   refreshable = true,
	})

	-- Rake with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	   requiredTree = 2,
	   stance = 2,
	   requiredLevel = 6,
	   requiredTalent = 17,
	   debuff = {1822,2},
	   refreshable = true,
	})

	-- Rip 
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 20,
	  requiredTalentUnselected = 17,
	  debuff = {1079,2},
	  refreshable = true,
	})

	-- Rip with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 17,
	  debuff = {1079,1.33},
	  refreshable = true,
	})

	-- Tiger's Fury
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 12,
	  cooldown = 5217,
	  playerbuff = 5217,
	})

	-- Predatory Swiftness, from casting Healing Touch.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 20,
	  playerbuff = 69369,
	})

	-- Bloodtalons
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 20,
	  playerbuff = 155672,
	})

	-- Brutal Slash
	self:newSpell({
	  requiredTree = 2,
	  stance = {2},
	  requiredTalent = 19,
	  cooldown = 202028,
	})

	-- Trash 
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 18,
	  requiredTalentUnselected = 17,
	  debuff = {106830,3},
	  refreshable = true,
	})

	-- Thrash with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 17,
	  debuff = {106830,2},
	  refreshable = true,
	})

	-- Elune's Guidance
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 18,
	  cooldown = 202060,
	})

	-- Beserk
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 48,
	  requiredTalentUnselected = 14,
	  cooldown = 106951,
	  playerbuff = 106951,
	})

	-- Incarnation
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 14,
	  cooldown = 102543,
	  playerbuff = 102543,
	})

	-- Moment of Clarity/Omen of Clarity
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 38,
	  playerbuff = 135700,
	})

	-- Balance Affinity

	-- Moonfire
	self:newSpell({
	  requiredTree = 2,
	  stance = 4,
	  requiredLevel = 10,
	  debuff = {164812,2},
	  refreshable = true,
	})

	-- Sunfire
	self:newSpell({
	  requiredTree = 2,
	  stance = 4,
	  requiredTalent = 7,
	  debuff = {93402,2},
	})

	-- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
	self:newSpell({
	  requiredTree = 2,
	  stance = 4,
	  requiredTalent = 7,
	  cooldown = 197626,
	  playerbuff = 164547,
	  icon = 164547,
	  cast = 197626,
	  hasted = true,
	  recast = true,
	})

	self:newSpell({
	  requiredTree = 2,
	  stance = 4,
	  requiredTalent = 7,
	  cooldown = 197626,
	  playerbuff = 164545,
	  icon = 164545,
	  cast = 197626,
	  hasted = true,
	  recast = true,
	})

	-- Guardian Affinity

	-- Mangle
	self:newSpell({
	  requiredTree = 2,
	  stance = 1,
	  requiredTalent = 8,
	  cooldown = 33917,
	})

	-- Trash 
	self:newSpell({
	  requiredTree = 2,
	  stance = 1,
	  requiredLevel = 18,
	  cooldown = 77758,
	  debuff = {192090,3},
	  refreshable = true,
	})

	-- Ironfur
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 8,
	  stance = 1,
	  playerbuff = {192081,6},
	})

	-- Frenzied Regeneration
	self:newSpell({
	  requiredTree = 2,
	  stance = 1,
	  requiredTalent = 8,
	  playerbuff = 22842,
	})

	-- Restoration Affinity

	-- Rejuvenation + Swiftmend CD
	self:newSpell({
	  requiredTree = 2,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {774,3},
	  cooldown = 18562,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  hasted = true,
	})

	-- Regrowth
	self:newSpell({
	  requiredTree = 2,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {8936,2},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  cast = 8936,
	  hasted = true,
	  recast = true,
	})

	-- Guardian bars

	-- Mangle
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 10,
	  cooldown = 33917,
	})

	-- Thrash
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 10,
	  debuff = {77758,3},
	  cooldown = 77758,
	  refreshable = true,
	  hasted = true,
	})

	-- Pulverize
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredTalent = 21,
	  playerbuff = 158792,
	})

	-- Maul
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 10,
	  cooldown = 6807,
	})

	-- Earthwarden
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredTalent = 16,
	  playerbuff = {203975,0},
	})

	-- Ironfur
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 44,
	  cooldown = 192081,
	  playerbuff = {192081,6},
	})
	
	-- Mark of Ursal
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 72,
	  cooldown = 192083,
	  playerbuff = 192083,
	})

	-- Frenzied Regen
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiresLevel = 50,
	  cooldown = 22842,
	  playerbuff = 22842,
	})

	-- Balance Affinity

	-- Sunfire
	self:newSpell({
	  requiredTree = 3,
	  stance = 4,
	  requiredTalent = 7,
	  debuff = 93402,
	})

	-- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
	self:newSpell({
	  requiredTree = 3,
	  stance = 4,
	  requiredTalent = 7,
	  cooldown = 197626,
	  playerbuff = 164547,
	  cast = 197626,
	  recast = true,
	})

	self:newSpell({
	  requiredTree = 3,
	  stance = 4,
	  requiredTalent = 7,
	  cooldown = 197626,
	  playerbuff = 164545,
	  cast = 197626,
	  recast = true,
	})

	-- Feral Affinity

	-- Rake
	self:newSpell({
	   requiredTree = 3,
	   stance = 2,
	   requiredTalent = 8,
	   debuff = {1822,3},
	   refreshable = true,
	})

	-- Rip 
	self:newSpell({
	  requiredTree = 3,
	  stance = 2,
	  requiredTalent = 8,
	  debuff = {1079,2},
	  refreshable = true,
	})

	-- Restoration Affinity

	-- Rejuvenation + Swiftmend CD
	self:newSpell({
	  requiredTree = 3,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {774,3},
	  cooldown = 18562,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  hasted = true,
	})

	-- Regrowth
	self:newSpell({
	  requiredTree = 3,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {8936,2},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 8936,
	  refreshable = true,
	  hasted = true,
	  recast = true,
	})

	-- Lunar Beam
	self:newSpell({
	  requiredTree = 3,
	  stance = {0,1,2,3,4},
	  requiredTalent = 20,
	  cooldown = 204066,
	  playerbuff = 204066,
	})

	-- Barkskin
	self:newSpell({
	  requiredTree = 3,
	  stance = {0,1,2,3,4},
	  cooldown = 22812,
	  playerbuff = 22812,
	})

	-- Survival Instincts
	self:newSpell({
	  requiredTree = 3,
	  stance = {0,1,2,3,4},
	  cooldown = 61336,
	  playerbuff = 61336,
	})

	-- Incarnation: Guardian of Ursoc
	self:newSpell({
	  requiredTree = 3,
	  stance = {0,1,2,3,4},
	  requiredTalent = 14,
	  cooldown = 102558,
	  playerbuff = 102558,
	})


	-- Resto bars

	-- Lifebloom + Wild Growth CD
	self:newSpell({
	  requiredTree = 4,
	  stance = 0,
	  requiredLevel = 32,
	  playerbuff = {33763,1},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cooldown = 48438,
	  hasted = true,
	  cast = 48438,
	  refreshable = true,
	  icon = 33763,
	})

	-- Rejuvenation
	self:newSpell({
	  requiredTree = 4,
	  stance = 0,
	  requiredLevel = 10,
	  playerbuff = {{774,3},{155777,3}},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  hasted = true,
	  refreshable = true,
	})

	-- Regrowth + Swiftmend
	self:newSpell({
	  requiredTree = 4,
	  stance = 0,
	  requiredLevel = 10,
	  cooldown = 18562,
	  playerbuff = {8936,2},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 8936,
	  hasted = true,
	  refreshable = true,
	  recast = true,
	})

	-- Omen of Clarity / Moment of Clarity
	self:newSpell({
	  requiredTree = 4,
	  stance = 0,
	  requiredLevel = 12,
	  playerbuff = 16870,
	})

	-- Cenarion Ward
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,1,2,3,4},
	  requiredTalent = 2,
	  playerbuff = {102351,102352,2},
	  cooldown = 102351,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  hasted = true,
	})

--	-- Efflorescence - no way of tracking this yet.
--	self:newSpell({
--	  requiredTree = 4,
--	  stance = 0,
--	  requiredLevel = 83,
--	  debuff = {145205,2},
--	  hasted = true,
--	})

	-- Ironbark
	self:newSpell({
	  requiredTree = 4,
	  stance = 0,
	  requiredLevel = 52,
	  playerbuff = 102342,
	  cooldown = 102342,
	})

	-- Balance Affinity

	-- Moonfire
	self:newSpell({
	  requiredTree = 4,
	  stance = {1,4},
	  requiredLevel = 10,
	  debuff = {164812,2},
	  refreshable = true,
	})

	-- Sunfire
	self:newSpell({
	  requiredTree = 4,
	  stance = 4,
	  requiredTalent = 7,
	  debuff = {93402,2},
	})

	-- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
	self:newSpell({
	  requiredTree = 4,
	  stance = 4,
	  requiredTalent = 7,
	  cooldown = 197626,
	  playerbuff = 164547,
	  icon = 164547,
	  cast = 197626,
	  recast = true,
	})

	self:newSpell({
	  requiredTree = 4,
	  stance = 4,
	  requiredTalent = 7,
	  cooldown = 197626,
	  playerbuff = 164545,
	  icon = 164545,
	  cast = 197626,
	  recast = true,
	})

	-- Feral Affinity

	-- Rake
	self:newSpell({
	   requiredTree = 4,
	   stance = 2,
	   requiredTalent = 8,
	   debuff = {1822,3},
	   refreshable = true,
	})

	-- Rip 
	self:newSpell({
	  requiredTree = 4,
	  stance = 2,
	  requiredTalent = 8,
	  debuff = {1079,2},
	  refreshable = true,
	})

	-- Guardian Affinity

	-- Mangle
	self:newSpell({
	  requiredTree = 4,
	  stance = 1,
	  requiredTalent = 9,
	  cooldown = 33917,
	})

	-- Trash 
	self:newSpell({
	  requiredTree = 4,
	  stance = 1,
	  requiredTalent = 9,
	  debuff = {77758,3},
	  cooldown = 77758,
	  refreshable = true,
	})

	-- Ironfur
	self:newSpell({
	  requiredTree = 4,
	  stance = 1,
	  requiredTalent = 9,
	  playerbuff = 192081,
	})

	-- Frenzied Regeneration
	self:newSpell({
	  requiredTree = 4,
	  stance = 1,
	  requiredTalent = 9,
	  playerbuff = 22842,
	})

	-- Tranquility
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,1,2,4},
	  requiredLevel = 72,
	  channel = {740,2},
	  cooldown = 740,
	})

	-- Incarnation: Tree of Life
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,1,2,4},
	  requiredTalent = 14,
	  cooldown = 33891,
	  playerbuff = 117679,
	})

	-- Innervate
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,1,2,4},
	  requiredLevel = 50,
	  cooldown = 29166,
	})

end
