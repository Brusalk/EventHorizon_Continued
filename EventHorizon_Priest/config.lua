local usemouseover = true -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.
function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 528 -- dispel magic
	self.config.hastedSpellID = {2006, 10}-- Resurrection

	-- Discipline

	-- Penance
	self:newSpell({
	  requiredTree = 1,
	  cast = 47540,
	  cooldown = 47540,
	})

	-- purge of the wicked
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 19,
	  debuff = 204213,
	  refreshable = true,
	  hasted = true,
	})

	-- Power World: Shield
	self:newSpell({
	  requiredTree = 1,
	  cooldown = 17,
	})

	-- Schism
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 3,
	  cast = 214621,
	  cooldown = 214621,
	})

	-- Power word: Solace
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 10,
	  cooldown = 129250,
	})

	-- Mindbender
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 12,
	  cooldown = 123040,
	})

	--Halo
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 18,
	  cast = 120517,
	  cooldown = 120517,
	})

	-- Divine star
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 17,
	  cooldown = 110744,
	})

	-- Atonement
	self:newSpell({
	  requiredTree = 1,
	  playerbuff = 194384,
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	})

	-- Holy

	--Renew
	self:newSpell({
	  requiredTree = 2,
	  playerbuff = 139,
	  auraunit = target and 'mouseover' or 'target',
	  refreshable = true,
	  hasted = true,
	})

	--PoM
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

	-- Vampiric Touch/Mind Flay/SW:Death CD
	self:newSpell({
	  requiredTree = 3,
	  cast = 34914, 
	  channel = {15407, 3},
	  debuff = {34914, 3},
	  cooldown = 199911,
	  refreshable = true,
	  hasted = true,
	  recast = true,
	})

	-- SW: Pain + Mind Blast
	self:newSpell({
	  requiredTree = 3,
	  requiredLevel = 4,
	  debuff = {589, 3},
	  cast = 8092,
	  cooldown = 8092,
	  hasted = true,
	  refreshable = true,
	})

	-- Mind Spike
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 20,
	  cast = 73510,
	  debuff = 217673,
	})

	-- Void bolt/Void eruption
	self:newSpell({
	  requiredTree = 3,
	  playerbuff = {{228264, 0},{197937, 0}},
	  cast = 228260,
	  cooldown = 205448,
	})

	-- Power Infusion
	self:newSpell({
	  requiredTree = 3,
	  requiredTalent = 16,
	  cooldown = 10060,
	})

	-- Shadowfiend / Mindbender
	self:newSpell({
	  requiredTree = 3,
	  cooldown = {200174, 34433},
	})

	-- SW: Void
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

end
