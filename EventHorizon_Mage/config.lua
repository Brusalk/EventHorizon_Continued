function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 118 -- Polymorph
  self.config.hastedSpellID = {118,1.7}
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12
  
  -- Arcane
    
    -- Nether Tempest
    self:newSpell({
      debuff = {114923, 1},
      requiredTalent = 16,
      requiredTree = 1,
     })
  
    -- Arcane Blast/Arcane Charges
    self:newSpell({
      cast = 30451,
      requiredTree = 1,
    })
    
    
    -- Arcane Barrage/Arcane Missles/Arcane Missiles!
    self:newSpell({
      cooldown = 44425,
      playerbuff = 79683,
      channel = {5143, 5},
      requiredTree = 1,
    })
    
    -- Aluneth
    self:newSpell({
      cast = 224968,
      cooldown = 224968,
      requiredTree = 1
    })
    
    -- Arcane Orb
    self:newSpell({
      cooldown = 153626,
      requiredTalent = 21,
      requiredTree = 1,
    })
    
    -- Supernova
    self:newSpell({
      cooldown = 157980,
      requiredTalent = 10,
      requiredTree = 1,
    })
    
    -- Presence of Mind
    self:newSpell({
      cooldown = 205025,
      playerbuff = 205025,
      requiredTree = 1
    })
    
    --Arcane Power
    self:newSpell({
      cooldown = 12042,
      playerbuff = 12042,
      requiredTree = 1,
    })
    
    -- Evocate
    self:newSpell({
      channel = {12051, 3},
      cooldown = 12051,
      requiredTree = 1,
    })
    
    -- Mirror Image
    self:newSpell({
      cooldown = 55342,
      requiredTalent = 7,
      requiredTree = 1
    })
    
    -- Rune of Power
    self:newSpell({
      cooldown = 116011,
      requiredTalent = 8,
      requiredTree = 1,
      playerbuff = 116011
    })
    
    -- Charged Up
    self:newSpell({
      cooldown = 205032,
      requiredTalent = 11,
      requiredTree = 1
    })
      
  
  -- --Fire
  
    -- --[[
    -- 48107 -- Heating Up
    -- 108853 -- Inferno Blast
    -- 11129 -- Combustion
    -- 11366 -- Pyroblast (3 secs)
    -- 48108 -- Pyroblast! (proc)
    -- 12564 -- ignite
    -- --]]
    
    -- Combustion
    self:newSpell({
      cooldown = 190319,
      buff = 190319,
      requiredTree = 2,
    })
        
    -- Pyroblast! and Heating Up
    self:newSpell({
      playerbuff = {{48107,0},{48108,0}},
      requiredTree = 2,
    })
  
    -- casts/Inferno Blast/ignite
    self:newSpell({
      cast = {133,11366,108853},
      debuff = {12654,1},
      cooldown = 108853,
      icon = 108853,
      requiredTree = 2,
    })
         
    -- Blast Wave
    self:newSpell({
      cooldown = 157981,
      requiredTalent = 10,
      requiredTree = 2,
    })
    
    -- Meteor
    self:newSpell({
      cooldown = 153561,
      requiredTalent = 21,
      requiredTree = 2,
    })
    
    -- Cinderstorm
    self:newSpell({
      cooldown = 198292,
      cast = 198292,
      requiredTalent = 20,
      requiredTree = 2,
    })
    
    -- Living Bomb
    self:newSpell({
      debuff = {44457, 3},
      requiredTalent = 16,
      requiredTree = 2,
    })
        
  -- -- Frost --
    -- -- Frost Bomb
    -- self:newSpell({
      -- cast = 112948,
      -- debuff = {112948, 0},
      -- requiredTalent = 13,
      -- requiredTree = 3
    -- })
  
    -- --Pet Freeze/Water Jet/frost bolt
    -- self:newSpell({
      -- cast = 116,
      -- cooldown = 135029,
      -- channel = {135029, 1},
      -- requiredTree = 3,
    -- })

    -- --Finger of Frost/Ice Orb
    -- self:newSpell({
      -- playerbuff = 44544,
      -- cooldown = 84714,
      -- requiredTree = 3,
    -- })
    
    -- --Brain Freeze/icy Veins
    -- self:newSpell({
      -- cooldown = 12472,
      -- playerbuff = 57761,
      -- requiredTree = 3,
    -- })
  
  
  -- -- Mage Talents
    -- -- Ice Nova
    -- self:newSpell({
      -- cooldown = 157997,
      -- requiredTalent = 15,
      -- requiredTree = 3,
    -- })

    -- -- Comet Storm
    -- self:newSpell({
      -- cooldown = 153595,
      -- requiredTalent = 21,
      -- requiredTree = 3,
    -- })

    -- -- Mirror Image
    -- self:newSpell({
      -- cooldown = 55342,
      -- requiredTalent = 16,
    -- })
    
    -- -- Prismatic Crystal
    -- self:newSpell({
      -- cooldown = 152087,
      -- requiredTalent = 20,
    -- })  
end