function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 1454
  self.config.hastedSpellID = {6201, 3} -- Create Healthstone

  -- *** Affliction *** --
  -- Unstable Affliction
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 14,
    cast = 30108,
    debuff = {30108, 2},
    refreshable = true,
  })

  -- Agony
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 10,
    debuff = {980, 2},
    refreshable = true,
  })

  -- [Seed of] Corruption
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 3,
    debuff = {{172, 2}, {27243, 2}},
    icon = 172,
    cast = 27243,
    refreshable = true,
  })

  --Siphon Life
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 10,
    cast = 63106,
    debuff = {63106, 3},
    hasted = true,
    recast = true,
  })

  -- Haunt
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 1,
    cast = 48181,
    cooldown = 48181,
    debuff = 48181,
  })

  --Drain Life/Malefic Grasp
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 13,
    channel = {{198590, 6}},
    hasted = true,
  })

  -- Phantom Singularity
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 20,
    debuff = {205179, 2},
    cooldown = 205179,
    refreshable = false,
    hasted = false,
  })

  --** Demonology **--
  -- Doom
  self:newSpell({
    requiredTree = 2,
    debuff = {603, 15},
    refreshable = true,
    hasted = false,
  })

  -- Call Dreadstalkers
  self:newSpell({
    requiredTree = 2,
    cast = 104316,
    cooldown = 104316,
  })

  -- darkglare
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 19,
    cast = 205180,
    cooldown = 205180,
  })

  -- shadowbolt
  self:newSpell({
    requiredTree = 2,
    cast = {157695, 686, 105174, 193396},
  })

  -- shadowflame
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 2,
    debuff = 145551,
    cast = 145551,
    refreshable = true,
    cooldown = 145551,
  })

  -- *** Destruction *** --
  -- Immolate
  self:newSpell({
    requiredTree = 3,
    cast = 348,
    debuff = {348, 3},
    recast = true,
    barcolors = {
      casting    = { 0, 1, 0, 1 },
      debuffmine  = { 1, 0, 0, 1 }
    }
  })

  -- Conflag
  self:newSpell({
    requiredTree = 3,
    recharge = 17962,
  })

  -- Backdraft/Incinerate
  self:newSpell({
    requiredTree = 3,
    playerbuff = 117828,
    cast = {116858, 29722, 5740},
    barcolors = {
      casting = { 0, 0, 1, 0.6 }
    }
  })

  -- Eradication
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 5,
    debuff = 196414,
    barcolors = {
      debuffmine = { 1, 0, 0, 1   },
      casting = { 0, 0, 1, 0.6 }
    }
  })

  -- Channel Demonfire
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 20,
    cooldown = 196447,
    hasted = true,
    channeled = {196447, 15},
    barcolors = {
      barbgcolor  = { 0, 0.5, 0, 0.2 },
      cooldown  = { 0, 1,   0, 0.5 },
      casting    = { 0, 0,   0, 1   },
      channeltick  = { 1, 0,   0, 1   }
    }
  })

  --Havoc
  self:newSpell({
    requiredTree = 3,
    debuff = {80240, 0},
    cooldown = 80240,
  })

  -- Dimensional Rift
  self:newSpell({
    requiredTree = 3,
    recharge = 196586,
    -- rechargeMaxDisplayCount = 2, -- Uncomment if you only want to see charges 1/2
    requiredArtifactTalent = 196586,
  })

  -- Empowered Life Tap
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 6,
    playerbuff = 235156,
  })

  -- Cata
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 10,
    cast = 152108,
    cooldown = 152108,
  })

  -- Soul Harvest
  self:newSpell({
    requiredTree = {1, 2, 3},
    requiredTalent = 12,
    cast = 196098,
    cooldown = 196098,
  })

  -- GrimService
  self:newSpell({
    requiredTree = {1, 2, 3},
    requiredTalent = 17,
    cooldown = 111859,
  })

  -- Summon Doomguard/Infernal
  self:newSpell({
    requiredTree = {1, 2, 3},
    requiredLevel = 50,
    requiredTalentUnselected = 16, -- Don't show if GoSup
    cooldown = {18540, 1122},
  })

end
