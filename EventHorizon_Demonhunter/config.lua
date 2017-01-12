function EventHorizon:InitializeClass()
	self.config.gcdSpellID = 162794

	-- Havoc

	-- Blade Dance
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 188499,
	  playerbuff = 188499,
	})

	-- Fel Rush
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 98,
	  cooldown = 195072,
	})

	-- Felblade
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 7,
	  cooldown = 232893,
	})

	-- Vengeful Retreat
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 198793,
	})

	-- Throw Glaive
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 99,
	  debuff = 206478,
	  cooldown = 185123,
	})

	-- Fel Eruption
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 14,
	  debuff = 211881,
	  cooldown = 211881,
	})

	-- Eye Beam
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 198013,
	})

	-- Fel Barrage
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 20,
	  cooldown = 211053,
	})

	-- Fury of the Illidari
	self:newSpell({
	  requiredTree = 1,
	  requiredArtifactTalent = 201467,
	  playerbuff = 201467,
	  cooldown = 201467,
	})

	-- Chaos Nova
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 179057,
	})

	-- Chaos Blades
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 19,
	  playerbuff = 211048,
	  cooldown = 211048,
	})

	-- Nemesis
	self:newSpell({
	  requiredTree = 1,
	  requiredTalent = 15,
	  playerbuff = 206491,
	  cooldown = 206491,
	})

	-- Defensive abilities, hidden by default due to the huge ammount of bars this spec has, remove the --[[ and ]]-- from the spell configs for any you'd like to display.
--[[
	-- Blur
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 198589,
	})
]]--

--[[
	-- Darkness
	self:newSpell({
	  requiredTree = 1,
	  requiredLevel = 100,
	  cooldown = 196718,
	})
]]--

	-- Vengeance
	-- Immolation Aura
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 100,
	  playerbuff = 178740,
	  cooldown = 178740,
	})

	-- Demon Spikes
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 100,
	  playerbuff = 203720,
	  cooldown = 203720,
	})

	-- Felblade
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 7,
	  cooldown = 213241,
	})

	-- Spirit Bomb
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 18,
	  debuff = 224509,
	})

	-- Fel Eruption
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 9,
	  playerbuff = 211881,
	  cooldown = 211881,
	})

	-- Sigil of Flame
	self:newSpell({
	  requiredTree = 2,
	  debuff = 204596,
	  cooldown = 204596,
	})

	-- Soul Barrier
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 21,
	  playerbuff = 227225,
	  cooldown = 227225,
	})

	-- Soul Carver
	self:newSpell({
	  requiredTree = 2,
	  requiredArtifactTalent = 207407,
	  cooldown = 207407,
	})

	-- Sigil of Chains
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 14,
	  debuff = 202138,
	  cooldown = 202138,
	})

	-- Fel Devastation
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 16,
	  debuff = 212084,
	  cooldown = 212084,
	})

	-- Demonic Infusion
	self:newSpell({
	  requiredTree = 2,
	  requiredTalent = 20,
	  cooldown = 236189,
	})

	-- Empower Wards
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 100,
	  playerbuff = 218256,
	  cooldown = 218256,
	})

	-- Fiery Brand
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 100,
	  debuff = 204021,
	  cooldown = 204021,
	})

	-- Metamorphosis
	self:newSpell({
	  requiredTree = 2,
	  requiredLevel = 98,
	  playerbuff = 187827,
	  cooldown = 187827,
	})

	end
