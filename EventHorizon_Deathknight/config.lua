function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 49998

  -- Blood

  -- Blood Shield (not sure if this is needed but I've found it useful as a new DK)
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 10,
	playerbuff = 77535,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {252/255, 010/255, 020/255, 0.7}
	 },
  })

  -- Bone Shield buff & Consumption (artifact ability) CD
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 55,
	playerbuff = {195181, 1.5}, -- The 1.5 here is just so this specific bar has an unhasted GCD indicator as letting this drop is, apparently, very bad.
	cooldown = 205223,
	smallCooldown = true,
	barcolors = {
	 cooldown	= {202/255, 161/255, 050/255, 0.7},
	 playerbuff	= {171/255, 202/255, 111/255, 0.3}
	 },
  })

  -- Blood Plague & Blood Boil
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 55,
	debuff = {55078,3},
	recharge = 50842,
	barcolors = {
	 recharge	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {111/255, 010/255, 191/255, 0.6}
	 },
  })

  -- Death and Decay & Crimson Scourge
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 56,
	cooldown = 43265,
	smallCooldown = true,
	playerbuff = 81136,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {171/255, 030/255, 010/255, 0.7}
	 },
  })

  -- Blooddrinker
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 3,
	cooldown = 206931,
	debuff = 206931,
  })

  -- Bonestorm
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 19,
	cooldown = 194844,
	debuff = 196528,
  })

  -- Blood Mirror
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 20,
	cooldown = 206977,
	debuff = 206977,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {232/255, 090/255, 171/255, 0.7}
	 },
  })

  -- Mark of Blood
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 10,
	cooldown = 206940,
	debuff = 206940,
  })

  -- Tombstone
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 12,
	cooldown = 219809,
	playerbuff = 219809,
  })

  -- Rune Tap
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 17,
	cooldown = 194679,
	playerbuff = 194679,
  })

  -- Anti-Magic Shell
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 57,
	requiredTalentUnselected = 9,
	cooldown = 48707,
	playerbuff = {48707},
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {212/255, 242/255, 040/255, 0.7}
	 },
  })

  -- Anti-Magic Shell
  self:newSpell({
	requiredTree = 1,
	requiredTalent = 9,
	cooldown = 48707,
	playerbuff = {205725,5},
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {212/255, 242/255, 040/255, 0.7}
	 },
  })

  -- Vampiric Blood
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 57,
	cooldown = 55233,
	playerbuff = 55233,
  })

  -- Dancing Rune Weapon
  self:newSpell({
	requiredTree = 1,
	requiredLevel = 57,
	cooldown = 49028,
	playerbuff = 49028,
  })

  -- Frost
--[[ I was testing not having this as it's unlikely to ever be missing unless you fell asleep, feedback welcome.
  -- Frost Fever
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 55,
	debuff = {55095,3},
	barcolors = {
	 debuffmine	= {212/255, 242/255, 252/255, 0.7}
	 },
  })
]]

  -- Icy Talons
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 2,
	playerbuff = {194878, 1.5}, -- Unhasted GCD time included as a 'tick marker' to help keep it up.
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {212/255, 242/255, 252/255, 0.7}
	 },
  })

  -- Glacial Advance
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 21,
	cooldown = 194913,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6}
	 },
  })

  -- Remorseless Winter
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 57,
	cooldown = 196770,
	debuff = 196770,
	barcolors = {
	 cooldown	= {151/255, 222/255, 252/255, 0.6},
	 debuffmine	= {151/255, 222/255, 252/255, 0.7}
	 },
  })

  -- Pillar of Frost
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 57,
	cooldown = 51271,
	playerbuff = 51271,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {181/255, 252/255, 252/255, 0.6}
	 },
  })

  -- Horn of Winter cooldown at half height and Razorice buff/stack count
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 57,
	cooldown = 57330,
	smallCooldown = true,
	debuff = 51714,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {050/255, 101/255, 202/255, 0.7}
	 },
  })

  -- Obliteration
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 19,
	cooldown = 207256,
	playerbuff = 207256,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {050/255, 090/255, 111/255, 0.7}
	 },
  })

  -- Empower Rune Weapon
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 57,
	requiredTalentUnselected = 8,
	recharge = 47568,
	barcolors = {
	 cooldown	= {070/255, 252/255, 252/255, 0.5},
	 playerbuff	= {070/255, 252/255, 252/255, 0.7}
	 },
  })

  -- Hungering Rune Weapon
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 8,
	cooldown = 207127,
	playerbuff = 207127,
	barcolors = {
	 cooldown	= {070/255, 252/255, 252/255, 0.5},
	 playerbuff	= {070/255, 252/255, 252/255, 0.7}
	 },
  })

  -- Breath of Sindragosa
  self:newSpell({
	requiredTree = 2,
	requiredTalent = 20,
	cooldown = 152279,
	playerbuff = 152279,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {050/255, 090/255, 111/255, 0.7}
	 },
  })

--[[ Not included by default as it's a five minute CD, feedback has told us this is too long to track. Uncomment if wanted.
  -- Sindragosa's Fury
  self:newSpell({
	requiredTree = 2,
	requiredArtifactTalent = 190778,
	cooldown = 190778,
	barcolors = {
	 cooldown	= {202/255, 161/255, 050/255, 0.7},
	 },
  })
]]--

  -- Remove the --[[ and ]]-- from any of the damage reduction spells you'd like to track in Frost spec.
--[[
  -- Anti-Magic Shell
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 57,
	cooldown = 48707,
	playerbuff = 48707,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {212/255, 242/255, 040/255, 0.7}
	 },
  })
]]--

--[[
  -- Icebound Fortitude
  self:newSpell({
	requiredTree = 2,
	requiredLevel = 57,
	cooldown = 48792,
	playerbuff = 48792,
  })
]]--

  -- Unholy

  -- Virulent Plague & Epidemic without Ebon Fever
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 81,
	requiredTalentUnselected = 3,
	debuff = {{196782,6}, {191587,3}},
	recharge = 207317,
	refreshable = true,
	barcolors = {
	 recharge	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {181/255, 232/255, 090/255, 0.7}
	 },
  })

  -- Virulent Plague & Epidemic with Ebon Fever
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 81,
	requiredTalent = 3,
	debuff = {191587,3},
	recharge = 207317,
	refreshable = true,
	barcolors = {
	 recharge	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {181/255, 232/255, 090/255, 0.7}
	 },
  })

  -- Festering Strike & Blighted Rune Weapon
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 57,
	debuff = 194310,
	cooldown = 194918,
	smallCooldown = true,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {222/255, 080/255, 242/255, 0.7}
	 },
  })

  -- Death and Decay, Sudden Doom and Dark Succor. The icon changes but buff colour can't (yet I hope).
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 74,
	requiredTalentUnselected = 20,
	cooldown = 43265,
	smallCooldown = true,
	playerbuff = {{216974}, {49530}, {191748}},
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {080/255, 010/255, 151/255, 0.7}
	 },
  })

  -- Defile, Sudden Doom and Dark Succor
  self:newSpell({
	requiredTree = 3,
	requiredTalent = 20,
	cooldown = 152280,
	smallCooldown = true,
	playerbuff = {{216974}, {49530}, {191748}},
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {080/255, 010/255, 151/255, 0.7}
	 },
  })

  -- Dark Transformation
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 74,
	cooldown = 63560,
	playerbuff = 63560,
	auraunit = "pet",
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {161/255, 131/255, 080/255, 0.7}
	 },
  })

  -- Apocalypse
  self:newSpell({
	requiredTree = 3,
	requiredArtifactTalent = 220143,
	cooldown = 220143,
	barcolors = {
	 cooldown	= {202/255, 161/255, 050/255, 0.7},
	 },
  })

  -- Summon Gargoyle
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 75,
	requiredTalentUnselected = 19,
	cooldown = 49206,
	static = 40,
	barcolors = {
	 cooldown	= {040/255, 101/255, 121/255, 0.6},
	 },
  })

  -- Dark Arbiter
  self:newSpell({
	requiredTree = 3,
	requiredTalent = 19,
	cooldown = 207349,
	static = 15,
	barcolors = {
	 cooldown	= {040/255, 101/255, 121/255, 0.6},
	 },
  })

  -- Remove the --[[ and ]]-- from any of the damage reduction spells you'd like to track in Unholy spec.
--[[
  -- Corpse Shield
  self:newSpell({
	requiredTree = 3,
	requiredTalent = 14,
	cooldown = 207319,
	playerbuff = 207319,
	barcolors = {
	 recharge	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {181/255, 232/255, 090/255, 0.7}
	 },
  })
]]--

--[[
  -- Anti-Magic Shell
  self:newSpell({
	requiredTree = 3,
	cooldown = 48707,
	playerbuff = 48707,
	barcolors = {
	 cooldown	= {171/255, 191/255, 181/255, 0.6},
	 playerbuff	= {212/255, 242/255, 040/255, 0.7}
	 },
  })
]]--

--[[
  -- Icebound Fortitude
  self:newSpell({
	requiredTree = 3,
	requiredLevel = 57,
	cooldown = 48792,
	playerbuff = 48792,
	barcolors = {
	 recharge	= {171/255, 191/255, 181/255, 0.6},
	 debuffmine	= {181/255, 232/255, 090/255, 0.7}
	 },
  })
]]--

end
