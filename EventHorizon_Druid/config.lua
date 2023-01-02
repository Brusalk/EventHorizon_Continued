local usemouseover = true    -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 768 -- Cat Form
  self.config.hastedSpellID = {50769,10} -- Revive
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -1.5
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

-- NOTE: bars appear here in the order of the talent trees
-- which is usually NOT what you want.  You should rearrange
-- them in a more logical order

-- specializations
  local balance = 1
  local feral = 2
  local guardian = 3
  local restoration = 4

-- stances
  local human = 0
  local bear = 1
  local cat = 2
  local travel = 3
  local moonkin = 4
  local flying = 5

-- baseline skills

  -- Barkskin
  self:newSpell({
    cooldown = 22812,
    playerbuff = 22812,
     barcolors = {
     playerbuff  = {141/255, 070/255, 030/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Moonfire with Force of Nature or Warrior of Elune cooldown at half height.
  self:newSpell({
    stance = {human,bear,moonkin,5},
    debuff = {164812,2},
    refreshable = true,
    cooldown = {202425, 205636},
    smallCooldown = true,
     barcolors = {
     debuffmine  = {050/255, 101/255, 252/255, 0.5},
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     },
  })


-- general druid tree skills (with added stuff)

  -- Rake with Feral Frenzy CD at half height if talent chosen.
  self:newSpell({
    requiredTalent = 1822,
    stance = cat,
    debuff = {1822,3},
    refreshable = true,
    cooldown = 274837,
    smallCooldown = true,
     barcolors = {
     cooldown    = {202/255, 161/255, 050/255, 0.5},
     debuffmine  = {191/255, 040/255, 101/255, 0.5}
     },
  })

  -- Frenzied Regen & Earthwarden if talented.
  self:newSpell({
    requiredTalent = 22842,
    stance = bear,
    requiresLevel = 50,
    playerbuff = {{22842}, {203975}},
    recharge = 22842,
     barcolors = {
     playerbuff  = {101/255, 181/255, 141/255, 0.8},
     recharge    = {030/255, 222/255, 040/255, 0.4}
     },
  })

  -- Rejuvenation + Swiftmend
  self:newSpell({
    requiredTalent = 774,
    stance = {0,4},
    playerbuff = {774,3},
    cooldown = 18562,
    smallCooldown = true,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {232/255, 066/255, 202/255, 0.6}
     }
  })

  -- Thrash (cat) plus Brutal Slash recharge
  self:newSpell({
    requiredTalent = 106832,
    stance = cat,
    debuff = {106830,3},
    refreshable = true,
    recharge = 202028,
    barcolors = {
     debuffmine  = {222/255, 128/255, 010/255, 0.5},
     recharge    = {222/255, 171/255, 171/255, 0.4}
    },
  })

  -- Thrash (bear, has CD)
  self:newSpell({
    requiredTalent = 106832,
    stance = bear,
    debuff = {77758,3},
    refreshable = true,
    cooldown = 77758,
    barcolors = {
     debuffmine  = {222/255, 128/255, 010/255, 0.5},
     cooldown    = {222/255, 171/255, 171/255, 0.4}
    },
  })

  -- Rip
  self:newSpell({
    requiredTalent = 1079,
    stance = cat,
    debuff = {1079,2},
    refreshable = true,
    barcolors = {
     debuffmine  = {252/255, 000/255, 060/255, 0.5}
    },
  })

  -- Ironfur with Mighty Bash or Incapacitating roar cooldown at half height.
  self:newSpell({
    requiredTalent = 192081,
    stance = bear,
    playerbuff = 192081,
    cooldown = {5211, 99},
    smallCooldown = true,
    barcolors = {
     playerbuff  = {111/255, 111/255, 151/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
    },
  })
   
  -- Sunfire with Fury of Elune CD at half height if chosen.
  self:newSpell({
    requiredTalent = 93402,
    stance = {0,4},
    debuff = {{93402,2}, {231050,2}},
    refreshable = true,
    cooldown = 202770,
    smallCooldown = true,
    barcolors = {
     debuffmine  = {121/255, 010/255, 000/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Wild Growth
  self:newSpell({
    requiredTalent = 48438,
    stance = human,
    playerbuff = {48438,2},
    cooldown = 48438,
    smallCooldown = true,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
     playerbuff  = {101/255, 181/255, 141/255, 0.8},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
    }
  })

  -- Nature's Vigil
  self:newSpell({
    requiredTalent = 124974,
    stance = {human,bear,cat,moonkin},
    playerbuff = 124974,
    cooldown = 124974,
    barcolors = {
     playerbuff  = {101/255, 181/255, 141/255, 0.8},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
    },
  })

-- Balance bars

  -- New Moon
  self:newSpell({
    requiredTree = balance,
    requiredTalent = 274281,
    stance = {human,moonkin},
    recharge = 274281,
    cast = {274281, 274282, 274283},
     barcolors = {
     recharge    = {202/255, 161/255, 050/255, 0.5},
     },
  })

  -- Solar eclipse w/Wrath cast
  self:newSpell({
    requiredTree = balance, 
    stance = {human,moonkin},
    cast = 190984,
    icon = 48517,
    playerbuff = 48517,
    refreshable = true,
     barcolors = {
     playerbuff  = {121/255, 010/255, 000/255, 0.6}
     },
  })

  -- Lunar eclipse w/Sunfire cast
  self:newSpell({
    requiredTree = balance,
    stance = {human,moonkin},
    cast = 194153,
    icon = 48518,
    playerbuff = 48518,
    refreshable = true,
     barcolors = {
     playerbuff  = {050/255, 101/255, 252/255, 0.6}
     },
  })

  -- Stellar Flare
  self:newSpell({
    requiredTree = balance,
    requiredTalent = 202347,
    stance = {human,moonkin},
    debuff = {202347,2},
    refreshable = true,
     barcolors = {
     debuffmine  = {111/255, 222/255, 232/255, 0.6}
     },
  })

  -- Starlord
  self:newSpell({
    requiredTree = balance,
    requiredTalent = 202345,
    stance = {human,moonkin},
    playerbuff = 202345,
    refreshable = true,
  })

  -- Balance of all Things
  self:newSpell({
    requiredTree = balance,
    requiredTalent = 394048,
    stance = {human,moonkin},
    playerbuff = 394048,
    refreshable = true,
  })

  -- Starfall  -- Not really sure if this needs to be tracked as the spell area is very obvious and the buff only affects targets within it.
  self:newSpell({
    requiredTree = balance,
    requiredTalent = 191034,
    stance = {human,moonkin},
    playerbuff = 191034,
    refreshable = true,
  })

  -- Wild Mushroom
  self:newSpell({
    requiredTree = balance,
    requiredTalent = 88747,
    stance = {human,moonkin},
    recharge = 88747,
    debuff = 81281,
     barcolors = {
     debuffmine  = {096/255, 160/255, 000/255, 0.6},
     },
  })

  -- Celestial Alignment
  self:newSpell({
    requiredTree = balance,
    requiredTalent = 194223,
    requiredTalentUnselected = 394013,
    stance = {human,moonkin},
    cooldown = 194223,
    playerbuff = 194223,
     barcolors = {
     playerbuff  = {060/255, 121/255, 212/255, 0.9},
     recharge    = {030/255, 131/255, 060/255, 0.4}
     },
  })

  -- Incarnation: Chosen of Elune
  self:newSpell({
    requiredTree = balance,
    requiredTalent = 394013,
    stance = {human,moonkin},
    cooldown = 394013,
    playerbuff = 394013,
     barcolors = {
     playerbuff  = {060/255, 121/255, 212/255, 0.9},
     recharge    = {030/255, 131/255, 060/255, 0.4}
     },
  })

  -- Convoke the Spirits CD
--[[
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 391528,
    stance = {0,1,2,4},
    cooldown = 391528,
  })
]]

-- Feral bars

  -- Moonfire in cat form, only with talent
  self:newSpell({
    requiredTree = feral,
    requiredTalent = 155580,
    stance = cat,
    debuff = {155625,2},
    refreshable = true,
    barcolors = {
     debuffmine  = {050/255, 100/255, 255/255, 0.5}
    },
  })

  -- Bloodtalons + convoke CD
  self:newSpell({
    requiredTree = feral,
    requiredTalent = 319439,
    stance = cat,
    cooldown = 391528,
    playerbuff = 319439,
    barcolors = {
     playerbuff  = {030/255, 131/255, 000/255, 0.5}
    },
  })

  -- Tiger's Fury
  self:newSpell({
    requiredTree = feral,
    stance = cat,
    cooldown = 5217,
    playerbuff = {5217, 6},
     barcolors = {
     playerbuff  = {252/255, 232/255, 090/255, 0.6},
     cooldown    = {252/255, 232/255, 090/255, 0.4}
    },
  })

  -- Berserk
  self:newSpell({
    requiredTree = feral,
    requiredTalent = 106951,
    requiredTalentUnselected = 102543,
    stance = cat,
    cooldown = 106951,
    playerbuff = 106951,
  })

  -- Incarnation
  self:newSpell({
    requiredTree = feral,
    requiredTalent = 102543,
    stance = cat,
    cooldown = 102543,
    playerbuff = 102543,
  })

  -- Adaptive Swarm
  self:newSpell({
    requiredTree = feral,
    requiredTalent = 391888,
    stance = cat,
    cooldown = 391888,
    debuff = {391889, 3},
    barcolors = {
     debuffmine  = {000/255, 096/255, 144/255, 0.6},
     cooldown = {224/255, 224/255, 224/255, 0.4},
    },
  })

  -- Omen/Moment of Clarity & Survival Instinct recharge
  self:newSpell({
    requiredTree = feral,
    requiredTalent = 16864,
    stance = cat,
    playerbuff = 135700,
    icon = 135700,
    cooldown = 61336,
     barcolors = {
     playerbuff  = {040/255, 090/255, 191/255, 0.6},
     recharge    = {232/255, 161/255, 101/255, 0.3}
    }
  })


-- Guardian bars

  -- Mangle
  self:newSpell({
    requiredTree = guardian,
    stance = bear,
    cooldown = 33917,
    playerbuff = {{93622}, {213708}},
    barcolors = {
     playerbuff  = {240/255, 000/255, 000/255, 0.3},
     debuffmine  = {190/255, 040/255, 100/255, 0.5},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Survival Instincts
  self:newSpell({
    requiredTree = {feral,guardian},
    requiredTalent = 61336,
    stance = {bear,cat},
    recharge = 61336,
    playerbuff = 61336,
     barcolors = {
     playerbuff  = {232/255, 161/255, 101/255, 0.6},
     recharge    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Berserk
  self:newSpell({
    requiredTree = guardian,
    requiredTalentUnselected = 102558,
    stance = bear,
    cooldown = 50334,
    playerbuff = 50334,
  })

  -- Incarnation: Guardian of Ursoc
  self:newSpell({
    requiredTree = guardian,
    requiredTalent = 102558,
    stance = bear,
    cooldown = 102558,
    playerbuff = 102558,
     barcolors = {
     playerbuff  = {150/255, 000/255, 150/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Rage of the Sleeper
  self:newSpell({
    requiredTree = guardian,
    requiredTalent = 200851,
    stance = bear,
    cooldown = 200851,
    playerbuff = 200851,
  })


-- Restoration bars
  -- Redisign to show only the offensive spells as this looks like it will be more important in Shadowlands and I'm not aware of any healer who isn't tracking their HoT's on their party/raid frames.
  -- Longer healing CD shown at the end in increasing duration order, CD > 90 seconds not shown by default.
  -- If you'd like to return to the old design please ask in the Discord server for help if you can't do it yourself.

  -- Note that there are two, or more, entries for the same spell for many of these bars, this is to have them show up in the correct stances with or without Balance Affinity taken. Additionally there will be a few players out there who prefer to be a treant, all this effort was for you.

  -- Moonfire with spell casts (like a cast bar) and Wild Growth CD at half height.
  self:newSpell({
    requiredTree = 4,
    stance = {0,4,5},
    requiredLevel = 2,
    debuff = {164812,2},
    refreshable = true,
    cast = {339, 2637, 5176, 8936, 20484, 33786, 48438, 197626, 197628},
    cooldown = 48438,
    smallCooldown = true,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {050/255, 100/255, 255/255, 0.5}
     },
  })

  -- Sunfire with Swiftmend CD at half height.
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredLevel = 23,
    debuff = {164815,2},
    refreshable = true,
    cooldown = 18562,
    smallCooldown = true,
    icon = 164815,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {121/255, 010/255, 000/255, 0.6}
     },
  })

  -- Healing CD
  -- Cenarion Ward
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredTalent = 3,
    cooldown = 102351,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
    }
  })

  -- Cenarion Ward
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = {3,7},
    cooldown = 102351,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     }
  })

  -- Overgrowth
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalent = 18,
    requiredTalentUnselected = 7,
    cooldown = 203651,
    barcolors = {
     cooldown    = {171/255, 222/255, 181/255, 0.6},
     }
   })

  -- Overgrowth
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 18,
    cooldown = 203651,
    barcolors = {
     cooldown    = {171/255, 222/255, 181/255, 0.6},
     }
   })

  -- Nature's Swiftness
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredLevel = 58,
    requiredTalentUnselected = 7,
    cooldown = 102351,
  })

  -- Nature's Swiftness
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredLevel = 58,
    requiredTalent = {3,7},
    cooldown = 102351,
  })

  -- Ironbark
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredLevel = 12,
    cooldown = 102342,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     }
  })

  -- Ironbark
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    cooldown = 102342,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     }
  })

  -- Flourish
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalent = 21,
    requiredTalentUnselected = 7,
    cooldown = 197721,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     }
  })

  -- Flourish
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalent = {7,21},
    cooldown = 197721,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     }
  })

--[[ HoT tracking bars, delete this line and the second last to have them show.
  -- The first spell bar is for Lifebloom. This huge note is so you can get Lifebloom to track your focus frame. As many healers, especially in a dungeon group, will set the tank as their focus so this seemed like a good addition however the default is the same mouseover behaviour as the other spells. Just change the comment markers "--" on the auraunit lines. Do this for the both "Lifebloom + Wild Growth CD" spell bars, I know that seemes excessive but it's the only way I could make it work for people who like being a Treant while healing and sometimes have Balance affinity.

  -- Lifebloom + Wild Growth CD, cast and HT cast
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredLevel = 21,
    cast = 48438,
    playerbuff = {33763,1},
    auraunit = usemouseover and 'mouseover' or 'target',
--    auraunit = 'focus',
    refreshable = true,
    icon = 33763,
    cooldown = 48438,
    smallCooldown = true,
     barcolors = {
     casting     = {252/255, 121/255, 000/255, 0.8},
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {099/255, 232/255, 121/255, 0.5}
     }
  })

  -- Lifebloom + Wild Growth CD, cast and HT cast
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    cast = 48438,
    playerbuff = {33763,1},
    auraunit = usemouseover and 'mouseover' or 'target',
--    auraunit = 'focus',
    refreshable = true,
    icon = 33763,
    cooldown = 48438,
    smallCooldown = true,
     barcolors = {
     casting     = {252/255, 121/255, 000/255, 0.8},
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {099/255, 232/255, 121/255, 0.5}
     }
  })

  -- Rejuvenation + Swiftmend
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredLevel = 10,
    requiredTalentUnselected = 7,
    requiredLevel = 10,
    playerbuff = {774,3},
    cooldown = 18562,
    smallCooldown = true,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {232/255, 066/255, 202/255, 0.6}
     }
  })

  -- Germination
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredTalent = 20,
    playerbuff = {155777,3},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
     barcolors = {
     playerbuff  = {171/255, 066/255, 202/255, 0.7}
     }
  })

  -- Germination
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = {7,20},
    requiredLevel = 10,
    playerbuff = {155777,3},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
     barcolors = {
     playerbuff  = {171/255, 66/255, 202/255, 0.7}
     }
  })

  -- Regrowth
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredLevel = 3,
    requiredTalentUnselected = 7,
    cooldown = 197721,
    cast = 8936,
    recast = true,
    playerbuff = {8936,2},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    smallCooldown = true,
     barcolors = {
     casting     = {252/255, 121/255, 000/255, 0.8},
     cooldown    = {202/255, 161/255, 055/255, 0.9},
     playerbuff  = {022/255, 212/255, 055/255, 0.4}
     }
  })

  -- Regrowth
  self:newSpell({
    requiredTree = 4,
    stance = {0,4,5},
    requiredTalent = 7,
    cooldown = 197721,
    cast = 8936,
    recast = true,
    playerbuff = {8936,2},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    smallCooldown = true,
     barcolors = {
     casting     = {161/255, 121/255, 000/255, 0.8},
     cooldown    = {202/255, 161/255, 055/255, 0.9},
     playerbuff  = {022/255, 212/255, 055/255, 0.4}
    }
  })

  -- Cenarion Ward
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredTalent = 3,
    playerbuff = {{102351}, {102352,2}},
    cooldown = 102351,
    auraunit = usemouseover and 'mouseover' or 'target',
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {151/255, 171/255, 090/255, 0.7}
    }
  })

  -- Cenarion Ward
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = {3,7},
    playerbuff = {{102351}, {102352,2}},
    cooldown = 102351,
    auraunit = usemouseover and 'mouseover' or 'target',
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {151/255, 171/255, 090/255, 0.7}
     }
  })

  -- Omen of Clarity / Moment of Clarity and Innervate cooldown.
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredLevel = 33,
    cooldown = 29166,
    playerbuff = 16870,
    smallCooldown = true,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {040/255, 090/255, 191/255, 0.5}
     }
  })

  -- Omen of Clarity / Moment of Clarity and Innervate cooldown.
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    requiredLevel = 33,
    cooldown = 29166,
    playerbuff = 16870,
    smallCooldown = true,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {040/255, 090/255, 191/255, 0.5}
     }
  })

  -- Tranquility
  self:newSpell({
    requiredTree = 4,
    requiredLevel = 37,
    channel = 740,
    cooldown = 740,
    playerbuff = 740,
  })

  -- Innervate
  self:newSpell({
    requiredTree = 4,
    requiredLevel = 42,
    cooldown = 29166,
  })

  -- Incarnation: Tree of Life
  self:newSpell({
    requiredTree = 4,
    requiredTalent = 15,
    cooldown = 33891,
    playerbuff = 117679,
  })

]]

end
