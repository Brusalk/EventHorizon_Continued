function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 982 -- Revive Pet

  --MARKSMANSHIP
  
  -- Vulnerable
  self:newSpell({
    debuff = 187131, 
    requiredLevel = 18,
    requiredTree = 2,
  })

  -- Marking Targets
  self:newSpell({
    playerbuff = 223138, 
    requiredLevel = 18,
    requiredTree = 2,
  })

  -- Aimed shot
  self:newSpell({
    cast = 19434,
    requiredTree = 2,
  })

  -- Trueshot
  self:newSpell({
    cooldown = 193526,
    playerbuff = 193526,
    requiredLevel = 40,
    requiredTree = 2,
  })


  -- MARKSMANSHIP TALENTS

  -- Level 30 Talents

  -- Lock and Load
  self:newSpell({
      playerbuff = 194594,
      requiredTree = 2, 
      requiredTalent = 4,
  })

  -- Black Arrow
  self:newSpell({
    cooldown = 194599,
    debuff = 194599, -- double-check
    requiredTree = 2, 
    requiredTalent = 5,
  })


  -- Level 60 Talents

  -- Explosive Shot
  self:newSpell({
    cooldown = 212431,
    requiredTree = 2, 
    requiredTalent = 10,
  })


  -- Level 90 Talents

  -- Barrage
  self:newSpell({
    cooldown = 120360,
    channel = 120360,
    requiredTree = 2, 
    requiredTalent = 17,
  })

  -- Level 100 Talents

  -- Sidewinders
  self:newSpell({
    cooldown = 214579,
    requiredTree = 2, 
    requiredTalent = 19,
  })

  -- Piercing Shot
  self:newSpell({
    cooldown = 198670,
    requiredTree = 2, 
    requiredTalent = 20,
  })

  -- Level 15 Talents

  -- Steady Focus
  self:newSpell({
      playerbuff = 193534,
      requiredTree = 2,
      requiredTalent = 2,
  })

end