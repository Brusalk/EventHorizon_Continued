function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 100
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- -- Fury

  -- bloodthirst
  self:newSpell({
        cooldown = 23881,
        requiredTree = 2,
  })

  -- raging blow
  self:newSpell({
        cooldown = 85288,
        requiredTree = 2,
  })

  -- enrage
  self:newSpell({
        playerbuff = 184362,
        requiredTree = 2,
  })

    -- battlecry
  self:newSpell({
        cooldown = 1719,
        requiredTree = 2,
  })

  -- wrecking ball
  self:newSpell({
        playerbuff = 215570,
        requiredTree = 2,
    requiredTalent = 7,
  })

  -- frothing berserker
  self:newSpell({
        playerbuff = 215572,
        requiredTree = 2,
    requiredTalent = 14,
  })

    -- dragons roar
  self:newSpell({
        cooldown = 118000,
        requiredTree = 2,
    requiredTalent = 21,
  })

    -- bladestorm  fury
  self:newSpell({
        cooldown = 46924,
        requiredTree = 2,
    requiredTalent = 19,
  })


    -- -- Arms

  -- Collosal Smash
  self:newSpell({
    debuff = 208086,
        cooldown = 167105,
    requiredTree = 1,
    })

  -- Mortal Strike
  self:newSpell({
        cooldown = 12294,
        requiredTree = 1,
    })

    -- -- Rend
    self:newSpell({
        debuff = {772, 3},
        requiredTree = 1,
        requiredTalent = 8,
    })

  -- overpower
  self:newSpell({
    playerbuff = 60503,
        requiredTree = 1,
    requiredTalent = 2,
    })

  -- Deadly Calm
  self:newSpell({
        cooldown = 1719,
        playerbuff = 1719,
        requiredTree = 1,
    })

  -- Avatar
  self:newSpell({
        cooldown = 107574,
    playerbuff = 107574,
        requiredTree = {1, 2},
    requiredTalent = 9,
    })

  -- Cleave
  self:newSpell({
        cooldown = 845,
        requiredTree = 1,
    })

  -- Bladestorm arms
  self:newSpell({
        cooldown = {227847, 152277},
        requiredTree = 1,
    })

    -- -- Protection

     -- Ignore Pain
     self:newSpell({
     playerbuff = 190456,
         requiredTree = 3,
     })

     -- Shield Block
     self:newSpell({
       playerbuff = 132404,
         requiredTree = 3,
     })

     -- Shield Slam
     self:newSpell({
         cooldown = 23922,
       requiredTree = 3,
     })

     -- Demoralizing Shout
     self:newSpell({
         cooldown = 1160,
         debuff = 1160,
       requiredTree = 3,
    })

     -- Battle Cry
     self:newSpell({
        cooldown = 1719,
       playerbuff = 1719,
       requiredTree = 3,
    })


end