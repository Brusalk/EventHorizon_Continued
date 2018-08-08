--Preliminary Beast Mastery and Survival BFA bars. Combine later with nponoBegHuk's profile at https://pastebin.com/PJn6xDaf

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 982 -- Revive Pet
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- Beastmaster Bars
  
        -- Barbed Shot
  self:newSpell({
    requiredTree = 1,
	cooldown = 217200,
    recharge = 217200,
	    auraunit = 'pet',
			playerbuff = 272790,
    refreshable = true,
    barcolors = {
      playerbuff  = {171/255, 191/255, 181/255, 0.5},
      recharge  = {255/255, 003/255, 062/255, 0.5}
    },
  })
  
    -- Murder of Crows
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 12,
    debuff = 131894,
    cooldown = 131894,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {029/255, 041/255, 081/255, 0.6}
    }
  })
  
    -- Aspect of the Wild
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 26,
    playerbuff = 193530,
    cooldown = 193530,
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
    requiredLevel = 10,
    cooldown = 34026,
    barcolors = {
      cooldown  = {232/255, 171/255, 131/255, 0.5},
    }
  })
  
    -- Chimaera Shot
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 6,
    cooldown = 53209,
    barcolors = {
      cooldown  = {141/255, 000/255, 242/255, 0.5},
    }
  })


  -- Dire Beast
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 12,
    requiredTalent = 3,
    playerbuff = 217200,
    cooldown = 120679,
    auraunit = 'pet',
    refreshable = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {255/255, 003/255, 062/255, 0.5}
    }
  })


 


  -- Multishot with Titanstrike CD at half height
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 16,
    playerbuff = 115939,
	smallCooldown = true,
    auraunit = 'pet',
    barcolors = {
      cooldown  = {202/255, 161/255, 055/255, 0.5},
      playerbuff  = {136/255, 045/255, 023/255, 0.7}
    }
  })

  -- Barrage
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 17,
    playerbuff = {8936,2},
    cooldown = 120360,
    channel = 120360,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })







  -- Stampede
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 18,
    cooldown = 201430,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
    }
  })
  
  -- Spitting Cobra
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    playerbuff = 194407,
    cooldown = 194407,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {212/255, 020/255, 141/255, 0.6}
    }
  })


  --Marksmanship Bars

  -- Marking Targets with Sentinel CD at half height, if talented.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 20,
    playerbuff = 223138,
    cooldown = 206817,
    smallCooldown = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.7},
      playerbuff  = {255/255, 000/255, 030/255, 0.5}
    }
  })

  -- Hunter's Mark with Windburst CD at half height.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 12,
    debuff = 185987,
    cooldown = 204147,
    smallCooldown = true,
    barcolors = {
      cooldown  = {202/255, 161/255, 055/255, 0.5},
      debuffmine  = {252/255, 088/255, 088/255, 0.7}
    }
  })

  -- Vulnerable with casts and Sidewinders recharge or Piercing Shot CD at half height
  self:newSpell({
    requiredTree = 2,
    debuff = {187131, 2},
    cast = {19434, 204147},
    recharge = 214579,
    cooldown = 198670,
    smallCooldown = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.6},
      recharge  = {171/255, 191/255, 181/255, 0.6},
      debuffmine  = {222/255, 090/255, 131/255, 0.8}
    }
  })

  -- Steady Focus
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 2,
    playerbuff = 193534,
    barcolors = {
      playerbuff  = {240/255, 225/255, 048/255, 0.6}
    }
  })

  -- Lock and Load & Explosive Shot CD at half height
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 4,
    playerbuff = 194594,
    cooldown = 212431,
    smallCooldown = true,
    barcolors = {
      cooldown  = {255/255, 168/255, 018/255, 0.5},
    }
  })

  -- Black Arrow
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 5,
    cooldown = 194599,
    debuff = 194599,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {077/255, 000/255, 141/255, 0.7}
    }
  })

  -- Barrage
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 17,
    playerbuff = {8936,2},
    cooldown = 120360,
    channel = 120360,
    barcolors = {
      casting    = {027/255, 147/255, 228/255, 1.0},
      cooldown  = {171/255, 191/255, 181/255, 0.5}
    }
  })

--[[
  -- Explosive Shot
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 10,
    cooldown = 212431,
    barcolors = {
      cooldown  = {255/255, 168/255, 018/255, 0.5},
    }
  })
--]]

  -- Murder of Crows
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 16,
    debuff = 131894,
    cooldown = 131894,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {029/255, 041/255, 081/255, 0.6}
    }
  })

--[[ included as a half height CD under Hunter's mark above, that was Windburst but I put that on it's onw bar now.
  -- Sentinel
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 11,
    cooldown = 206817,
    debuff = {185987, 6},
    icon = 206817,
    barcolors = {
      cooldown  = {250/255, 245/255, 220/255, 0.5},
      debuffmine  = {054/255, 059/255, 143/255, 0.7}
    }
  })
]]--

  -- Trueshot
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 40,
    cooldown = 193526,
    playerbuff = 193526,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {191/255, 242/255, 232/255, 0.7}
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
