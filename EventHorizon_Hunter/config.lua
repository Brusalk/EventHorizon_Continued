-- Preliminary bars for BM, MM and SV hunter. 
-- BM and MM functional, some talents that are less used may not be accounted for 
-- SV still in Shadowlands state

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 982 -- Revive Pet
    self.config.hastedSpellID = 982 -- Revive Pet
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12
  
  -- specializations
  local bm = 1
  local mm = 2
  local sv = 3
  
    -- Beastmaster Bars
  
        -- Barbed Shot
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 217200,
    playerbuff = {272790, 1.6 },
    recharge = 217200,
    auraunit = 'pet',
    refreshable = true,
    barcolors = {
      cooldown  = {255/255, 003/255, 062/255, 0.5},
      playerbuff  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
    -- Murder of Crows
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 131894,
    debuff = 131894,
    cooldown = 131894,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {029/255, 041/255, 081/255, 0.6}
    }
  })
  
      -- Bloodshed
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 321530, 
    debuff = 321538, 
    cooldown = 321530,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {029/255, 041/255, 081/255, 0.6}
    }
  })
  
    -- Aspect of the Wild
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 183530,
    playerbuff = 193530,
    cooldown = 193530,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {000/255, 141/255, 003/255, 0.7}
    }
  })
  
      -- Call of the Wild
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 359844,
    playerbuff = 359844,
    cooldown = 359844,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {000/255, 141/255, 003/255, 0.7}
    }
  })
  
    -- Bestial Wrath
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 40,
    playerbuff = 19574,
    cooldown = 19574,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {171/255, 000/255, 040/255, 0.7}
    }
  })

  -- Kill Command
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 34026,
	    debuff = {260309, 1.6 },
	recharge = 34026,
    refreshable = true,
	icon = 34026,
    barcolors = {
      cooldown  = {232/255, 171/255, 131/255, 0.5},
	  debuffmine = {232/255, 171/255, 131/255, 0.5}
    }
  })

  -- Dire Beast
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 120679,
    playerbuff = 281036,
    cooldown = 120679,
    refreshable = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {255/255, 003/255, 062/255, 0.5}
    }
  })
  
      -- Wailing
  self:newSpell({
    requiredTree = 1,
	requiredTalent = 392060,
    cooldown = 392060,
    cast = 392060,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5},
    }
  })
 
  -- Multishot with Beast Cleave
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 2643,
    playerbuff = 115939,
	smallCooldown = true,
    auraunit = 'pet',
    barcolors = {
      cooldown  = {202/255, 161/255, 055/255, 0.5},
      playerbuff  = {136/255, 045/255, 023/255, 0.7}
    }
  })

  -- Stampede
  self:newSpell({
    requiredTalent = 201430,
    cooldown = 201430,
	debuff = 201594,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
	  debuffmine  = {029/255, 041/255, 081/255, 0.6}
    }
  })


  --Marksmanship Bars
  
        -- Double Tap
  self:newSpell({
    requiredTree = 2,
	requiredTalent = 260402,
    cooldown = 260402,
    playerbuff = 260402,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })

            -- Aimed Shot with Steady Shot
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 19434,
	   playerbuff = 194594,
    recharge = 19434,
	cast = {19434, 56641 },
    barcolors = {
      casting  = {255/255, 003/255, 062/255, 0.5},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
      -- Rapid Fire
  self:newSpell({
    requiredTree = 2,
	requiredTalent = 257044,
    playerbuff = {257044,0.24},
    cooldown = 257044,
    channel = 257044,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
    -- Precise Shots
  self:newSpell({
    requiredTree = 2,
	requiredTalent = 260240,
    playerbuff = {260242, 1.6 },
    barcolors = {
      playerbuff  = {212/255, 020/255, 141/255, 0.6}
    }
  })

  -- Steady Focus with Steady Shot CD
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 193533,
    playerbuff = {193533, 1.6 },
	cast = 56641,
    barcolors = {
	  casting  = {171/255, 191/255, 181/255, 0.7},
      playerbuff  = {240/255, 225/255, 048/255, 0.6}
    }
  })

      -- Volley
  self:newSpell({
    requiredTree = 2,
	requiiredTalent = 260243,
    cooldown = 260243,
    playerbuff = 257622,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
    -- Barrage
  self:newSpell({
    requiredTalent = 120360,
    playerbuff = {8936,2},
    cooldown = 120360,
    channel = 120360,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
  -- Explosive Shot
  self:newSpell({
	requiredTalent = 212431,
    cooldown = 212431,
    debuff = 212431,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
  -- Steel Trap
  self:newSpell({
	requiredTalent = 162488,
    cooldown = 162488,
    debuff = 162488,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
  -- Wailing Arrow
  self:newSpell({
	requiredTree = 2,
    requiredTalent = 392060,
	cooldown = 392060,
	cast = 392060,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5},
    }
  })

  -- Trueshot
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 288613,
    cooldown = 288613,
    playerbuff = 288613,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {191/255, 242/255, 232/255, 0.7}
    }
  })

      -- Death Chakrams
  self:newSpell({
    requiredTalent = 375891,
    cooldown = 375891,
    debuff = 375891,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })

      -- Sentinel Owl
  self:newSpell({
    requiredTalent = 388045,
    cooldown = 388045,
    playerbuff = {375891, 388056, 388057},
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
      -- Chimera Shot
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 342049,
    cooldown = 342049,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })
  
  
  
 -- Survival Bars

  -- Serpent Sting
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 20,
    cooldown = 259491,
    debuff = {259491, 1.6},
	refreshable = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {000/255, 141/255, 003/255, 0.7}
    },
  })
  
      -- Kill Command
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 10,
    cooldown = 259489,
	recharge = 259489,
    barcolors = {
      cooldown  = {232/255, 171/255, 131/255, 0.5},
	  recharge  = {171/255, 191/255, 181/255, 0.6}
    },
  })
  
    -- Wildfire Bomb
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 20,
    cooldown = 259495,
    debuff = 259495,
	recharge = 259495,
	refreshable = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {212/255, 020/255, 141/255, 0.6},
	   recharge  = {171/255, 191/255, 181/255, 0.6}
    },
  })
  
    -- Coordinated Assault
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 40,
    playerbuff = 266779,
    cooldown = 266779,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {090/255, 080/255, 090/255, 0.8}
    },
  })

  -- Aspect of the Eagle
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 40,
    playerbuff = 186289,
    cooldown = 186289,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {090/255, 080/255, 090/255, 0.8}
    },
  })
  
        -- Carve
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 10,
    cooldown = 187708,
    barcolors = {
      cooldown  = {232/255, 171/255, 131/255, 0.5},
    },
  })

  --Utility traps are hidden by default, you can choose to enable them by removing the comment brackets
--[[
  -- Tar Trap
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 36,
    requiredTalentUnselected = 10,
    debuff = 135299,
    cooldown = 187698,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {080/255, 111/255, 070/255, 0.6}
    }
  })

  -- Freezing Trap
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 18,
    requiredTalentUnselected = 12,
    debuff = 3355,
    cooldown = 187650,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {101/255, 050/255, 232/255, 0.6}
    }
  })
--]]

end
