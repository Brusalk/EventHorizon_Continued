local usemouseover = true  -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 768 -- Cat Form
  self.config.hastedSpellID = {50769,10} -- Revive

  -- Balance bars

  -- Scythe of Elune spell
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredArtifactTalent = 202767,
    recharge = 202767,
    cast = {202767, 202768, 202771},
    barcolors = {
      recharge = {202/255, 161/255, 050/255, 0.5},
    },
  })

  -- Moonfire with Force of Nature or Warrior of Elune cooldown at half height.
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,4},
    requiredLevel = 10,
    debuff = {164812,2},
    refreshable = true,
    barcolors = {
      debuffmine = {050/255, 101/255, 252/255, 0.5}
    },
  })

  -- Sunfire
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredLevel = 24,
    debuff = {164815,2},
    refreshable = true,
    cooldown = {205636, 202425},
    smallCooldown = true,
    barcolors = {
      debuffmine = {121/255, 010/255, 000/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Stellar Flare
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredTalent = 15,
    debuff = {202347,2},
    refreshable = true,
    barcolors = {
      debuffmine = {111/255, 222/255, 232/255, 0.6}
    },
  })

  -- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
  -- Fury of Elune CD at half height if chosen.
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredLevel = 10,
    playerbuff = 164545,
    cast = 190984,
    cooldown = 202359,
    smallCooldown = true,
    barcolors = {
      playerbuff = {252/255, 252/255, 090/255, 0.5},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Astral Communion CD at half height if chosen.
  self:newSpell({
    requiredTree = 1,
    stance = {0,4},
    requiredLevel = 10,
    playerbuff = 164547,
    cast = 194153,
    cooldown = 202770,
    smallCooldown = true,
    barcolors = {
      playerbuff = {151/255, 101/255, 161/255, 0.5},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

--  -- Starfall  -- Not really sure if this needs to be tracked as the spell area is very obvious and the buff only affects targets within it.
--  self:newSpell({
--    requiredTree = 1,
--    stance = {0,4},
--    requiredLevel = 40,
--    debuff = 197637,
--    refreshable = true,
--  })

  -- Feral Affinity

  -- Rake
  self:newSpell({
    requiredTree = 1,
    stance = 2,
    requiredTalent = 7,
    debuff = {1822,3},
    refreshable = true,
    barcolors = {
      debuffmine = {191/255, 040/255, 101/255, 0.5}
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
      debuffmine = {252/255, 000/255, 060/255, 0.5},
    },
  })

  -- Guardian Affinity

  -- Mangle
  self:newSpell({
    requiredTree = 1,
    stance = 1,
    requiredTalent = 8,
    cooldown = 33917,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Thrash 
  self:newSpell({
    requiredTree = 1,
    stance = 1,
    requiredTalent = 8,
    debuff = {77758,3},
    cooldown = 77758,
    refreshable = true,
    barcolors = {
      debuffmine = {070/255, 050/255, 040/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Ironfur
  self:newSpell({
    requiredTree = 1,
    stance = 1,
    requiredTalent = 8,
    playerbuff = 192081,
    barcolors = {
      playerbuff = {040/255, 070/255, 181/255, 0.6}
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
      playerbuff = {101/255, 181/255, 141/255, 0.8},
      recharge = {030/255, 222/255, 040/255, 0.4}
    },
  })

  -- Celestial Alignment
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,4},
    requiredLevel = 64,
    requiredTalentUnselected = 14,
    cooldown = 194223,
    playerbuff = 194223,
    barcolors = {
      playerbuff = {060/255, 121/255, 212/255, 0.9},
      recharge = {030/255, 131/255, 060/255, 0.4}
    },
  })

  -- Incarnation: Chosen of Elune
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,4},
    requiredTalent = 14,
    cooldown = 102560,
    playerbuff = 102560,
    barcolors = {
      playerbuff = {060/255, 121/255, 212/255, 0.9},
      recharge = {030/255, 131/255, 060/255, 0.4}
    },
  })

  -- Restoration Affinity

  -- Rejuvenation + Swiftmend CD
  self:newSpell({
    requiredTree = 1,
    stance = 0,
    requiredTalent = 9,
    cooldown = 18562,
    smallCooldown = true,
    playerbuff = {774,3},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {232/255, 060/255, 202/255, 0.5}
    }
  })

--  -- Regrowth
  self:newSpell({
    requiredTree = 1,
    stance = 0,
    requiredTalent = 9,
    playerbuff = {8936,2},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    cast = 8936,
    recast = true,
    barcolors = {
      casting = {252/255, 121/255, 000/255, 0.8},
      playerbuff = {020/255, 212/255, 050/255, 0.7}
    }
  })

  -- Barkskin
  -- Delete the next line and the seventh line, after it, if you'd like to have Barskin displayed in Balance spec.
--[[
  self:newSpell({
    requiredTree = 1,
    stance = {0,1,2,3,4},
    requiredLevel = 36,
    cooldown = 22812,
    barcolors = {
      playerbuff = {141/255, 070/255, 030/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })
]]--

  -- Feral bars

  -- Moonfire in bear as it always has access to it.
  self:newSpell({
    requiredTree = 2,
    stance = 1,
    debuff = {164812,2},
    refreshable = true,
    barcolors = {
      debuffmine = {050/255, 101/255, 252/255, 0.5}
    },
  })

  -- Savage Roar
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 15,
    playerbuff = 52610,
    barcolors = {
      playerbuff = {232/255, 202/255, 000/255, 0.5}
    },
  })

  -- Rake with Ashamane's Frenzy CD at half height once you get it.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 8,
    requiredTalentUnselected = 17,
    debuff = {1822,3},
    refreshable = true,
    cooldown = 210722,
    smallCooldown = true,
    barcolors = {
      cooldown = {202/255, 161/255, 050/255, 0.5},
      debuffmine = {191/255, 040/255, 101/255, 0.5}
    },
  })

  -- Rake with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 8,
    requiredTalent = 17,
    debuff = {1822,2},
    refreshable = true,
    cooldown = 210722,
    smallCooldown = true,
    barcolors = {
      cooldown = {202/255, 161/255, 050/255, 0.5},
      debuffmine = {191/255, 040/255, 101/255, 0.5}
    },
  })

  -- Moonfire in cat form with talent.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 3,
    debuff = {164812,2},
    refreshable = true,
    barcolors = {
      debuffmine = {050/255, 101/255, 252/255, 0.5}
    },
  })

  -- Rip with tier two talent cooldowns at half height.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 20,
    requiredTalent = 16,
    debuff = {1079,2},
    refreshable = true,
    cooldown = {108238, 102280, 102401},
    smallCooldown = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      debuffmine = {252/255, 000/255, 060/255, 0.5},
    },
  })

  -- Rip with tier two talent cooldowns at half height & faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 17,
    debuff = {1079,1.33},
    refreshable = true,
    cooldown = {108238, 102280, 102401},
    smallCooldown = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      debuffmine = {252/255, 000/255, 060/255, 0.5},
    },
  })

  -- Rip with Elune's Guidance CD at half height.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 20,
    requiredTalent = 18,
    cooldown = 202060,
    smallCooldown = true,
    debuff = {1079,2},
    refreshable = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      debuffmine = {252/255, 000/255, 060/255, 0.5},
    },
  })

  -- Tiger's Fury
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 12,
    cooldown = 5217,
    playerbuff = 5217,
    barcolors = {
      playerbuff = {252/255, 000/255, 050/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Bloodtalons & Predatory Swiftness, triggered by Regrowth.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 20,
    playerbuff = {{69369},{155672}},
      barcolors = {
      playerbuff = {030/255, 131/255, 000/255, 0.5}
    },
  })

  -- Thrash with Brutal Slash.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 18,
    requiredTalentUnselected = 17,
    debuff = {106830,3},
    refreshable = true,
    recharge = 202028,
    barcolors = {
      debuffmine = {222/255, 010/255, 010/255, 0.5},
      recharge = {222/255, 171/255, 171/255, 0.4}
    },
  })

  -- Thrash with faster ticks because of Jagged Wounds. The tick time will need to be adjusted if they change the talent, again.
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 17,
    debuff = {106830,2},
    refreshable = true,
    recharge = 202028,
    barcolors = {
      debuffmine = {222/255, 010/255, 010/255, 0.5},
      recharge = {222/255, 171/255, 171/255, 0.4}
    },
  })

  -- Berserk
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 48,
    requiredTalentUnselected = 14,
    cooldown = 106951,
    playerbuff = 106951,
  })

  -- Incarnation
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredTalent = 14,
    cooldown = 102543,
    playerbuff = 106951,
  })

  -- Omen/Moment of Clarity & Survival Instinct recharge
  -- Delete the next line and the 12th line after it, if you'd like OoC/MoC tracking.
--[[
  self:newSpell({
    requiredTree = 2,
    stance = 2,
    requiredLevel = 38,
    playerbuff = 135700,
    recharge = 61336,
    barcolors = {
      playerbuff = {040/255, 090/255, 191/255, 0.6},
      recharge = {232/255, 161/255, 101/255, 0.3}
    }
  })
]]--

  -- Balance Affinity

  -- Moonfire
  self:newSpell({
    requiredTree = 2,
    stance = 4,
    requiredTalent = 7,
    debuff = {164812,2},
    refreshable = true,
    barcolors = {
      debuffmine = {050/255, 101/255, 252/255, 0.5}
    },
  })

  -- Sunfire
  self:newSpell({
    requiredTree = 2,
    stance = 4,
    requiredTalent = 7,
    debuff = {93402,2},
    barcolors = {
      debuffmine = {121/255, 010/255, 000/255, 0.6},
    },
  })

  -- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
  self:newSpell({
    requiredTree = 2,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 164547,
    icon = 164547,
    cast = 197626,
    recast = true,
    barcolors = {
      playerbuff = {151/255, 101/255, 161/255, 0.5},
    },
  })

  self:newSpell({
    requiredTree = 2,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 164545,
    icon = 164545,
    cast = 197626,
    recast = true,
    barcolors = {
      playerbuff = {252/255, 252/255, 090/255, 0.5},
    },
  })

  -- Guardian Affinity

  -- Mangle
  self:newSpell({
    requiredTree = 2,
    stance = 1,
    requiredTalent = 8,
    cooldown = 33917,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Thrash 
  self:newSpell({
    requiredTree = 2,
    stance = 1,
    requiredLevel = 18,
    cooldown = 77758,
    debuff = {192090,3},
    refreshable = true,
    barcolors = {
      debuffmine = {070/255, 050/255, 040/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Ironfur
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 8,
    stance = 1,
    playerbuff = {192081,6},
    barcolors = {
      playerbuff = {040/255, 070/255, 181/255, 0.6}
    },
  })

  -- Frenzied Regeneration
  self:newSpell({
    requiredTree = 2,
    stance = 1,
    requiredTalent = 8,
    recharge = 22842,
    playerbuff = 22842,
    barcolors = {
      playerbuff = {101/255, 181/255, 141/255, 0.8},
      recharge = {030/255, 222/255, 040/255, 0.4}
    },
  })

  -- Restoration Affinity

  -- Rejuvenation + Swiftmend CD
  self:newSpell({
    requiredTree = 2,
    stance = 0,
    requiredTalent = 9,
    cooldown = 18562,
    smallCooldown = true,
    playerbuff = {774,3},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {232/255, 060/255, 202/255, 0.5}
    }
  })

  -- Regrowth
  self:newSpell({
    requiredTree = 2,
    stance = 0,
    requiredTalent = 9,
    playerbuff = {8936,2},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    cast = 8936,
    recast = true,
    barcolors = {
      casting = {252/255, 121/255, 000/255, 0.8},
      playerbuff = {020/255, 212/255, 050/255, 0.7}
    }
  })

  -- Guardian bars

  -- Mangle
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 10,
    cooldown = 33917,
    playerbuff = {{93622}, {213708}},
    barcolors = {
      playerbuff = {240/255, 000/255, 000/255, 0.3},
      debuffmine = {190/255, 040/255, 100/255, 0.5},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Thrash
  self:newSpell({
    requiredTree = 3,
    stance = {1, 2},
    requiredLevel = 10,
    debuff = {77758,3},
    cooldown = 77758,
    refreshable = true,
    barcolors = {
      debuffmine = {070/255, 050/255, 040/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Pulverize
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredTalent = 21,
    playerbuff = 158792,
    barcolors = {
      playerbuff = {030/255, 121/255, 121/255, 0.6},
    },
  })

  -- Moonfire with tier two talent cooldowns at half height.
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,3,4,5,6},
    requiredLevel = 10,
    debuff = {164812,2},
    refreshable = true,
    cooldown = {102280, 102401},
    smallCooldown = true,
    barcolors = {
      debuffmine = {050/255, 100/255, 255/255, 0.5},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Frenzied Regen & Earthwarden if talented.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiresLevel = 50,
    -- requiredTalent = 16,
    playerbuff = {{22842}, {203975}},
    recharge = 22842,
    barcolors = {
    playerbuff = {101/255, 181/255, 141/255, 0.8},
    recharge = {030/255, 222/255, 040/255, 0.4}
    },
  })

  -- Three separate lines for this bar so the starting icon reminds you which CD it is tracking, as soon as you use a mitigation ability it will update.
  -- Ironfur & Mark of Ursol with Mighty Bash cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 20,
    requiredTalent = 10,
    playerbuff = 192081,
    cooldown = 5211,
    smallCooldown = true,
    barcolors = {
      playerbuff = {111/255, 111/255, 151/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Ironfur & Mark of Ursol with Mass Entanglement cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 20,
    requiredTalent = 11,
    playerbuff = 192081,
    cooldown = 102359,
    smallCooldown = true,
    barcolors = {
      playerbuff = {111/255, 111/255, 151/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Ironfur & Mark of Ursol with Typhoon cooldown at half height.
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiredLevel = 20,
    requiredTalent = 12,
    playerbuff = 192081,
    cooldown = 132469,
    smallCooldown = true,
    barcolors = {
      playerbuff = {111/255, 111/255, 151/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  --[[ Frenzied Regeneration
  self:newSpell({
    requiredTree = 3,
    stance = 1,
    requiresLevel = 50,
    recharge = 22842,
    playerbuff = 22842,
    barcolors = {
      playerbuff = {101/255, 181/255, 141/255, 0.8},
      recharge = {030/255, 222/255, 040/255, 0.4}
    },
  })
]]

  -- Balance Affinity

  -- Sunfire
  self:newSpell({
    requiredTree = 3,
    stance = 4,
    requiredTalent = 7,
    debuff = {93402, 2},
    barcolors = {
      debuffmine = {121/255, 010/255, 000/255, 0.6},
    },
  })

  -- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
  self:newSpell({
    requiredTree = 3,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 164547,
    cast = 197626,
    recast = true,
    icon = 194153,
    barcolors = {
      playerbuff = {151/255, 101/255, 161/255, 0.5},
    },
  })

  self:newSpell({
    requiredTree = 3,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 164545,
    cast = 197626,
    recast = true,
    icon = 190984,
    barcolors = {
      playerbuff = {252/255, 252/255, 090/255, 0.5},
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
      debuffmine = {191/255, 040/255, 101/255, 0.5}
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
      debuffmine = {252/255, 000/255, 060/255, 0.5},
    },
  })

  -- Restoration Affinity

  -- Rejuvenation + Swiftmend CD
  self:newSpell({
    requiredTree = 3,
    stance = 0,
    requiredTalent = 9,
    cooldown = 18562,
    smallCooldown = true,
    playerbuff = {774,3},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {232/255, 060/255, 202/255, 0.5}
    }
  })

-- Regrowth
  self:newSpell({
    requiredTree = 3,
    stance = 0,
    requiredTalent = 9,
    playerbuff = {8936,2},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    cast = 8936,
    recast = true,
    barcolors = {
      casting = {252/255, 121/255, 000/255, 0.8},
      playerbuff = {020/255, 212/255, 050/255, 0.7}
    }
  })

  -- Lunar Beam
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,2,3,4},
    requiredTalent = 20,
    cooldown = 204066,
    playerbuff = 204066,
  })

  -- Barkskin
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,2,3,4},
    cooldown = 22812,
    playerbuff = 22812,
    barcolors = {
      playerbuff = {141/255, 070/255, 030/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Rage of the Sleeper
  self:newSpell({
    requiredTree = 3,
    requiredArtifactTalent = 200851,
    stance = 1,
    cooldown = 200851,
    playerbuff = 200851,
    barcolors = {
      playerbuff = {202/255, 161/255, 050/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Survival Instincts
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,2,3,4},
    recharge = 61336,
    playerbuff = 61336,
    barcolors = {
      playerbuff = {232/255, 161/255, 101/255, 0.6},
      recharge = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Incarnation: Guardian of Ursoc
  self:newSpell({
    requiredTree = 3,
    stance = {0,1,2,3,4},
    requiredTalent = 14,
    cooldown = 102558,
    playerbuff = 102558,
    barcolors = {
      playerbuff = {150/255, 000/255, 150/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Restoration bars
  --Note that there are two, or more, entries for the same spell for many of these bars, this is to have them show up in the correct stances with or without Balance Affinity taken. Additionally there will be a few players out there who prefer to be a treant, all this effort was for you.

  -- The first spell bar is for Lifebloom. This huge note is so you can get Lifebloom to track your focus frame. As many healers, especially in a dungeon group, will set the tank as their focus so this seemed like a good addition however the default is the same mouseover behaviour as the other spells. Just change the comment markers "--" on the auraunit lines. Do this for the both "Lifebloom + Wild Growth CD" spell bars, I know that seemes excessive but it's the only way I could make it work for people who like being a Treant while healing and sometimes have Balance affinity.

  -- Lifebloom + Wild Growth CD, cast and HT cast
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredLevel = 32,
    cast = {48438, 5185},
    playerbuff = {33763,1},
    -- auraunit = usemouseover and 'mouseover' or 'target',
    auraunit = 'focus',
    refreshable = true,
    icon = 33763,
    cooldown = 48438,
    smallCooldown = true,
    barcolors = {
      casting = {252/255, 121/255, 000/255, 0.8},
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {099/255, 232/255, 121/255, 0.5}
    }
  })

  -- Lifebloom + Wild Growth CD, cast and HT cast
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    cast = {48438, 5185},
    playerbuff = {33763,1},
    auraunit = usemouseover and 'mouseover' or 'target',
    -- auraunit = 'focus',
    refreshable = true,
    icon = 33763,
    cooldown = 48438,
    smallCooldown = true,
    barcolors = {
      casting = {252/255, 121/255, 000/255, 0.8},
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {099/255, 232/255, 121/255, 0.5}
    }
  })

  -- Rejuvenation + Swiftmend
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalent = 2,
    requiredTalentUnselected = 7,
    requiredLevel = 10,
    playerbuff = {774,3},
    cooldown = 18562,
    smallCooldown = true,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {232/255, 066/255, 202/255, 0.6}
    }
  })

  -- Rejuvenation + Swiftmend
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalent = 3,
    requiredTalentUnselected = 7,
    requiredLevel = 10,
    playerbuff = {774,3},
    cooldown = 18562,
    smallCooldown = true,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {232/255, 066/255, 202/255, 0.6}
    }
  })

  -- Rejuvenation + Swiftmend
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalent = 1,
    requiredTalentUnselected = 7,
    requiredLevel = 10,
    playerbuff = {774,3},
    recharge = 18562,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      recharge = {171/255, 191/255, 181/255, 0.3},
      playerbuff = {232/255, 066/255, 202/255, 0.6}
    }
  })

  -- Rejuvenation + Swiftmend
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    requiredTalentUnselected = 1,
    playerbuff = {774,3},
    cooldown = 18562,
    smallCooldown = true,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {232/255, 066/255, 202/255, 0.6}
    }
  })

  -- Rejuvenation + Swiftmend
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = {1,7},
    playerbuff = {774,3},
    recharge = 18562,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      recharge = {171/255, 191/255, 181/255, 0.3},
      playerbuff = {232/255, 066/255, 202/255, 0.6}
    }
  })

  -- Germination
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredTalent = 18,
    playerbuff = {155777,3},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      playerbuff = {171/255, 066/255, 202/255, 0.7}
    }
  })

  -- Germination
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = {7,18},
    requiredLevel = 10,
    playerbuff = {155777,3},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    barcolors = {
      playerbuff = {171/255, 66/255, 202/255, 0.7}
    }
  })

  -- Regrowth with Essence of G'Hanir CD at half height.
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredLevel = 10,
    requiredTalentUnselected = 7,
    cooldown = 208253,
    cast = 8936,
    recast = true,
    playerbuff = {8936,2},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    smallCooldown = true,
    barcolors = {
      casting = {252/255, 121/255, 000/255, 0.8},
      cooldown = {202/255, 161/255, 055/255, 0.9},
      playerbuff = {022/255, 212/255, 055/255, 0.4}
    }
  })

  -- Regrowth with Essence of G'Hanir CD at half height.
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    cooldown = 208253,
    cast = 8936,
    recast = true,
    playerbuff = {8936,2},
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    smallCooldown = true,
    barcolors = {
      casting = {161/255, 121/255, 000/255, 0.8},
      cooldown = {202/255, 161/255, 055/255, 0.9},
      playerbuff = {022/255, 212/255, 055/255, 0.4}
    }
  })

  -- Cenarion Ward
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredTalent = 2,
    playerbuff = {{102351}, {102352,2}},
    cooldown = 102351,
    auraunit = usemouseover and 'mouseover' or 'target',
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {151/255, 171/255, 090/255, 0.7}
    }
  })

  -- Cenarion Ward
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = {2,7},
    playerbuff = {{102351}, {102352,2}},
    cooldown = 102351,
    auraunit = usemouseover and 'mouseover' or 'target',
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {151/255, 171/255, 090/255, 0.7}
    }
  })

  --[[
  -- Efflorescence - no way of tracking this yet.
  self:newSpell({
    requiredTree = 4,
    stance = 0,
    requiredLevel = 83,
    playerbuff = {145205,2},
  })
  ]]--

  -- Flourish
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalent = 21,
    requiredTalentUnselected = 7,
    cooldown = 197721,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
    }
  })

  -- Flourish
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalent = {7, 21},
    cooldown = 197721,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
    }
  })

  -- Ironbark
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredLevel = 52,
    playerbuff = 102342,
    cooldown = 102342,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {161/255, 088/255, 077/255, 0.8}
    }
  })

  -- Ironbark
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    requiredLevel = 52,
    playerbuff = 102342,
    cooldown = 102342,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {161/255, 088/255, 077/255, 0.8}
    }
  })

  -- Omen of Clarity / Moment of Clarity and Innervate cooldown.
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredLevel = 12,
    cooldown = 29166,
    playerbuff = 16870,
    smallCooldown = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {040/255, 090/255, 191/255, 0.5}
    }
  })

  -- Omen of Clarity / Moment of Clarity and Innervate cooldown.
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    cooldown = 29166,
    playerbuff = 16870,
    smallCooldown = true,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {040/255, 090/255, 191/255, 0.5}
    }
  })

  -- Barkskin
  self:newSpell({
    requiredTree = 4,
    stance = {0,1,2,3,4,5},
    requiredLevel = 26,
    cooldown = 22812,
    playerbuff = 22812,
    barcolors = {
      playerbuff = {141/255, 070/255, 030/255, 0.8},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Balance Affinity

  -- Moonfire
  self:newSpell({
    requiredTree = 4,
    stance = {1,4},
    requiredTalent = 7,
    debuff = {164812,2},
    refreshable = true,
    barcolors = {
      debuffmine = {050/255, 100/255, 255/255, 0.5}
    },
  })

  -- Sunfire
  self:newSpell({
    requiredTree = 4,
    stance = 4,
    requiredTalent = 7,
    debuff = {93402,2},
    barcolors = {
      debuffmine = {121/255, 010/255, 000/255, 0.6},
    },
  })

  -- Starsurge  -- There are two bars for this as it provides two different buffs stacking up to three, the buffs are then consumed by different spell schools separately so both are needed.
  self:newSpell({
    requiredTree = 4,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 164547,
    icon = 164547,
    cast = 197626,
    recast = true,
    barcolors = {
      playerbuff = {151/255, 101/255, 161/255, 0.5},
    },
  })

  self:newSpell({
    requiredTree = 4,
    stance = 4,
    requiredTalent = 7,
    cooldown = 197626,
    playerbuff = 164545,
    icon = 164545,
    cast = 197626,
    recast = true,
    barcolors = {
      playerbuff = {252/255, 252/255, 090/255, 0.5},
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
      debuffmine = {191/255, 040/255, 101/255, 0.5}
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
      debuffmine = {252/255, 000/255, 060/255, 0.5},
    },
  })

  -- Guardian Affinity

  -- Mangle
  self:newSpell({
    requiredTree = 4,
    stance = 1,
    requiredTalent = 9,
    cooldown = 33917,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Thrash 
  self:newSpell({
    requiredTree = 4,
    stance = 1,
    requiredTalent = 9,
    debuff = {77758,3},
    cooldown = 77758,
    refreshable = true,
    barcolors = {
      debuffmine = {070/255, 050/255, 040/255, 0.6},
      cooldown = {171/255, 191/255, 181/255, 0.6}
    },
  })

  -- Ironfur
  self:newSpell({
    requiredTree = 4,
    stance = 1,
    requiredTalent = 9,
    playerbuff = 192081,
    barcolors = {
      playerbuff = {040/255, 070/255, 181/255, 0.6}
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
      playerbuff = {101/255, 181/255, 141/255, 0.8},
      recharge = {030/255, 222/255, 040/255, 0.4}
    },
  })

  -- Incarnation: Tree of Life
  self:newSpell({
    requiredTree = 4,
    requiredTalent = 14,
    cooldown = 33891,
    playerbuff = 117679,
  })

  --The following bars are hidden by default as, depending on talent choices, you can end up with up to ELEVEN bars showing!
  --If you'd like the offensive spell DoT's tracked uncomment the following four sections by removing the --[[ and ]]-- from the next line and the second last line of the file.
  --[[
  -- Moonfire
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredLevel = 10,
    debuff = {164812,2},
    refreshable = true,
    barcolors = {
      debuffmine = {050/255, 100/255, 255/255, 0.5}
    },
  })

  -- Moonfire
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    debuff = {164812,2},
    refreshable = true,
    barcolors = {
      debuffmine = {050/255, 100/255, 255/255, 0.5}
    },
  })

  -- Sunfire with Solar Wrath cast.
  self:newSpell({
    requiredTree = 4,
    stance = {0,4},
    requiredTalentUnselected = 7,
    requiredLevel = 24,
    debuff = {164815,2},
    refreshable = true,
    icon = 164815,
    cast = 5176,
    barcolors = {
      debuffmine = {121/255, 010/255, 000/255, 0.6},
    },
  })

  -- Sunfire with Solar Wrath cast.
  self:newSpell({
    requiredTree = 4,
    stance = {0,5},
    requiredTalent = 7,
    debuff = {164815,2},
    refreshable = true,
    icon = 164815,
    cast = 5176,
    barcolors = {
      debuffmine = {121/255, 010/255, 000/255, 0.6},
    },
  })
]]--
end
