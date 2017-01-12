local usemouseover = true	-- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 768 -- Cat Form
	self.config.hastedSpellID = {50769,10} -- Revive

	-- Balance bars

	-- Scythe of Elune spell
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredArtifactTalent = 202767,
	  recharge = 202767,
	  cast = {202767, 202768, 202771},
	})

	-- Moonfire with Force of Nature or Warrior of Elune cooldown at half height.
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,1,2,4},
	  requiredLevel = 10,
	  debuff = {164812,2},
	  refreshable = true,
	  cooldown = {205636, 202425},
	  smallCooldown = true,
	})

	-- Sunfire
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredLevel = 24,
	  debuff = {164815,2},
	  refreshable = true,
	})

	-- Stellar Flare
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredTalent = 15,
	  debuff = {202347,2},
	  refreshable = true,
	})

	-- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredLevel = 10,
	  playerbuff = 164547,
	  cast = 194153,
	  cooldown = 202359,
	  smallCooldown = true,
	})

	self:newSpell({
	  requiredTree = 1,
	  stance = {0,4},
	  requiredLevel = 10,
	  playerbuff = 164545,
	  cast = 190984,
	  cooldown = 202770,
	  smallCooldown = true,
	})

--	-- Starfall  -- Not really sure if this needs to be tracked as the spell area is very obvious and the buff only affects targets within it.
--	self:newSpell({
--	  requiredTree = 1,
--	  stance = {0,4},
--	  requiredLevel = 40,
--	  debuff = 197637,
--	  refreshable = true,
--	})

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

	-- Thrash 
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
	  recharge = 22842,
	  playerbuff = 22842,
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

	-- Restoration Affinity

	-- Rejuvenation
	self:newSpell({
	  requiredTree = 1,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {774,3},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	})

--	-- Regrowth + Swiftmend CD
	self:newSpell({
	  requiredTree = 1,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {8936,2},
	  cooldown = 18562,
	  smallCooldown = true,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  cast = 8936,
	  recast = true,
	})

	-- Barkskin
	-- Delete the next line and the seventh line, after it, if you'd like to have Barskin displayed in Balance spec.
--[[
	self:newSpell({
	  requiredTree = 1,
	  stance = {0,1,2,3,4},
	  requiredLevel = 36,
	  cooldown = 22812,
	})
]]--

	-- Feral bars

	-- Moonfire in bear as it always has access to it.
	self:newSpell({
	  requiredTree = 2,
	  stance = 1,
	  debuff = {164812,2},
	  refreshable = true,
	})

	-- Savage Roar
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 15,
	  playerbuff = 52610,
	})

	-- Rake with Ashamane's Frenzy CD at half height once you get it.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 8,
	  requiredTalentUnselected = 17,
	  debuff = {1822,3},
	  refreshable = true,
	  cooldown = 210722,
	  smallCooldown = true,
	})

	-- Rake with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 8,
	  requiredTalent = 17,
	  debuff = {1822,2},
	  refreshable = true,
	  cooldown = 210722,
	  smallCooldown = true,
	})

	-- Moonfire in cat form with talent.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 3,
	  debuff = {164812,2},
	  refreshable = true,
	})

	-- Rip with tier two talent cooldowns at half height.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 20,
	  requiredTalentUnselected = 17,
	  debuff = {1079,2},
	  refreshable = true,
	  cooldown = {108238, 102280, 102401},
	  smallCooldown = true,
	})

	-- Rip with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 17,
	  debuff = {1079,1.33},
	  refreshable = true,
	  cooldown = {108238, 102280, 102401},
	  smallCooldown = true,
	})

	-- Tiger's Fury
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 12,
	  cooldown = 5217,
	  playerbuff = 5217,
	})

	-- Bloodtalons & Predatory Swiftness, triggered by Regrowth.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 20,
	  playerbuff = {{69369},{155672}},
	})

	-- Thrash with Brutal Slash.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 18,
	  requiredTalentUnselected = 17,
	  debuff = {106830,3},
	  refreshable = true,
	  recharge = 202028,
	})

	-- Thrash with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 17,
	  debuff = {106830,2},
	  refreshable = true,
	  recharge = 202028,
	})

	-- Elune's Guidance
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredTalent = 18,
	  cooldown = 202060,
	})

	-- Berserk
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
	  playerbuff = 106951,
	})

	-- Omen of Clarity / Moment of Clarity
	-- Delete the next line and the seventh line, after it, if you'd like OoC/MoC tracking.
--[[
	self:newSpell({
	  requiredTree = 2,
	  stance = 2,
	  requiredLevel = 38,
	  playerbuff = 135700,
	})
]]--

	-- Balance Affinity

	-- Moonfire
	self:newSpell({
	  requiredTree = 2,
	  stance = 4,
	  requiredTalent = 7,
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

	-- Thrash 
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
	  recharge = 22842,
	  playerbuff = 22842,
	})

	-- Restoration Affinity

	-- Rejuvenation
	self:newSpell({
	  requiredTree = 2,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {774,3},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	})

	-- Regrowth + Swiftmend CD
	self:newSpell({
	  requiredTree = 2,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {8936,2},
	  cooldown = 18562,
	  smallCooldown = true,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  cast = 8936,
	  recast = true,
	})

	-- Guardian bars

	-- Mangle
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 10,
	  cooldown = 33917,
	  playerbuff = {{93622}, {213708}},
	})

	-- Thrash
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 10,
	  debuff = {77758,3},
	  cooldown = 77758,
	  refreshable = true,
	})

	-- Pulverize
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredTalent = 21,
	  playerbuff = 158792,
	})

	-- Moonfire with tier two talent cooldowns at half height.
	self:newSpell({
	  requiredTree = 3,
	  stance = {0,1,3,4,5,6},
	  requiredLevel = 10,
	  debuff = {164812,2},
	  refreshable = true,
	  cooldown = {102280, 102401},
	  smallCooldown = true,
	})

	-- Earthwarden
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredTalent = 16,
	  playerbuff = 203975,
	})

	-- Three separate lines for this bar so the starting icon reminds you which CD it is tracking, as soon as you use a mitigation ability it will update.
	-- Ironfur & Mark of Ursol with Mighty Bash cooldown at half height.
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 44,
	  requiredTalent = 10,
	  playerbuff = {{192081}, {192083}},
	  cooldown = 5211,
	  smallCooldown = true,
	})

	-- Ironfur & Mark of Ursol with Mass Entanglement cooldown at half height.
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 44,
	  requiredTalent = 11,
	  playerbuff = {{192081}, {192083}},
	  cooldown = 102359,
	  smallCooldown = true,
	})

	-- Ironfur & Mark of Ursol with Typhoon cooldown at half height.
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiredLevel = 44,
	  requiredTalent = 12,
	  playerbuff = {{192081}, {192083}},
	  cooldown = 132469,
	  smallCooldown = true,
	})

	-- Frenzied Regeneration
	self:newSpell({
	  requiredTree = 3,
	  stance = 1,
	  requiresLevel = 50,
	  recharge = 22842,
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
	  icon = 194153,
	})

	self:newSpell({
	  requiredTree = 3,
	  stance = 4,
	  requiredTalent = 7,
	  cooldown = 197626,
	  playerbuff = 164545,
	  cast = 197626,
	  recast = true,
	  icon = 190984,
	})

	-- Feral Affinity

	-- Rake
	self:newSpell({
	  requiredTree = 3,
	  stance = 2,
	  requiredTalent = 8,
	  debuff = {1822,3},
	  refreshable = true,
	  cooldown = {102280, 102401},
	  smallCooldown = true,
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

	-- Rejuvenation
	self:newSpell({
	  requiredTree = 3,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {774,3},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	})

	-- Regrowth + Swiftmend CD
	self:newSpell({
	  requiredTree = 3,
	  stance = 0,
	  requiredTalent = 9,
	  playerbuff = {8936,2},
	  cooldown = 18562,
	  smallCooldown = true,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 8936,
	  refreshable = true,
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

	-- Rage of the Sleeper
	self:newSpell({
	  requiredTree = 3,
	  requiredArtifactTalent = 200851,
	  stance = 1,
	  cooldown = 200851,
	  playerbuff = 200851,
	})

	-- Survival Instincts
	self:newSpell({
	  requiredTree = 3,
	  stance = {0,1,2,3,4},
	  recharge = 61336,
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

	-- Restoration bars
	--Note that there are two, or more, entries for the same spell for many of these bars, this is to have them show up in the correct stances with or without Balance Affinity taken.
	--I'm sure there will be a few players out there who prefer to be a treant, all this effort was for you.

	-- Lifebloom + Wild Growth CD
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalentUnselected = 7,
	  requiredLevel = 32,
	  playerbuff = {33763,1},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 48438,
	  refreshable = true,
	  icon = 33763,
	  cooldown = 48438,
	  smallCooldown = true,
	})

	-- Lifebloom + Wild Growth CD
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = 7,
	  playerbuff = {33763,1},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 48438,
	  refreshable = true,
	  icon = 33763,
	  cooldown = 48438,
	  smallCooldown = true,
	})

	-- Rejuvenation
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalentUnselected = 7,
	  requiredLevel = 10,
	  playerbuff = {774,3},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  cooldown = 29166,
	  smallCooldown = true,
	})

	-- Rejuvenation
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = 7,
	  playerbuff = {774,3},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  cooldown = 29166,
	  smallCooldown = true,
	})

	-- Germination
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalentUnselected = 7,
	  requiredTalent = 18,
	  playerbuff = {155777,3},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	})

	-- Germination
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = {7,18},
	  requiredLevel = 10,
	  playerbuff = {155777,3},
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	})

	-- Regrowth + Swiftmend
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalent = 2,
	  requiredTalentUnselected = 7,
	  requiredLevel = 10,
	  playerbuff = {8936,2},
	  cooldown = 18562,
	  smallCooldown = true,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 8936,
	  refreshable = true,
	  recast = true,
	})

	-- Regrowth + Swiftmend
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalent = 3,
	  requiredTalentUnselected = 7,
	  requiredLevel = 10,
	  playerbuff = {8936,2},
	  cooldown = 18562,
	  smallCooldown = true,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 8936,
	  refreshable = true,
	  recast = true,
	})

	-- Regrowth + Swiftmend
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalent = 1,
	  requiredTalentUnselected = 7,
	  requiredLevel = 10,
	  playerbuff = {8936,2},
	  recharge = 18562,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 8936,
	  refreshable = true,
	  recast = true,
	})

	-- Regrowth + Swiftmend
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = 7,
	  requiredTalentUnselected = 1,
	  playerbuff = {8936,2},
	  cooldown = 18562,
	  smallCooldown = true,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 8936,
	  refreshable = true,
	  recast = true,
	})

	-- Regrowth + Swiftmend
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = {1,7},
	  playerbuff = {8936,2},
	  recharge = 18562,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  cast = 8936,
	  refreshable = true,
	  recast = true,
	})

	-- Cenarion Ward
	self:newSpell({
	  requiredTree = 4,
	  requiredTalent = 2,
	  playerbuff = {{102351}, {102352,2}},
	  cooldown = 102351,
	  auraunit = usemouseover and 'mouseover' or 'target',
	})

--[[
	-- Efflorescence - no way of tracking this yet.
	self:newSpell({
	  requiredTree = 4,
	  stance = 0,
	  requiredLevel = 83,
	  debuff = {145205,2},
	})
]]--

	-- Ironbark
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalentUnselected = 7,
	  requiredLevel = 52,
	  playerbuff = 102342,
	  cooldown = 102342,
	})

	-- Ironbark
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = 7,
	  requiredLevel = 52,
	  playerbuff = 102342,
	  cooldown = 102342,
	})

	-- Essence of G'Hanir
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalentUnselected = 7,
	  requiredArtifactTalent  = 208253,
	  playerbuff = 208253,
	  cooldown = 208253,
	})

	-- Essence of G'Hanir
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = 7,
	  requiredArtifactTalent  = 208253,
	  playerbuff = 208253,
	  cooldown = 208253,
	})

	-- Omen of Clarity / Moment of Clarity and Tranquility cooldown.
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalentUnselected = 7,
	  requiredLevel = 12,
	  playerbuff = 16870,
	  icon = 16870,
	  channel = {740,2},
	  cooldown = 740,
	  smallCooldown = true,
	})

	-- Omen of Clarity / Moment of Clarity and Tranquility cooldown.
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = 7,
	  playerbuff = 16870,
	  icon = 16870,
	  channel = {740,2},
	  cooldown = 740,
	  smallCooldown = true,
	})

	-- Balance Affinity

	-- Moonfire
	self:newSpell({
	  requiredTree = 4,
	  stance = {1,4},
	  requiredTalent = 7,
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
	  recharge = 22842,
	  playerbuff = 22842,
	})

	-- Incarnation: Tree of Life
	self:newSpell({
	  requiredTree = 4,
	  requiredTalent = 14,
	  cooldown = 33891,
	  playerbuff = 117679,
	})

	--The following bars are hidden by default as, depending on talent choices, you can end up with up to ELEVEN bars showing!
	--If you'd like the offensive spell DoT's tracked uncomment the following four sections by removing the --[[ and ]]-- from the next line and the second last line of the file.
	--[[
	-- Moonfire
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalentUnselected = 7,
	  requiredLevel = 10,
	  debuff = {164812,2},
	  refreshable = true,
	})

	-- Moonfire
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = 7,
	  debuff = {164812,2},
	  refreshable = true,
	})

	-- Sunfire with Solar Wrath cast.
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,4},
	  requiredTalentUnselected = 7,
	  requiredLevel = 24,
	  debuff = {164815,2},
	  refreshable = true,
	  icon = 164815,
	  cast = 5176,
	})

	-- Sunfire with Solar Wrath cast.
	self:newSpell({
	  requiredTree = 4,
	  stance = {0,5},
	  requiredTalent = 7,
	  debuff = {164815,2},
	  refreshable = true,
	  icon = 164815,
	  cast = 5176,
	})
]]--
end
