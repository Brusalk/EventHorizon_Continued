function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 162794
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- Havoc

  -- Blade Dance
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 12,
    cooldown = 188499,
    playerbuff = 188499,
  })

  -- Fel Rush
  self:newSpell({
    requiredTree = 1,
    -- requiredLevel = 98,
    recharge = 195072,
  })

  -- Felblade
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    cooldown = 232893,
  })

  -- Vengeful Retreat
  self:newSpell({
    requiredTree = 1,
    cooldown = 198793,
  })

  -- Glaive Tempest
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 9,
    cooldown = 342817
  })

  -- Essence Break
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 15,
    cooldown = 258860,
    debuff = 320338
  })

  -- Fel Eruption
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 18,
    debuff = 211881,
    cooldown = 211881,
  })

  -- Eye Beam
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 11,
    cooldown = 198013,
  })

  -- Immolation Auro
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 27,
    playerbuff = 258920,
    cooldown = 258920,
  })

  -- Fel Barrage
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    cooldown = 258925,
  })

  -- -- Fury of the Illidari
  -- self:newSpell({
  --   requiredTree = 1,
  --   requiredArtifactTalent = 201467,
  --   playerbuff = 201467,
  --   cooldown = 201467,
  -- })

  -- Throw Glaive
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 10,
    recharge = 185123,
  })

  -- Chaos Nova
  -- self:newSpell({
  --   requiredTree = 1,
  --   requiredLevel = 100,
  --   cooldown = 179057,
  -- })


  -- Defensive abilities, hidden by default due to the huge ammount of bars this spec has, remove the --[[ and ]]-- from the spell configs for any you'd like to display.
  --[[
  -- Blur
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 21,
    cooldown = 198589,
  })
  ]]--

  --[[
  -- Darkness
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 39,
    cooldown = 196718,
  })
  ]]--

  --[[
  -- Netherwalk
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 12,
    cooldown = 196555,
  })
  ]]--

  -- Vengeance

  -- Soul Fragments
  self:newSpell({
    requiredTree = 2,
    playerbuff = 203981,
    recharge = 189110,
    barcolors = {
      playerbuff = {128/255, 025/255, 157/255, 0.7},
      recharge = {171/255, 191/255, 181/255, 0.5}
    },
  })

  -- Demon Spikes
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 1,
    playerbuff = 203720,
    recharge = 203720,
    barcolors = {
      playerbuff = {232/255, 202/255, 000/255, 0.7},
      recharge = {171/255, 191/255, 181/255, 0.4}
    },
  })

  -- Immolation Aura
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 14,
    playerbuff = 258920,
    cooldown = 258920,
    barcolors = {
      playerbuff = {205/255, 237/255, 069/255, 0.7},
      cooldown = {171/255, 191/255, 181/255, 0.5}
    },
  })


  -- Felblade
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 3,
    cooldown = 232893,
  })

  -- Spirit Bomb
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 9,
    debuff = 247456,
  })

  -- Fracture
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 12,
    recharge = 263642
  })

  -- Fel Eruption
  -- self:newSpell({
  --   requiredTree = 2,
  --   requiredTalent = 9,
  --   playerbuff = 211881,
  --   cooldown = 211881,
  -- })

  -- Sigil of Flame
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 12,
    debuff = 204596,
    cooldown = 204596,
    barcolors = {
      playerbuff = {070/255, 101/255, 009/255, 0.7},
      cooldown = {171/255, 191/255, 181/255, 0.5}
    },
  })

  -- Soul Barrier
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 18,
    playerbuff = 263648,
    cooldown = 263648,
  })

  -- Bulk Extraction
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 21,
    cooldown = 320341
  })

  -- Soul Carver
  -- self:newSpell({
  --   requiredTree = 2,
  --   requiredArtifactTalent = 207407,
  --   cooldown = 207407,
  --   debuff = 207407,
  --   barcolors = {
  --     debuffmine = {202/255, 161/255, 055/255, 0.9},
  --     cooldown = {202/255, 161/255, 055/255, 0.5}
  --   },
  -- })

  -- Sigil of Chains
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 15,
    debuff = 202138,
    cooldown = 202138,
  })

  -- Fel Devastation
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 11,
    cooldown = 212084,
  })

  -- Fiery Brand
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 1,
    debuff = 207744,
    cooldown = 204021,
    barcolors = {
      debuffmine = {151/255, 252/255, 131/255, 0.7},
      cooldown = {171/255, 191/255, 181/255, 0.5}
    },
  })

  -- Metamorphosis
  self:newSpell({
    requiredTree = 2,
    playerbuff = 187827,
    cooldown = 187827,
    barcolors = {
      playerbuff = {040/255, 050/255, 050/255, 0.7},
      cooldown = {171/255, 191/255, 181/255, 0.5}
    },
  })

end
