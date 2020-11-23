function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 1454
  self.config.hastedSpellID = {6201, 3} -- Create Healthstone
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12
  
  -- *** Affliction *** --
    -- Haunt
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 17,
    cast = 48181,
    cooldown = 48181,
    debuff = 48181,
  })
  
  
  -- Unstable Affliction
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 13,
    cast = 30108,
    debuff = {30108, 2},
    hasted = true,
    recast = true,
  })
  
    -- [Seed of] Corruption
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 2,
    debuff = {{172, 2}, {27243, 2}},
    icon = 172,
    cast = 27243,
	  hasted = true,
    refreshable = true,
  })
  
  -- Agony
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 10,
    debuff = {980, 2},
	  hasted = true,
    refreshable = true,
  })
  
  
  --Siphon Life
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 6,
    cast = 63106,
    debuff = {63106, 3},
    hasted = true,
  })
  

  -- Phantom Singularity
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 11,
    debuff = {205179, 2},
    cooldown = 205179,
    refreshable = false,
    hasted = true,
  })
  
  --Vile Taint
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 12,
    cast = 278350,
    debuff = {278350, 2},
    cooldown = 278350,
	  hasted = true,
  })
    -- Shadowbolt
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 1,
    cast = 686,
    playerbuff = 108558
  })
  
      -- Shadowbolt
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 2,
    cast = 686,
    playerbuff = 334319
  })
  
  -- Drain Soul
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    channel = {{198590, 5}},
    hasted = true,
    icon = 198590
  })
  
  -- Dark Soul: Misery
--  self:newSpell({
--    requiredTree = 1,
--    requiredTalent = 21,
--    cooldown = 113860,
--    playerbuff = 113860,
--  })
  
  -- Summon Darkglare
--  self:newSpell({
--    requiredTree = 1,
--    cooldown = 205180
--  })
  
  --** Demonology **--
  -- Doom
  self:newSpell({
    requiredTree = 2,
    debuff = {603, 20},
    refreshable = true,
    hasted = false,
    requiredTalent = 6,
  })
  
  -- Call Dreadstalkers
  self:newSpell({
    requiredTree = 2,
    cast = 104316,
    cooldown = 104316,
  })
  
  -- Bilescourge Bombers
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 2,
    cooldown = 267211
  })
  
  -- Vilefiend
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 12,
    cast = 264119,
    cooldown = 264119
  })
  
    -- Felstorm
  self:newSpell({
    requiredTree = 2,
    cooldown = 89751
  })
  
    -- Demonic Strength
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 3,
    cooldown = 267171
  })
  
  
  -- Grimoire: Felguard
--self:newSpell({
--  requiredTree = 2,
--  requiredTalent = 18,
--  cooldown = 111898
--  })
  
  -- Demonic Tyrant
--  self:newSpell({
--    requiredTree = 2,
--    cast = 265187,
--    cooldown = 265187
--  })
  
  -- Shadowbolt
  self:newSpell({
    requiredTree = 2,
    cast = {686, 105174, 264178},
    playerbuff = 264173
  })
  
  -- Power Siphon
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 5,
    cooldown = 264130
  })
  
  -- Soul Strike
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 11,
    cooldown = 264057
  })
  
  -- Nether Portal
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 21,
    cooldown = 267217,
    cast = 267217,
    playerbuff = 267217
  })
  
  -- *** Destruction *** --
  -- Immolate
  self:newSpell({
    requiredTree = 3,
    cast = 348,
    debuff = {348, 3},
    recast = true,
  })
  
  -- Conflag
  self:newSpell({
    requiredTree = 3,
    recharge = 17962,
  })
  
  -- Soul Fire
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 3,
    cast = 6353,
    cooldown = 6353
  })
  
  -- Shadowburn
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 6,
    recharge = 17877
  })
  
  -- Backdraft/Incinerate
  self:newSpell({
    requiredTree = 3,
    playerbuff = 117828,
    cast = {116858, 29722},
  })
  
  -- Eradication
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 2,
    debuff = 196414,
  })
  
  -- Channel Demonfire
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 20,
    cooldown = 196447,
    hasted = true,
    channeled = {196447, 15},
  })
  
  -- Cata
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 12,
    cast = 152108,
    cooldown = 152108,
  })
  
  --Havoc
  self:newSpell({
    requiredTree = 3,
    debuff = {80240, 0},
    cooldown = 80240,
    barcolors = {
      debuff  = {255/255, 000/255, 000/255, 0.7}
    },
  })
  
  -- Dark Soul: Instability
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 21,
    cooldown = 113858,
    playerbuff = 113858
  })
  
  -- Summon Infernal
  self:newSpell({
   requiredTree = 3,
   requiredLevel = 50,
   cooldown = 1122,
   playerbuff = 40948,
  })
  
end
