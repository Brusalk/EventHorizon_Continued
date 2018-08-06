local usemouseover = true  -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 100780 -- Legacy of the Emperor
  self.config.hastedSpellID = {115178, 10} -- Resuscitate
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- [[ Brewmaster ]] --
  -- keg smash
  self:newSpell({
    requiredTree = 1,
    cooldown = 121253,
    debuff = 121253,
  })
  
  -- breath of fire
  self:newSpell({
    requiredTree = 1,
    cooldown = 115181,
    debuff = 115181,
  })
  
  -- blackout strike
  self:newSpell({
    requiredTree = 1,
    cooldown = 205523,
  })

  -- chi wave
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 2,
    cooldown = 115098,
  })
  
  -- chi burst
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    cooldown = 123986,
  })

  -- rushing jade wind
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 17,
    cooldown = 116847,
    playerbuff = 116847,
  })

  -- ironskin brew
  self:newSpell({
    requiredTree = 1,
    recharge = 115308,
    playerbuff = 215479,
    refreshable = true,
  })  
  
  -- healing elixir
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 14,
    recharge = 122281
  })

  -- Guard
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 20,
    cooldown = 115295,
    playerbuff = 115295
  })
  
  --dampen harm
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 15,
    cooldown = 122278
  })

  -- invoke niuzau, the black ox
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 18,
    cooldown = 132578
  })
  

  -- fortifying brew
  self:newSpell({
    requiredTree = 1,
    cooldown = 115203
  })

  --zen meditation
  self:newSpell({
    requiredTree = 1,
    cooldown = 115176
  })

  -- summon black ox statue
  -- self:newSpell({
  --   requiredTree = 1,
  --   requiredTalent = 11,
  --   cooldown = 115315,
  -- })   
  
  -- [[ Windwalker ]] --
  -- Fist of the White Tiger
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 8,
    cooldown = 261947,
  })

  -- Fists of Fury
  self:newSpell({
    requiredTree = 3,
    cooldown = 113656,
    channel = 113656,
  })
  
  -- rising sun kick
  self:newSpell({
    requiredTree = 3,
    cooldown = 107428,
  })
  
  -- whirling dragon punch
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 20,
    cooldown = 152175,
  })
  
  -- chi wave
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 2,
    cooldown = 115098,
  })
  
  -- chi burst
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 3,
    cooldown = 123986,
  })

  -- Energizing Elixir
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 9,
    cooldown = 115288
  })

  -- Touch of Death
  self:newSpell({
    requiredTree = 3,
    cooldown = 115080,
  })

  -- Storm, Earth and Fire
  self:newSpell({
    requiredTree = 3,
    requiredTalentUnselected = 21,
    cooldown = 137639,
    playerbuff = 137639,
  })

  -- serenity
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 21,
    cooldown = 152173,
    playerbuff = 152173,
  })

  -- tiger
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 18,
    cooldown = 123904,
  })
  
  -- energizing elixir
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 7,
    cooldown = 115288,
  })
  
end
