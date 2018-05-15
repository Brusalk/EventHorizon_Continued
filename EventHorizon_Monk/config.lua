local usemouseover = true  -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 100780 -- Legacy of the Emperor
  self.config.hastedSpellID = {115178, 10} -- Resuscitate
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- [[ Windwalker ]] --   
  -- rising sun kick
  self:newSpell({
    cooldown = 107428,
    keepIcon = true,
  })

  -- Fists of Fury
  self:newSpell({
    cooldown = 113656,
    channel = 113656,
    keepIcon = true,
  })

  -- dragon punch
  self:newSpell({
    cooldown = 152175,
    requiredTalent = 20,
    keepIcon = true,
  })

  -- touch of death
  self:newSpell({
    cooldown = 115080,
    keepIcon = true,
  })

  -- Storm, Earth and Fire
  self:newSpell({
    cooldown = 137639,
    playerbuff = 137639,
    keepIcon = true,
  })

  -- tiger
  self:newSpell({
    cooldown = 123904,
    requiredTalent = 17,
    keepIcon = true,
  })

end
