function EventHorizon:InitializeClass()
    self.config.gcdSpellID = 1680

    -- -- Arms
    -- Colossus Smash + Warbreaker
    self:newSpell({
        cooldown = {167105, 262161},
        debuff = {167105, 262161},
        requiredTree = 1,
    })

    -- Rend
    self:newSpell({ 
        debuff = {772, 3},
        requiredTalent = 9,
        requiredTree = 1,
    })

    -- Mortal Strike + In For The Kill
    self:newSpell({
        cooldown = 12294,
        icon = 12294,
        keepIcon = true,
        playerbuff = 248621,
        requiredTree = 1,
    })

    -- Overpower
    self:newSpell({ 
        recharge = 7384,
        requiredTree = 1,
    })

    -- Sudden Death
    self:newSpell({
        playerbuff = 29725,
        requiredTalent = 2,
        requiredTree = 1,
    })

    -- Skullsplitter 
    self:newSpell({
        cooldown = 260643,
        requiredTalent = 3,
        requiredTree = 1,
    })

    -- Sweeping Strikes + Collateral damage
    self:newSpell({
        keepIcon = true,
        playerbuff = {{260708}, {334783}},
        cooldown = 260708,
        requiredTree = 1,
    })

    -- Deep Wounds + Cleave
    self:newSpell({
        debuff = {262304, 3},
        cooldown = 845,
        requiredTree = 1,
    })

    -- Bladestorm
    self:newSpell({
        playerbuff = 46924,
        cooldown = {227847, 152277},
        requiredTree = 1,
    })

    -- Avatar
    self:newSpell({
        playerbuff = 107574,
        cooldown = 107574,
        requiredTalent = 17,
        requiredTree = 1,
    })
    
    -- Deadly Calm
    self:newSpell({
        playerbuff = 262228,
        cooldown = 262228,
        requiredTalent = 18,
        requiredTree = 1,
    })

    -- -- Fury
    -- Enrage 
    self:newSpell({
        playerbuff = 184362,
        requiredTree = 2,
    })
 
    -- Bloodthirst
    self:newSpell({
        cooldown = 23881,
        keepIcon = true,
        requiredTree = 2,
    })

    -- Raging Blow
    self:newSpell({
        recharge = 85288,
        keepIcon = true,
        requiredTree = 2,
    })

    -- Execute + Sudden Death
    self:newSpell({
        cooldown = 5308,
        playerbuff = 280721,
        keepIcon = true,
        requiredTree = 2,
    })

    -- Whirlwind + Dragon Roar
    self:newSpell({
        playerbuff = 190411,
        icon = 190411,
        cooldown = 118000,
        requiredTree = 2,
    })

    -- Onslaught
    self:newSpell({
      requiredTree = 2,
      requiredTalent = 9,      
      cooldown = 315720
    })

    -- Recklessness
    self:newSpell({
        playerbuff = 1719,
        cooldown = 1719,
        requiredTree = 2,
    })

    -- Siegebreaker
    self:newSpell({
        cooldown = 280772,
        debuff = 280772,
        requiredTalent = 21,
        requiredTree = 2,
    })

    -- Bladestorm
    self:newSpell({
        playerbuff = 46924,
        cooldown = 46924,
        requiredTalent = 18,
        requiredTree = 2,
    })

    -- -- Protection
    -- Shield Block
    self:newSpell({
      requiredTree = 3,
      recharge = 2565,
      playerbuff = 2565
    })

    -- Ignore Pain
    self:newSpell({
      requiredTree = 3,
      playerbuff = 190456,
      cooldown = 190456,
    })

    -- Slam + Best Served Cold
    self:newSpell({
      requiredTree = 3,
      cooldown = 23922,
    })

    -- Dragon Roar
    self:newSpell({
      requiredTree = 3,
      requiredTalent = 9,
      cooldown = 118000,
    })

    -- Ravager
    self:newSpell({
      requiredTree = 3,
      requiredTalent = 18,
      cooldown = 228920,
    })

    -- Thunder Clap
    self:newSpell({
      requiredTree = 3,
      cooldown = 6343,
      debuff = 6343
    })

    -- Shockwave
    self:newSpell({
      requiredTree = 3,
      cooldown = 46968,
      debuff = 46968,
    })

    -- Demoralizing Shout
    self:newSpell({
      requiredTree = 3,
      cooldown = 1160,
      debuff = 1160,
    })

    -- Spell Reflection
    -- self:newSpell({
    --   requiredTree = 3,
    --   cooldown = 23920,
    --   playerbuff = 23920,
    -- })

    -- Last Stand
    self:newSpell({
      requiredTree = 3,
      cooldown = 12975,
      playerbuff = 12975,
    })

    -- Shield Wall
    self:newSpell({
      requiredTree = 3,
      cooldown = 871,
      playerbuff = 871
    })
end