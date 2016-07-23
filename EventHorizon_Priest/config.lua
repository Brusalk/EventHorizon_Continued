local usemouseover = true -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.
function EventHorizon:InitializeClass()
    self.config.gcdSpellID = 528 -- dispel magic
    self.config.hastedSpellID = {2006, 10}-- Resurrection
    
    --ShadowPriest
    -- VT
    self:newSpell({
        debuff = {34914, 3},
        cast = 34914,
        refreshable = true,
        hasted = true,
        recast = true,
        requiredTree = 3,
    })
    
    -- Shadow Word: Pain
    self:newSpell({
        debuff = {589, 3},
        hasted = true,
        refreshable = true,
        requiredTree = 3,
        requiredLevel = 4,
    })
    
    -- Mind Blast
    self:newSpell({
        cast = 8092,
        cooldown = 8092,
        requiredTree = 3,
    })
    
    -- Mind Flay/Mind spike
    self:newSpell({
        channel = {15407, 3},
        cast = 73510,
        debuff = {2944, 1},
        requiredTree = 3,
    })
    
    -- Void bolt/Void eruption
    self:newSpell({
        cast = {228260, 205448},
        cooldown = {228260, 205448},
        requiredTree = 3,
        icon = 228260,
    })
    -- Sw: Void
    self:newSpell({
        cast = 205351,
        cooldown = 205351,
        requiredTree = 3,
        requiredTalent = 3,
    })
    
    -- Shadow Crash
    self:newSpell({
        cast = 205385,
        cooldown = 205385,
        requiredTree = 3,
        requiredTalent = 17,
    
    })
    
    
    -- Mind bender/ombrefiel
    self:newSpell({
        cooldown = {200174, 34433},
        requiredTree = 3,
    })
    
    -- SW:death
    self:newSpell({
        cooldown = 199911,
        requiredTree = 3,
    })
    
    
    -- Holy
    --Renew
    self:newSpell({
        playerbuff = 139,
        auraunit = target and 'mouseover' or 'target',
        refreshable = true,
        hasted = true,
        requiredTree = 2,
    })
    
    --PoM
    self:newSpell({
        cooldown = 33076,
        requiredTree = 2,
        auraunit = target and 'mouseover' or 'target',
    })
    
    -- Holy word : Serenity
    self:newSpell({
        cooldown = 2050,
        requiredTree = 2,
    
    })
    -- Holy word: Sanctify
    self:newSpell({
        cooldown = 34861,
        requiredTree = 2,
    })
    
    -- Circle of healing
    self:newSpell({
        cooldown = 204883,
        requiredTree = 2,
        requiredTalent = 21,
    })
    
    --Halo
    self:newSpell({
        cast = 120517,
        cooldown = 120517,
        requiredTree = 2,
        requiredTalent = 18,
    
    })
    
    -- Divine star
    self:newSpell({
        cooldown = 110744,
        requiredTree = 2,
        requiredTalent = 17,
    
    })
    
    
    -- Discipline
    -- Penance
    self:newSpell({
        cast = 47540,
        cooldown = 47540,
        requiredTree = 1,
    
    })
    -- purge of the wicked
    self:newSpell({
        debuff = 204213,
        refreshable = true,
        hasted = true,
        requiredTree = 1,
        requiredTalent = 19,
    
    })
    
    -- power World:Shield
    self:newSpell({
        cooldown = 17,
        requiredTree = 1,
    
    })
    
    -- Schism
    self:newSpell({
        cast = 214621,
        cooldown = 214621,
        requiredTree = 1,
        requiredTalent = 3,
    
    })
    
    -- Power word: Solace
    self:newSpell({
        cooldown = 129250,
        requiredTree = 1,
        requiredTalent = 10,
    
    })
    
    -- Mindbender
    self:newSpell({
        cooldown = 123040,
        requiredTree = 1,
        requiredTalent = 12,
    
    })
    
    --Halo
    self:newSpell({
        cast = 120517,
        cooldown = 120517,
        requiredTree = 1,
        requiredTalent = 18,
    
    })
    
    -- Divine star
    self:newSpell({
        cooldown = 110744,
        requiredTree = 1,
        requiredTalent = 17,
    
    })
    
    -- Atonement
    self:newSpell({
        playerbuff = 194384,
        auraunit = target and 'mouseover' or 'target',
        refreshable = true,
        requiredTree = 1,
    
    })

end
