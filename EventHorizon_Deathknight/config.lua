function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 49998
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -1.5
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- Blood

  -- Blood Shield
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 1,
    playerbuff = 77535,
     barcolors = {
     playerbuff  = {252/255, 010/255, 020/255, 0.7}
     },
  })

  -- Blood Shield with Blooddrinker CD at half height.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 2,
    playerbuff = 77535,
    channel = 206931,
    cooldown = 206931,
    smallCooldown = true,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {252/255, 010/255, 020/255, 0.7}
     },
  })

  -- Blood Shield with Rune Strike recharge.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    playerbuff = 77535,
    recharge = 210764,
     barcolors = {
     recharge    = {171/255, 191/255, 181/255, 0.4},
     playerbuff  = {252/255, 010/255, 020/255, 0.7}
     },
  })

  -- Bone Shield buff
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 55,
    requiredTalentUnselected = 6,
    playerbuff = {195181, 1.5}, -- The 1.5 here is just so this specific bar has an unhasted GCD indicator as letting this drop is, apparently, very bad.
    barcolors = {
     cooldown    = {202/255, 161/255, 050/255, 0.7},
     playerbuff  = {171/255, 202/255, 111/255, 0.3}
     },
  })

  -- Bone Shield buff & Consumption CD if selected.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 6,
    playerbuff = {195181, 1.5}, -- The 1.5 here is just so this specific bar has an unhasted GCD indicator as letting this drop is, apparently, very bad.
    cooldown = 274156,
    smallCooldown = true,
    barcolors = {
     cooldown    = {202/255, 161/255, 050/255, 0.7},
     playerbuff  = {171/255, 202/255, 111/255, 0.3}
     },
  })

  -- Blood Plague & Blood Boil
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 55,
    debuff = {55078,3},
    recharge = 50842,
    barcolors = {
     recharge    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {111/255, 010/255, 191/255, 0.6}
     },
  })

  -- Death and Decay & Crimson Scourge (proc to reset D&D CD)
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 56,
    cooldown = 43265,
    smallCooldown = true,
    playerbuff = {{188290}, {81136}},
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {171/255, 030/255, 010/255, 0.7}
     },
  })

  -- Mark of Blood
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 18,
    debuff = 206940,
    cooldown = 206940,
     barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     debuffmine  = {252/255, 111/255, 121/255, 0.7}
     },
  })

  -- Rune Tap
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 12,
    recharge = 194679,
    playerbuff = 194679,
     barcolors = {
     recharge    = {171/255, 191/255, 181/255, 0.4},
     playerbuff  = {252/255, 111/255, 121/255, 0.7}
     },
  })

  -- Tombstone
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 9,
    cooldown = 219809,
    playerbuff = 219809,
  })

  -- Bonestorm
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    cooldown = 194844,
    debuff = 196528,
  })

  -- Anti-Magic Shell
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 57,
    cooldown = 48707,
    playerbuff = {48707},
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {212/255, 242/255, 040/255, 0.7}
     },
  })

  -- Vampiric Blood
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 57,
    cooldown = 55233,
    playerbuff = 55233,
  })

  -- Icebound Fortitude
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 57,
    cooldown = 48792,
    playerbuff = 48792,
  })

--[[ Not shown as default due to the number of bars already and it's a long, offensive, CD in tank spec.
  -- Dancing Rune Weapon
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 57,
    cooldown = 49028,
    playerbuff = 49028,
  })
]]

  -- Frost

--[[ --I was testing not tracking this as it's unlikely to ever be missing unless you fell asleep, feedback welcome.
  -- Frost Fever
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 55,
    debuff = {55095,3},
    barcolors = {
     debuffmine  = {212/255, 242/255, 252/255, 0.7}
     },
  })
]]

  -- Inexorable Assault
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {1, 16},
    playerbuff = {253593, 8}, -- Tick marker to tell you when you'll get another charge, only displays if you've got one though. :-(
    barcolors = {
     playerbuff  = {111/255, 212/255, 252/255, 0.6}
     },
  })

  -- Inexorable Assault with Glacial Advance CD at half height, if selected.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {1, 17},
    playerbuff = {253593, 8}, -- Tick marker to tell you when you'll get another charge, only displays if you've got one though. :-(
    cooldown = 194913,
    smallCooldown = true,
    barcolors = {
     cooldown    = {252/255, 252/255, 252/255, 0.7},
     playerbuff  = {111/255, 151/255, 252/255, 0.6}
     },
  })

  -- Inexorable Assault with Frostwyrm's Fury CD at half height, if selected.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {1, 18},
    playerbuff = {253593, 8}, -- Tick marker to tell you when you'll get another charge, only displays if you've got one though. :-(
    cooldown = 279302,
    smallCooldown = true,
    barcolors = {
     cooldown    = {252/255, 252/255, 252/255, 0.7},
     playerbuff  = {111/255, 151/255, 252/255, 0.6}
     },
  })

  -- Icy Talons
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {2, 16},
    playerbuff = {194878, 1.5}, -- Unhasted GCD time included as a 'tick marker' to help keep it up.
    barcolors = {
     playerbuff  = {111/255, 151/255, 252/255, 0.6}
     },
  })

  -- Icy Talons with Glacial Advance CD at half height, if selected.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {2, 16},
    playerbuff = {194878, 1.5}, -- Unhasted GCD time included as a 'tick marker' to help keep it up.
    cooldown = 194913,
    smallCooldown = true,
    barcolors = {
     cooldown    = {252/255, 252/255, 252/255, 0.7},
     playerbuff  = {111/255, 151/255, 252/255, 0.6}
     },
  })

  -- Icy Talons with Frostwyrm's Fury CD at half height, if selected.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {2, 17},
    playerbuff = {194878, 1.5}, -- Unhasted GCD time included as a 'tick marker' to help keep it up.
    cooldown = 279302,
    smallCooldown = true,
    barcolors = {
     cooldown    = {252/255, 252/255, 252/255, 0.7},
     playerbuff  = {111/255, 151/255, 252/255, 0.6}
     },
  })

  -- Cold Heart
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {3, 16},
    playerbuff = {281208, 2},
    barcolors = {
     playerbuff  = {090/255, 212/255, 252/255, 0.5}
     },
  })

  -- Cold Heart with Glacial Advance CD at half height, if selected.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {3, 17},
    playerbuff = {281208, 2},
    cooldown = 194913,
    smallCooldown = true,
    barcolors = {
     cooldown    = {252/255, 252/255, 252/255, 0.7},
     playerbuff  = {090/255, 212/255, 252/255, 0.5}
     },
  })

  -- Cold Heart with Frostwyrm's Fury CD at half height, if selected.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = {3, 18},
    playerbuff = {281208, 2},
    cooldown = 279302,
    smallCooldown = true,
    barcolors = {
     cooldown    = {252/255, 252/255, 252/255, 0.7},
     playerbuff  = {090/255, 212/255, 252/255, 0.5}
     },
  })

  -- Remorseless Winter
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 57,
    cooldown = 196770,
    debuff = {196770, 1},
    barcolors = {
     cooldown    = {151/255, 222/255, 252/255, 0.6},
     debuffmine  = {151/255, 222/255, 252/255, 0.7}
     },
  })

  -- Pillar of Frost
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 57,
    cooldown = 51271,
    playerbuff = 51271,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {181/255, 252/255, 252/255, 0.6}
     },
  })

  -- Horn of Winter CD.
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 6,
    cooldown = 57330,
    barcolors = {
     cooldown    = {030/255, 030/255, 030/255, 1},
     },
  })

  --[[ There doesn't seem to be a point of tracking this now as there is no interaction with anything, it will just be up if you have the runeforge and you're attacking something.
  -- Razorice buff/stack.
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 57,
    debuff = 51714,
    barcolors = {
     debuffmine  = {050/255, 101/255, 202/255, 0.7}
     },
  })
]]

  -- Breath of Sindragosa
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 21,
    cooldown = 152279,
    playerbuff = 152279,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {050/255, 090/255, 111/255, 0.7}
     },
  })

  -- Empower Rune Weapon
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 57,
    recharge = 47568,
    barcolors = {
     cooldown    = {070/255, 252/255, 252/255, 0.5},
     playerbuff  = {070/255, 252/255, 252/255, 0.7}
     },
  })

  -- Frostwyrm's Fury
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 18,
    cooldown = 279302,
    playerbuff = 279302,
    barcolors = {
     cooldown    = {070/255, 252/255, 252/255, 0.5},
     playerbuff  = {070/255, 252/255, 252/255, 0.7}
     },
  })

  -- Remove the --[[ and ]]-- from any of the damage reduction spells you'd like to track in Frost spec.
--[[
  -- Anti-Magic Shell
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 57,
    cooldown = 48707,
    playerbuff = 48707,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {212/255, 242/255, 040/255, 0.7}
     },
  })
]]--

--[[
  -- Icebound Fortitude
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 57,
    cooldown = 48792,
    playerbuff = 48792,
  })
]]--

  -- Unholy

  -- Virulent Plague without Ebon Fever
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 19,
    requiredTalentUnselected = 5,
    debuff = {191587, 3},
    refreshable = true,
    cooldown = 49206,
    smallCooldown = true,
    barcolors = {
     cooldown    = {202/255, 161/255, 050/255, 0.7},
     debuffmine  = {181/255, 232/255, 090/255, 0.6}
     },
  })

  -- Virulent Plague without Ebon Fever & Unholy Frenzy CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 20,
    requiredTalentUnselected = 5,
    debuff = {191587, 3},
    refreshable = true,
    cooldown = 207289,
    smallCooldown = true,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     debuffmine  = {181/255, 232/255, 090/255, 0.6}
     },
  })

  -- Virulent Plague without Ebon Fever & Summon Gargoyle CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 21,
    requiredTalentUnselected = 5,
    debuff = {191587, 3},
    refreshable = true,
    cooldown = 49206,
    smallCooldown = true,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     debuffmine  = {181/255, 232/255, 090/255, 0.6}
     },
  })

  -- Virulent Plague with Ebon Fever
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {5, 19},
    debuff = {191587, 1.5},
    refreshable = true,
    barcolors = {
     debuffmine  = {181/255, 232/255, 090/255, 0.6}
     },
  })

  -- Virulent Plague with Ebon Fever & Unholy Frenzy CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {5, 20},
    debuff = {191587, 1.5},
    refreshable = true,
    cooldown = 207289,
    smallCooldown = true,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     debuffmine  = {181/255, 232/255, 090/255, 0.6}
     },
  })

  -- Virulent Plague with Ebon Fever & Summon Gargoyle CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredTalent = {5, 21},
    debuff = {191587, 1.5},
    refreshable = true,
    cooldown = 49206,
    smallCooldown = true,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     debuffmine  = {181/255, 232/255, 090/255, 0.6}
     },
  })

  -- Festering Strike & Apocalypse CD at half height.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 57,
    debuff = 194310,
    cooldown = 275699,
    smallCooldown = true,
    barcolors = {
     cooldown    = {202/255, 161/255, 050/255, 0.7},
     debuffmine  = {222/255, 080/255, 242/255, 0.5}
     },
  })

  -- Death and Decay cooldown at half height, D&D, Sudden Doom and Dark Succor buffs. The icon changes but bar colour can't (yet?).
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 74,
    requiredTalentUnselected = 17,
    cooldown = 43265,
    smallCooldown = true,
    playerbuff = {{49530}, {101568}, {188290}},
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {080/255, 010/255, 151/255, 0.7}
     },
  })

  -- Defile cooldown at half height, D&D, Sudden Doom and Dark Succor buffs. The icon changes but bar colour can't (yet?).
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 17,
    cooldown = 152280,
    smallCooldown = true,
    playerbuff = {{49530}, {101568}, {188290}},
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {080/255, 010/255, 151/255, 0.7}
     },
  })

  -- Unholy Blight
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 6,
    cooldown = 115989,
    playerbuff = 115989,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.4},
     playerbuff  = {151/255, 151/255, 151/255, 0.5}
     },
  })

  -- Soul Reaper
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 12,
    cooldown = 130736,
    playerbuff = 130736,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {050/255, 101/255, 131/255, 0.7}
     },
  })

  -- Dark Transformation
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 74,
    cooldown = 63560,
    playerbuff = 63560,
    auraunit = "pet",
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {161/255, 131/255, 080/255, 0.7}
     },
  })

  -- Summon Gargoyle
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 21,
    cooldown = 49206,
    barcolors = {
     cooldown    = {040/255, 101/255, 121/255, 0.6},
     },
  })

  -- Remove the --[[ and ]]-- from any of the damage reduction spells you'd like to track in Unholy spec.
--[[  -- Anti-Magic Shell
  self:newSpell({
    requiredTree = 3,
    cooldown = 48707,
    playerbuff = 48707,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {212/255, 242/255, 040/255, 0.7}
     },
  })
]]--

--[[
  -- Icebound Fortitude
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 57,
    cooldown = 48792,
    playerbuff = 48792,
    barcolors = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {181/255, 232/255, 090/255, 0.7}
     },
  })
]]--

end
