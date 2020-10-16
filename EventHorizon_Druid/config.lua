local usemouseover = true    -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 768 -- Cat Form
  self.config.hastedSpellID = {50769,10} -- Revive
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -1.5
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12


  -- Mangle in bear form - Guardian Affinity no longer required after 9.0 patch.
  self:newSpell({
    requiredTree = 2,
    stance = 1,
    cooldown = 33917,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

-- Balance bars

  -- New Moon
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredTalent = 21,
    recharge = 274281,
    cast = {274281, 274282, 274283},
     barcolors = {
     recharge    = {202/255, 161/255, 050/255, 0.5},
     },
  })

  -- Moonfire with Force of Nature or Warrior of Elune cooldown at half height.
  self:newSpell({
    requiredTree = 1,
    stance = {0,4,5},
    requiredLevel = 2,
    cast = {339, 2637, 5176, 8936, 20484, 33786, 48438, 197626, 197628},
    debuff = {164812,2},
    refreshable = true,
    cooldown = {202425, 205636},
    smallCooldown = true,
     barcolors = {
     debuffmine  = {050/255, 101/255, 252/255, 0.5},
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     },
  })

  -- Sunfire with Fury of Elune CD at half height if chosen.
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredLevel = 23,
    debuff = {164815,2},
    refreshable = true,
    cooldown = 202770,
    smallCooldown = true,
     barcolors = {
     debuffmine  = {121/255, 010/255, 000/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Stellar Flare
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredTalent = 18,
    debuff = {202347,2},
    refreshable = true,
     barcolors = {
     debuffmine  = {111/255, 222/255, 232/255, 0.6}
     },
  })

  -- Starlord
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredTalent = 14,
    playerbuff = 202345,
    refreshable = true,
     barcolors = {
     playerbuff  = {111/255, 222/255, 232/255, 0.6}
     },
  })

  -- Starsurge  -- There are two bars for this as it provides two different buffs. Not convinced this is needed as the default hud makes it more obvious.
  -- Tier 2 talent CD at half height.
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredLevel = 12,
    playerbuff = 48517,
    icon = 48517,
    cooldown = {1850, 108238, 102401},
    smallCooldown = true,
     barcolors = {
     playerbuff  = {252/255, 252/255, 090/255, 0.5},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })
  -- Tier 4 CD at half height.
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredLevel = 12,
    playerbuff = 48518,
    icon = 48518,
    cooldown = {5211, 102359, 319454},
    smallCooldown = true,
     barcolors = {
     playerbuff  = {151/255, 101/255, 161/255, 0.5},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

--[[
    -- Starfall  -- Not really sure if this needs to be tracked as the spell area is very obvious and the buff only affects targets within it.
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredLevel = 40,
    debuff = 197637,
    refreshable = true,
  })
]]
  -- Feral Affinity
  -- Rake
  self:newSpell({
    requiredTree = 1,
    stance = 2,
    requiredTalent = 7,
    debuff = {1822,3},
    refreshable = true,
     barcolors = {
     debuffmine  = {191/255, 040/255, 101/255, 0.5}
     },
  })

  -- Rip
  self:newSpell({
    requiredTree = 1,
    stance = 2,
    requiredTalent = 7,
    debuff = {1079,2},
    refreshable = true,
     barcolors = {
     debuffmine  = {252/255, 000/255, 060/255, 0.5},
     },
  })

  -- Guardian Affinity
  -- Thrash 
  self:newSpell({
    requiredTree = 1,
    stance = 1,
    requiredTalent = 8,
    debuff = {77758,3},
    cooldown = 77758,
    refreshable = true,
     barcolors = {
     debuffmine  = {070/255, 050/255, 040/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Ironfur
  self:newSpell({
    requiredTree = 1,
    stance = 1,
    playerbuff = 192081,
     barcolors = {
     playerbuff  = {040/255, 070/255, 181/255, 0.6}
     },
  })

  -- Frenzied Regeneration
  self:newSpell({
    requiredTree = 1,
    stance = 1,
    requiredTalent = 8,
    recharge = 22842,
    playerbuff = 22842,
     barcolors = {
     playerbuff  = {101/255, 181/255, 141/255, 0.8},
     recharge    = {030/255, 222/255, 040/255, 0.4}
     },
  })

  -- Celestial Alignment
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,4},
    requiredLevel = 39,
    requiredTalentUnselected = 15,
    cooldown = 194223,
    playerbuff = 194223,
     barcolors = {
     playerbuff  = {060/255, 121/255, 212/255, 0.9},
     recharge    = {030/255, 131/255, 060/255, 0.4}
     },
  })

  -- Incarnation: Chosen of Elune
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,4},
    requiredTalent = 15,
    cooldown = 102560,
    playerbuff = 102560,
     barcolors = {
     playerbuff  = {060/255, 121/255, 212/255, 0.9},
     recharge    = {030/255, 131/255, 060/255, 0.4}
     },
  })

  -- Restoration Affinity
  -- Swiftmend CD - currently always showing except cat form.
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,3,4,5,6},
    requiredTalent = 9,
    cooldown = 18562,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     }
  })

  -- Barkskin
  -- Delete the next line and the seventh line, after it, if you'd like to have Barskin displayed in Balance spec.
--[[
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,3,4},
    requiredLevel = 24,
    cooldown = 22812,
     barcolors = {
     playerbuff  = {141/255, 070/255, 030/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })
]]

-- Feral bars

  -- Moonfire with spell casts (like a cast bar).
  self:newSpell({
    requiredTree = 2,
    stance = {0,4,5},
    requiredLevel = 2,
    debuff = {164812,2},
    refreshable = true,
    cast = {339, 2637, 5176, 8936, 20484, 33786, 48438, 197626, 197628},
     barcolors = {
     debuffmine  = {050/255, 100/255, 255/255, 0.5}
     },
  })

  -- Savage Roar
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 14,
    playerbuff = 52610,
     barcolors = {
     playerbuff  = {252/255, 181/255, 000/255, 0.6}
     },
  })

  -- Rake with Feral Frenzy CD at half height if talent chosen.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 10,
    debuff = {1822,3},
    hasted = true,
    refreshable = true,
    cooldown = 274837,
    smallCooldown = true,
     barcolors = {
     cooldown    = {202/255, 161/255, 050/255, 0.5},
     debuffmine  = {191/255, 040/255, 101/255, 0.5}
     },
  })

  -- Moonfire in cat form with talent.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 3,
    debuff = {164812,2},
    hasted = true,
    refreshable = true,
     barcolors = {
     debuffmine  = {050/255, 101/255, 252/255, 0.5}
     },
  })

  -- Rip with tier two talent cooldowns at half height.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 21,
    debuff = {{1079,2}, {285381,2}},
    hasted = true,
    refreshable = true,
    cooldown = {252216, 108238, 132302},
    smallCooldown = true,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {252/255, 000/255, 060/255, 0.5}
     },
  })

  -- Thrash plus Brutal Slash recharge. Always showing in pre-patch as you'll probably have Wildfleshrending.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 11,
    --requiredTalent = 17,
    debuff = {106830,3},
    refreshable = true,
    recharge = 202028,
     barcolors = {
     debuffmine  = {222/255, 010/255, 010/255, 0.5},
     recharge    = {222/255, 171/255, 171/255, 0.4}
     },
  })

  -- Bloodtalons, only shown when Bloodtalons is selected to keep bar numbers down.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 20,
    playerbuff = 319439,
     barcolors = {
     playerbuff  = {030/255, 131/255, 000/255, 0.5}
     },
  })

  -- Tiger's Fury
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 12,
    cooldown = 5217,
    playerbuff = {5217, 6},
     barcolors = {
     playerbuff  = {252/255, 232/255, 090/255, 0.6},
     cooldown    = {252/255, 232/255, 090/255, 0.4}
     },
  })

  -- Berserk
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 34,
    requiredTalentUnselected = 15,
    cooldown = 106951,
    playerbuff = 106951,
  })

  -- Incarnation
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 15,
    cooldown = 102543,
    playerbuff = 102543,
  })

  -- Omen/Moment of Clarity & Survival Instinct recharge
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 38,
    playerbuff = 135700,
    recharge = 61336,
     barcolors = {
     playerbuff  = {040/255, 090/255, 191/255, 0.6},
     recharge    = {232/255, 161/255, 101/255, 0.3}
    }
  })

  -- Balance Affinity
  -- Moonfire
  -- Sunfire
  self:newSpell({
    requiredTree = 2,
    stance = 4,
    requiredTalent = 7,
    debuff = {93402,2},
     barcolors = {
     debuffmine  = {121/255, 010/255, 000/255, 0.6}
     },
  })

  -- Starsurge  -- There are two bars for this as it gives a different buff for either Wrath or Starfire.
  self:newSpell({
    requiredTree = 2,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 48517,
    icon = 48517,
    cast = 197626,
     barcolors = {
     playerbuff  = {252/255, 252/255, 090/255, 0.5}
     },
  })

  self:newSpell({
    requiredTree = 2,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 48518,
    icon = 48518,
    cast = 197626,
     barcolors = {
     playerbuff  = {151/255, 101/255, 161/255, 0.5}
     },
  })

  -- Guardian Affinity
  -- Thrash 
  self:newSpell({
    requiredTree = 2,
    stance = 1,
    requiredLevel = 11,
    cooldown = 77758,
    debuff = {192090,3},
    refreshable = true,
     barcolors = {
     debuffmine  = {070/255, 050/255, 040/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Ironfur with Incapacitating Roar cooldown at half height.
  self:newSpell({
    requiredTree = 2,
    stance = 1,
    requiredLevel = 18,
    cooldown = 99,
    smallCooldown = true,
    playerbuff = 192081,
     barcolors = {
     playerbuff  = {040/255, 070/255, 181/255, 0.6}
     },
  })

  -- Frenzied Regeneration
  self:newSpell({
    requiredTree = 2,
    stance = 1,
    requiredTalent = 8,
    cooldown = 22842,
    playerbuff = 22842,
     barcolors = {
     playerbuff  = {101/255, 181/255, 141/255, 0.8},
     recharge    = {030/255, 222/255, 040/255, 0.4}
     },
  })

  -- Restoration Affinity
  -- Restoration Affinity
  -- Swiftmend CD - currently always showing.
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,3,4,5,6},
    requiredTalent = 9,
    cooldown = 18562,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     }
  })

-- Guardian bars

  -- Moonfire with spell casts (like a cast bar).
  self:newSpell({
    requiredTree = 3,
    stance = {0,4,5},
    requiredLevel = 2,
    debuff = {164812,2},
    refreshable = true,
    cast = {339, 2637, 5176, 8936, 20484, 33786, 48438, 197626, 197628},
     barcolors = {
     debuffmine  = {050/255, 100/255, 255/255, 0.5}
     },
  })

  -- Mangle
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 8,
    cooldown = 33917,
    playerbuff = {{93622}, {213708}},
     barcolors = {
     playerbuff  = {240/255, 000/255, 000/255, 0.3},
     debuffmine  = {190/255, 040/255, 100/255, 0.5},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Moonfire with tier two talent cooldowns at half height.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 8,
    debuff = {164812,2},
    refreshable = true,
    cooldown = {108238, 102401, 252216},
    smallCooldown = true,
     barcolors = {
     debuffmine  = {050/255, 100/255, 255/255, 0.5},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Thrash
  self:newSpell({
    requiredTree = 3,
    stance = {1, 2},
    requiredLevel = 11,
    debuff = {77758,3},
    cooldown = 77758,
    refreshable = true,
     barcolors = {
     debuffmine  = {070/255, 050/255, 040/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Pulverize
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredTalent = 21,
    debuff = 80313,
    cooldown = 80313,
     barcolors = {
     playerbuff  = {030/255, 121/255, 121/255, 0.6},
     },
  })

  -- Three separate lines for this bar so the starting icon reminds you which CD it is tracking, as soon as you use a mitigation ability it will update.
  -- Ironfur with Mighty Bash cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 20,
    requiredTalent = 10,
    playerbuff = 192081,
    cooldown = 5211,
    smallCooldown = true,
     barcolors = {
     playerbuff  = {111/255, 111/255, 151/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Ironfur with Mass Entanglement cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 20,
    requiredTalent = 11,
    playerbuff = 192081,
    cooldown = 102359,
    smallCooldown = true,
     barcolors = {
     playerbuff  = {111/255, 111/255, 151/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Ironfur with Heart of the Wild cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 20,
    requiredTalent = 12,
    playerbuff = 192081,
    cooldown = 319454,
    smallCooldown = true,
     barcolors = {
     playerbuff  = {111/255, 111/255, 151/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Frenzied Regen & Earthwarden if talented.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiresLevel = 50,
    playerbuff = {{22842}, {203975}},
    recharge = 22842,
     barcolors = {
     playerbuff  = {101/255, 181/255, 141/255, 0.8},
     recharge    = {030/255, 222/255, 040/255, 0.4}
     },
  })

  -- Balance Affinity
  -- Sunfire
  self:newSpell({
    requiredTree = 3,
    stance = 4,
    requiredTalent = 7,
    debuff = {93402, 2},
     barcolors = {
     debuffmine  = {121/255, 010/255, 000/255, 0.6}
     },
  })

  -- Starsurge  -- There are two bars for this as it gives a different buff for either Wrath or Starfire.
  self:newSpell({
    requiredTree = 3,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 48517,
    icon = 48517,
    cast = 197626,
     barcolors = {
     playerbuff  = {252/255, 252/255, 090/255, 0.5}
     },
  })

  self:newSpell({
    requiredTree = 3,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 48518,
    icon = 48518,
    cast = 197626,
     barcolors = {
     playerbuff  = {151/255, 101/255, 161/255, 0.5}
     },
  })

  -- Feral Affinity
  -- Rake
  self:newSpell({
    requiredTree = 3,
    stance = 2,
    requiredTalent = 8,
    debuff = {1822,3},
    refreshable = true,
    cooldown = {102280, 102401},
    smallCooldown = true,
     barcolors = {
     debuffmine  = {191/255, 040/255, 101/255, 0.5}
     },
  })

  -- Rip 
  self:newSpell({
    requiredTree = 3,
    stance = 2,
    requiredTalent = 8,
    debuff = {1079,2},
    refreshable = true,
     barcolors = {
     debuffmine  = {252/255, 000/255, 060/255, 0.5}
     },
  })

  -- Tooth and Claw
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,2,3,4},
    requiredTalent = 20,
    playerbuff = 135286,
  })

  -- Bristling Fur
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 3,
    stance = 1,
    cooldown = 155835,
    playerbuff = 155835,
     barcolors = {
     playerbuff  = {252/255, 111/255, 030/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Barkskin
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,2,3,4},
    cooldown = 22812,
    playerbuff = 22812,
     barcolors = {
     playerbuff  = {141/255, 070/255, 030/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Survival Instincts
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,2,3,4},
    recharge = 61336,
    playerbuff = 61336,
     barcolors = {
     playerbuff  = {232/255, 161/255, 101/255, 0.6},
     recharge    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Incarnation: Guardian of Ursoc
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,2,3,4},
    requiredTalent = 15,
    cooldown = 102558,
    playerbuff = 102558,
     barcolors = {
     playerbuff  = {150/255, 000/255, 150/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Restoration Affinity
  -- Swiftmend CD - currently always showing.
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,3,4,5,6},
    requiredTalent = 9,
    cooldown = 18562,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     }
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

  -- Balance Affinity
  -- Starsurge  -- There are two bars for this as it gives a different buff for either Wrath or Starfire.
  self:newSpell({
    requiredTree = 4,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 48517,
    icon = 48517,
    cast = 197626,
     barcolors = {
     playerbuff  = {252/255, 252/255, 090/255, 0.5}
     },
  })

  self:newSpell({
    requiredTree = 4,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 48518,
    icon = 48518,
    cast = 197626,
     barcolors = {
     playerbuff  = {151/255, 101/255, 161/255, 0.5}
     },
  })

  -- Feral Affinity
  -- Rake
  self:newSpell({
    requiredTree = 4,
    stance = 2,
    requiredTalent = 8,
    debuff = {1822,3},
    refreshable = true,
     barcolors = {
     debuffmine  = {191/255, 040/255, 101/255, 0.5}
     },
  })

  -- Rip 
  self:newSpell({
    requiredTree = 4,
    stance = 2,
    requiredTalent = 8,
    debuff = {1079,2},
    refreshable = true,
     barcolors = {
     debuffmine  = {252/255, 000/255, 060/255, 0.5}
     },
  })

  -- Guardian Affinity
  -- Thrash 
  self:newSpell({
    requiredTree = 4,
    stance = 1,
    requiredTalent = 9,
    debuff = {77758,3},
    cooldown = 77758,
    refreshable = true,
     barcolors = {
     debuffmine  = {070/255, 050/255, 040/255, 0.6},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
  })

  -- Ironfur
  self:newSpell({
    requiredTree = 4,
    stance = 1,
    requiredTalent = 9,
    playerbuff = 192081,
     barcolors = {
     playerbuff  = {040/255, 070/255, 181/255, 0.6}
     },
  })

  -- Frenzied Regeneration
  self:newSpell({
    requiredTree = 4,
    stance = 1,
    requiredTalent = 9,
    recharge = 22842,
    playerbuff = 22842,
     barcolors = {
     playerbuff  = {101/255, 181/255, 141/255, 0.8},
     recharge    = {030/255, 222/255, 040/255, 0.4}
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

  -- Barkskin
  self:newSpell({
    requiredTree = 4,
    stance = {0,1,2,3,4,5},
    requiredLevel = 24,
    cooldown = 22812,
    playerbuff = 22812,
     barcolors = {
     playerbuff  = {141/255, 070/255, 030/255, 0.8},
     cooldown    = {171/255, 191/255, 181/255, 0.6}
     },
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
