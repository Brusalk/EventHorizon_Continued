local usemouseover = true -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.
function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 528 -- dispel magic
	self.config.hastedSpellID = {2006, 10}-- Resurrection

	-- Discipline

	-- Shadow Word: Pain with Smite and Penance CD at half height.
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 4,
	  requiredTalentUnselected = 19,
	  debuff = {589, 2},
	  refreshable = true,
	  cast = {585, 186263},
	  channel = 47540,
	  cooldown = 47540,
	  smallCooldown = true,
	})

	-- Purge the Wicked with Smite and Penance CD at half height.
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 4,
	  requiredTalent = 19,
	  debuff = {204213, 2},
	  refreshable = true,
	  cast = {585, 186263},
	  channel = 47540,
	  cooldown = 47540,
	  smallCooldown = true,
	})

	-- Schism
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 3,
	  cast = 214621,
	  cooldown = 214621,
	})

	-- Power Word: Solace
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 10,
	  cooldown = 129250,
	})

	-- Divine star
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 17,
	  cooldown = 110744,
	})

	--Halo
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 18,
	  cast = 120517,
	  cooldown = 120517,
	})

	-- Mindbender
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 12,
	  cooldown = 123040,
	})

	-- Light's Wrath
	self:newSpell({
	  requiredTree = 1,
	  requiredArtifactTalent = 207946,
	  cast = 207946,
	  cooldown = 207946,
	})

	-- Power Infusion
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 14,
	  playerbuff = 10060,
	  cooldown = 10060,
	})

	-- Shadowfiend
	self:newSpell({
	  requiredTree = 1,
	  requiredTalentUnselected = 12,
	  cooldown = 34433,
	})

	-- Atonement and Power World: Shield CD at half height.
	self:newSpell({
	  requiredTree = 1,
	  playerbuff = 194384,
	  auraunit = usemouseover and 'mouseover' or 'target',
	  refreshable = true,
	  cooldown = 17,
	  smallCooldown = true,
	})

	-- Holy

	--Renew
	self:newSpell({
	  requiredTree = 2,
	  playerbuff = 139,
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	})

	--Prayer of Mending
	self:newSpell({
	  requiredTree = 2,
	  cooldown = 33076,
	  auraunit = target and 'mouseover' or 'target',
	})

	-- Holy word : Serenity
	self:newSpell({
	  requiredTree = 2,
	  cooldown = 2050,
	})

	-- Holy word: Sanctify
	self:newSpell({
	  requiredTree = 2,
	  cooldown = 34861,
	})

	-- Circle of healing
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 21,
	  cooldown = 204883,
	})

	--Halo
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 18,
	  cast = 120517,
	  cooldown = 120517,
	})

	-- Divine star
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 17,
	  cooldown = 110744,
	})

	-- Shadow

	-- Vampiric Touch & Void Torrent channel and CD at half height.
	self:newSpell({
	  requiredTree = 3,
	  cast = 34914,
	  channel = 205065,
	  debuff = {34914, 3},
	  refreshable = true,
	  cooldown = 205065,
	  smallCooldown = true,
	  recast = true,
	})

	-- Shadow Word: Pain & Void Bolt CD.
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 4,
	  debuff = {589, 3},
	  cooldown = 205448,
--	  smallCooldown = true,
	})

	-- Mind Blast/Mind Flay/Mind Sear
	self:newSpell({
	  requiredTree = 3,
	  requiredTalentUnselected = 20,
	  cast = 8092,
	  channel = {{15407, 3}, {48045, 3}},
	  cooldown = 8092,
	  icon = 8092,
	})

	-- Mind Blast/Mind Sear/Mind Spike
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 20,
	  cast = {8092, 73510},
	  channel = {{15407, 3}, {48045, 3}},
	  cooldown = 8092,
	  debuff = 217673,
	  icon = 8092,
	  smallCooldown = true,
	})

	-- Shadow Word: Death
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 46,
	  cooldown = 32379,
	})

	-- Shadow Word: Void
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 3,
	  cast = 205351,
	  cooldown = 205351,
	})

	-- Shadow Crash
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 17,
	  cast = 205385,
	  cooldown = 205385,
	})

	-- Power Infusion
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 16,
	  playerbuff = 10060,
	  cooldown = 10060,
	})

	-- Shadowfiend / Mindbender
	self:newSpell({
	  requiredTree = 3,
	  cooldown = {200174, 34433},
	})

end
