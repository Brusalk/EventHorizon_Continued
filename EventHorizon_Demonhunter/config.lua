function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 162794

	--Havoc

	--Blade Dance
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 188499,
	  playerbuff = 188499,
	})

	--Fel Rush
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 98,
	  cooldown = 195072,
	})

	--Vengeful Retreat
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 198793,
	})

	--Throw Glaive
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 99,
	  cooldown = 185123,
	})

	--Eye Beam
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 198013,
	})

	--Chaos Nova
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 179057,
	})

	--Darkness
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 196718,
	})

	end
