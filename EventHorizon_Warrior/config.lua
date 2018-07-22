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

    -- Sweeping Strikes
    self:newSpell({
        playerbuff = 260708,
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
 
    -- Bloodthirst + Furious Slash
    self:newSpell({
        cooldown = 23881,
        playerbuff = 202539,
        keepIcon = true,
        requiredTree = 2,
    })

    -- Raging Blow + Frothing Berserker
    self:newSpell({
        recharge = 85288,
        playerbuff = 215572,
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
end