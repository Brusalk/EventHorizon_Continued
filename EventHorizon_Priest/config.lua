local usemouseover = true -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.
function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 528 -- dispel magic
  self.config.hastedSpellID = {2006, 10}-- Resurrection
  self.config.past = -1.5 -- Number of seconds to show in the past. Default = -3
  self.config.future = 12 -- Number of seconds to show in the future. Default = 12

  -- Discipline

  -- Shadow Word: Pain with Smite cast and Penance CD at half height.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 4,
    requiredTalentUnselected = 16,
    debuff = {589, 2},
    refreshable = true,
    cast = {585, 186263},
    channel = 47540,
    cooldown = 47540,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.9},
     debuffmine  = {252/255, 222/255, 030/255, 0.5}
     },
  })

  -- Purge the Wicked with Smite cast and Penance CD at half height.
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 16,
    debuff = {204213, 1.5},
    refreshable = true,
    cast = {585, 186263},
    channel = 47540,
    cooldown = 47540,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.9},
     debuffmine  = {252/255, 222/255, 030/255, 0.5}
     },
  })

  -- Power Word: Solace
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 9,
    cooldown = 129250,
  })

  -- Schism
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    debuff = 214621,
    cast = 214621,
    cooldown = 214621,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     debuffmine  = {252/255, 151/255, 222/255, 0.6}
     },
  })

  -- Shadow Covenant
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 15,
    cooldown = 204065,
    debuff = 204065,
    auraunit = usemouseover and 'mouseover' or 'target',
     barcolors   = {
     debuffmine  = {030/255, 010/255, 111/255, 0.7},
     cooldown    = {141/255, 080/255, 252/255, 0.3},
     },
  })

  -- Divine star
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 17,
    cooldown = 110744,
     barcolors   = {
     cooldown    = {232/255, 232/255, 121/255, 0.4},
     },
  })

  -- Power Word: Radiance with Atonement buff.  Not really sure this is worth tracking at all, I think it's a raid frame and/or WA thing to track but this way it isn't another bar.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 52,
    recharge = 194509,
    playerbuff = 194384,
    cast = 194509,
    auraunit = usemouseover and 'mouseover' or 'target',
     barcolors   = {
     recharge    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {070/255, 222/255, 121/255, 0.7}
     },
  })

  --Halo
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 18,
    cast = 120517,
    cooldown = 120517,
     barcolors   = {
     cooldown    = {232/255, 232/255, 121/255, 0.4},
     },
  })

  -- Mindbender
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 8,
    cooldown = 123040,
  })

  -- Evangelism
    self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    cooldown = 246287,
     barcolors   = {
     cooldown    = {242/255, 181/255, 131/255, 0.4}
     },
  })

  -- Shadowfiend
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 40,
    requiredTalentUnselected = 8,
    cooldown = 34433,
  })

  --[[ Atonement
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 8,
    playerbuff = 194384,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
  })
]]

  -- Holy

  --Holy Fire
    self:newSpell({
    requiredTree = 2,
    cast = {585, 14914, 2060, 2061, 33076, 596, 32546},
    debuff = {14914, 1},
    cooldown = 14914,
    icon = 14914,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     debuffmine  = {252/255, 202/255, 121/255, 0.7},
     },
  })

  -- Divine star
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 17,
    cooldown = 110744,
     barcolors   = {
     cooldown    = {232/255, 232/255, 121/255, 0.4},
     },
  })

  --Renew with Holy Word: Chastise CD at half height
  self:newSpell({
    requiredTree = 2,
    playerbuff = 114255,
    cooldown = 88625,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {222/255, 090/255, 090/255, 0.8},
     playerbuff  = {252/255, 202/255, 020/255, 0.5},
     },
  })

  --Prayer of Mending
  self:newSpell({
    requiredTree = 2,
    playerbuff = {139, 3},
    refreshable = true,
    auraunit = usemouseover and 'mouseover' or 'target',
    cooldown = 33076,
--    smallCooldown = true,
    icon = 33076,
     barcolors   = {
     cooldown    = {232/255, 232/255, 121/255, 0.9},
     playerbuff  = {111/255, 242/255, 121/255, 0.4}
     },
  })

  -- Circle of healing
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 15,
    cooldown = 204883,
  })

  -- Holy word : Serenity
  self:newSpell({
    requiredTree = 2,
    cooldown = 2050,
     barcolors   = {
     cooldown    = {151/255, 242/255, 252/255, 0.5},
     },
  })

  -- Holy word: Sanctify
  self:newSpell({
    requiredTree = 2,
    cooldown = 34861,
     barcolors   = {
     cooldown    = {252/255, 252/255, 111/255, 0.6},
     },
  })

  --Halo
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 18,
    cast = 120517,
    cooldown = 120517,
     barcolors   = {
     cooldown    = {232/255, 232/255, 121/255, 0.4},
     },
  })

  -- Shadow

  -- Devouring Plague
  self:newSpell({
    requiredTree = 3,
    cast = 335467,
    debuff = {335467, 3},
    refreshable = true,
    smallCooldown = true,
    recast = true,
     barcolors   = {
     cooldown    = {202/255, 161/255, 050/255, 0.7},
     channeltick = {232/255, 000/255, 000/255, 0.7},
     debuffmine  = {000/255, 090/255, 101/255, 0.5}
     },
  })

  -- Vampiric Touch & Void Torrent channel and CD at half height if you took the talent.
  self:newSpell({
    requiredTree = 3,
    cast = 34914,
    channel = {205065, 4},
    debuff = {34914, 3},
    refreshable = true,
    cooldown = 263165,
    smallCooldown = true,
    recast = true,
     barcolors   = {
     cooldown    = {202/255, 161/255, 050/255, 0.7},
     channeltick = {232/255, 000/255, 000/255, 0.7},
     debuffmine  = {000/255, 090/255, 101/255, 0.5}
     },
  })

  -- Shadow Word: Pain & Void Bolt CD.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 4,
    debuff = {589, 3},
    cast = 228260,
    cooldown = 205448,
    smallCooldown = true,
     barcolors   = {
     cooldown    = {242/255, 020/255, 252/255, 0.9},
     casting     = {242/255, 020/255, 252/255, 0.9},
     debuffmine  = {252/255, 222/255, 030/255, 0.5}
     },
  })

  -- Mind Blast CD with Mind Flay/Sear channel and Shadowy Insight proc if selected (instant MB).
  self:newSpell({
    requiredTree = 3,
    requiredTalentUnselected = 3,
    cast = 8092,
    channel = {{15407, 4}, {48045,4}},
    cooldown = 8092,
    playerbuff = 124430,
    icon = 8092,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {252/255, 202/255, 121/255, 0.7},
     channeltick = {232/255, 000/255, 000/255, 0.7}
     },
  })

  -- Shadow Word: Void recharge with Mind Flay/Sear channel and Shadowy Insight proc if selected (instant SW:V).
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 3,
    cast = 205351,
    channel = {{15407, 4}, {48045,4}},
    recharge = 205351,
    playerbuff = 124430,
    icon = 8092,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.6},
     playerbuff  = {252/255, 202/255, 121/255, 0.7},
     channeltick = {232/255, 000/255, 000/255, 0.7}
     },
  })

  -- Shadow Word: Death
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 14,
    recharge = 32379,
    icon = 32379,
     barcolors    = {
     recharge     = {212/255, 000/255, 000/255, 0.7},
     },
  })

  -- Shadow Crash
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 15,
    cast = 205385,
    cooldown = 205385,
    barcolors    = {
      cooldown   = {171/255, 191/255, 181/255, 0.6},
    },
  })

  -- Dark Void
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 9,
    cast = 263346,
    cooldown = 263346,
     barcolors   = {
     cooldown    = {171/255, 131/255, 222/255, 0.6},
     },
  })

  -- Shadowfiend / Mindbender with Voidform buff, for the stack count, plus Lingering Sanity, also for the stack count.
  self:newSpell({
    requiredTree = 3,
    playerbuff =  {{194249}, {197937}},
    cooldown = {200174, 34433},
    smallCooldown = true,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     playerbuff  = {252/255, 151/255, 222/255, 0.4}
     },
  })

  -- Dark Ascention
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 20,
    cooldown = 280711,
     barcolors   = {
     cooldown    = {171/255, 191/255, 181/255, 0.7},
     },
  })

end
