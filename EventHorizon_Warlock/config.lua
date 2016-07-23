function EventHorizon:InitializeClass()
    self.config.gcdSpellID = 17962
    self.config.hastedSpellID = {6201, 3} -- Create Healthstone
    
    --** Demonology **--
    -- Doom
    self:newSpell({
        debuff = {603, 15},
        refreshable = true,
        hasted = false,
        requiredTree = 2,
    })
    
    -- Call Dreadstalkers
    self:newSpell({
        cast = 104316,
        cooldown = 104316,
        requiredTree = 2,
    })
    
    -- darkglare
    self:newSpell({
        cast = 205180,
        cooldown = 205180,
        requiredTree = 2,
        requiredTalent = 19,
    })
    
    -- shadowbolt
    self:newSpell({
        cast = {157695, 686, 105174, 193396},
        requiredTree = 2,
    })
    
    -- shadowflame
    self:newSpell({
        debuff = 145551,
        cast = 145551,
        refreshable = true,
        cooldown = 145551,
        requiredTree = 2,
        requiredTalent = 2,
    
    })
    
    
    -- *** Affliction *** --
    -- Unstable Affliction
    self:newSpell({
        cast = 30108,
        debuff = {30108, 2},
        refreshable = true,
        requiredTree = 1,
    })
    
    -- Agony
    self:newSpell({
        debuff = {980, 2},
        refreshable = true,
        requiredTree = 1,
        requiredLevel = 36,
    })
    
    -- [Seed of] Corruption
    self:newSpell({
        debuff = {{172, 2}, {27243, 2}},
        icon = 172,
        cast = 27243,
        refreshable = true,
        requiredLevel = 3,
        requiredTree = 1,
    })
    
    --Siphon Life
    self:newSpell({
        cast = 63106,
        debuff = {63106, 3},
        hasted = true,
        recast = true,
        requiredTree = 1,
        requiredTalent = 10,
    })
    
    -- Haunt
    self:newSpell({
        cast = 48181,
        cooldown = 48181,
        requiredTree = 1,
        requiredTalent = 1,
    })
    
    --Drain Soul Life
    self:newSpell({
        channel = {{198590, 6}, {689, 6}},
        hasted = true,
        requiredTree = 1,
    })
    
    -- Phantom Singularity
    self:newSpell({
        debuff = {205179, 2},
        cooldown = 205179,
        refreshable = false,
        hasted = false,
        requiredTree = 1,
        requiredTalent = 20,
    })
    

    -- *** Destruction *** --
    --Immolate
    self:newSpell({
        cast = 348,
        debuff = {348, 3},
        recast = true,
        requiredTree = 3,
    })
    
    --Conflag/backdraft/incinerate/chaos bolt
    self:newSpell({
        playerbuff = 117828,
        cooldown = 17962,
        cast = {116858, 29722, 5740},
        channeled = {689, 6},
        icon = 17962,
        requiredTree = 3,
    })
    
    -- Chaos Bolt/Eradication
    self:newSpell({
        debuff = 196414,
        requiredTree = 3,
        requiredTalent = 10,
    })
    
    -- Channel Demonfire
    self:newSpell({
        cooldown = 196447,
        hasted = true,
        channeled = {196447, 15},
        requiredTree = 3,
        requiredTalent = 20,
    })
    
    --Havoc
    self:newSpell({
        debuff = {80240, 0},
        cooldown = 80240,
        requiredTree = 3,
    })
    
    --Mana Tap (BLIZZARD PLEASE REMOVE, FOR THE LOVE OF GOD)
    self:newSpell({
        playerbuff = 196104,
        requiredTree = 3,
        requiredTalent = 6,
    })
    
    -- Cata
    self:newSpell({
        cast = 152108,
        cooldown = 152108,
        requiredTree = 3,
        requiredTalent = 6,
    })
    
    -- Soul Harvest
    self:newSpell({
        cast = 196098,
        cooldown = 196098,
        requiredTree = {1, 2, 3},
        requiredTalent = 12,
    })
    
    -- GrimService
    self:newSpell({
        cooldown = 111859,
        requiredTree = {1, 2, 3},
        requiredTalent = 17,
    })
    
    -- Summon Doomguard/Infernal
    self:newSpell({
        cooldown = {18540, 1122},
        requiredTree = {1, 2, 3},
    })

end