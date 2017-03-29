function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 982 -- Revive Pet

  -- Beastmaster Bars

  -- Kill Command
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 10,
    cooldown = 34026,
    barcolors = {
      cooldown  = {232/255, 171/255, 131/255, 0.5},
    }
  })

  -- Dire Beast
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 12,
    requiredTalentUnselected = 5,
    playerbuff = 217200,
    cooldown = 120679,
    auraunit = 'pet',
    refreshable = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {255/255, 003/255, 062/255, 0.5}
    }
  })

  -- Dire Frenzy
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 5,
    playerbuff = 217200,
    cooldown = 217200,
    auraunit = 'pet',
    refreshable = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {255/255, 003/255, 062/255, 0.5}
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

  -- Multishot with Titanstrike CD at half height
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 16,
    cooldown = 207068,
    smallCooldown = true,
    playerbuff = 115939,
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

  -- Murder of Crows
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 16,
    debuff = 131894,
    cooldown = 131894,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {029/255, 041/255, 081/255, 0.6}
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

  -- Stampede
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 19,
    cooldown = 201430,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
    }
  })


  --Marksmanship Bars

  -- Marking Targets
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 20,
    playerbuff = 223138,
    barcolors = {
      playerbuff  = {255/255, 000/255, 030/255, 0.6}
    }
  })

  -- Hunter's Mark with Windburst CD at half height and casts.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 12,
    cast = {19434, 204147},
    debuff = 185987,
    cooldown = 204147,
    smallCooldown = true,
    barcolors = {
      cooldown  = {202/255, 161/255, 055/255, 0.5},
      debuffmine  = {252/255, 088/255, 088/255, 0.7}
    }
  })

  -- Vulnerable & Sidewinders recharge
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 19,
    debuff = {187131, 2},
    recharge = 214579,
    barcolors = {
      recharge  = {171/255, 191/255, 181/255, 0.4},
      debuffmine  = {222/255, 093/255, 131/255, 0.9}
    }
  })

  -- Vulnerable & Piercing Shot CD at half height
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 20,
    debuff = {187131, 2},
    cooldown = 198670,
    smallCooldown = true,
    barcolors = {
      debuffmine  = {222/255, 093/255, 131/255, 0.9}
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

  -- Mongoose Bite/Fury
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 20,
    playerbuff = 190931,
    recharge = 190928,
    barcolors = {
      playerbuff  = {202/255, 020/255, 020/255, 0.6},
      recharge  = {171/255, 191/255, 181/255, 0.4}
    },
  })

  -- Way of the Mok'Nathal
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 3,
    requiredTalentUnselected = 16,
    playerbuff = {201081, 1.5},
    barcolors = {
      playerbuff  = {202/255, 141/255, 101/255, 0.5},
    },
  })

  -- Way of the Mok'Nathal & Butchery recharge.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {3, 16},
    playerbuff = {201081, 1.5},
    recharge = 212436,
    barcolors = {
      playerbuff  = {202/255, 141/255, 101/255, 0.5},
      recharge  = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Way of the Mok'Nathal & Dragonsfire Grenade CD at half height, if both are taken.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {3, 17},
    playerbuff = {201081, 1.5},
    cooldown = 194855,
    smallCooldown = true,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.6},
      playerbuff  = {202/255, 141/255, 101/255, 0.5}
    },
  })

  -- Lacerate with Flanking Strike CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 12,
    cooldown = 202800,
    debuff = {185855, 1},
    smallCooldown = true,
    barcolors = {
      debuffmine  = {030/255, 080/255, 101/255, 0.5},
      cooldown  = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Serpent Sting & A Murder of Crows CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {4, 18},
    debuff = {118253, 3},
    barcolors = {
      debuffmine  = {171/255, 141/255, 070/255, 0.6},
      cooldown  = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Serpent Sting
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {5, 18},
    debuff = {118253, 3},
    barcolors = {
      debuffmine  = {171/255, 141/255, 070/255, 0.6},
    },
  })

  -- Serpent Sting & Snake Hunter CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {6, 18},
    debuff = {118253, 3},
    cooldown = 201078,
    barcolors = {
      debuffmine  = {171/255, 141/255, 070/255, 0.6},
      cooldown  = {171/255, 191/255, 181/255, 0.5},
    },
  })

  -- Butchery
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 16,
    requiredTalentUnselected = 3,
    recharge = 212436,
    barcolors = {
      recharge  = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Caltrops
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 10,
    debuff = {194279, 1},
    cooldown = 194277,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {242/255, 191/255, 030/255, 0.6}
    }
  })

  -- Throwing Axes
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 2,
    recharge = 200163,
    barcolors = {
      recharge  = {000/255, 090/255, 141/255, 0.4}
    },
  })

  -- Explosive Trap
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 50,
    debuff = 13812,
    cooldown = 191433,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {232/255, 111/255, 040/255, 0.6}
    }
  })

  -- Dragonsfire Grenade
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 17,
    requiredTalentUnselected = 3,
    debuff = 194855,
    cooldown = 194855,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {212/255, 050/255, 010/255, 0.6}
    }
  })

  -- A Murder of Crows
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 4,
    requiredTalentUnselected = 3,
    debuff = 131894,
    cooldown = 206505,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {030/255, 040/255, 080/255, 0.6}
    }
  })

  -- Fury of the Eagle
  self:newSpell({
    requiredTree = 3,
    requiredArtifactTalent = 203415,
    cooldown = 203415,
    channel = {203415, 0.5},
    barcolors = {
    cooldown  = {202/255, 161/255, 055/255, 0.9},
    }
  })

  -- Spitting Cobra
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 19,
    playerbuff = 194407,
    cooldown = 194407,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      playerbuff  = {212/255, 020/255, 141/255, 0.6}
    }
  })

  -- Steel Trap
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 12,
    debuff = {162487, 2},
    cooldown = 162488,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
      debuffmine  = {212/255, 111/255, 040/255, 0.6}
    }
  })

  -- Snake Hunter
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 6,
    requiredTalentUnselected = 18,
    cooldown = 201078,
    barcolors = {
      cooldown  = {171/255, 191/255, 181/255, 0.5},
    }
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
    }
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
