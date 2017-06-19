local usemouseover = true -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.
function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 528 -- dispel magic
  self.config.hastedSpellID = {2006, 10}-- Resurrection

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
  })

  -- Purge the Wicked with Smite cast and Penance CD at half height.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 4,
    requiredTalent = 16,
    debuff = {204213, 2},
    refreshable = true,
    cast = {585, 186263},
    channel = 47540,
    cooldown = 47540,
    smallCooldown = true,
  })

  -- Schism
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    cast = 214621,
    cooldown = 214621,
  })

  -- Power Word: Solace
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 10,
    cooldown = 129250,
  })

  -- Divine star
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 17,
    cooldown = 110744,
  })

  -- Power Word: Radiance
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 52,
    recharge = 194509,
  })

  --Halo
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 18,
    cast = 120517,
    cooldown = 120517,
  })

  -- Mindbender
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 12,
    cooldown = 123040,
  })

  -- Light's Wrath
  self:newSpell({
    requiredTree = 1,
    requiredArtifactTalent = 207946,
    cast = 207946,
    cooldown = 207946,
  })

  -- Evangelism
    self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    cooldown = 246287,
  })

  -- Power Infusion
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 19,
    playerbuff = 10060,
    cooldown = 10060,
  })

  -- Shadowfiend
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 40,
    requiredTalentUnselected = 12,
    cooldown = 34433,
  })

  -- Atonement and Power World: Shield CD at half height.
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 8,
    playerbuff = 194384,
    auraunit = usemouseover and 'mouseover' or 'target',
    refreshable = true,
    cooldown = 17,
    smallCooldown = true,
  })

  -- Holy

  --Holy Fire
    self:newSpell({
    requiredTree = 2,
    cast = {585, 14914, 2060, 2061, 33076, 596, 32546},
    debuff = 14914,
    cooldown = 14914,
  })

  --Renew with Chastise CD at half height
  self:newSpell({
    requiredTree = 2,
    playerbuff = {139, 3},
    cooldown = 88625,
    smallCooldown = true,
    auraunit = target and 'mouseover' or 'target',
    refreshable = true,
  })

  --Prayer of Mending
  self:newSpell({
    requiredTree = 2,
    cooldown = 33076,
    auraunit = target and 'mouseover' or 'target',
  })

  -- Holy word : Serenity
  self:newSpell({
    requiredTree = 2,
    cooldown = 2050,
  })

  -- Holy word: Sanctify
  self:newSpell({
    requiredTree = 2,
    cooldown = 34861,
  })

  -- Circle of healing
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 21,
    cooldown = 204883,
  })

  --Halo
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 18,
    cast = 120517,
    cooldown = 120517,
  })

  -- Divine star
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 17,
    cooldown = 110744,
  })

  -- Shadow

  -- Vampiric Touch & Void Torrent channel and CD at half height.
  self:newSpell({
    requiredTree = 3,
    cast = 34914,
    channel = {205065, 4},
    debuff = {34914, 3},
    refreshable = true,
    cooldown = 205065,
    smallCooldown = true,
    recast = true,
    barcolors = {
      cooldown = {202/255, 161/255, 050/255, 0.7},
      channeltick= {232/255, 000/255, 000/255, 0.7},
      debuffmine = {000/255, 090/255, 101/255, 0.5}
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
    barcolors = {
      cooldown = {242/255, 020/255, 252/255, 0.9},
      casting = {242/255, 020/255, 252/255, 0.9},
      debuffmine = {252/255, 222/255, 030/255, 0.5}
    },
  })

  -- Mind Blast/Mind Flay
  self:newSpell({
    requiredTree = 3,
    cast = 8092,
    channel = {15407, 4},
    cooldown = 8092,
    playerbuff = 124430,
    icon = 8092,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      --casting = {232/255, 202/255, 232/255, 0.5},
      playerbuff = {252/255, 202/255, 121/255, 0.7},
      channeltick= {232/255, 000/255, 000/255, 0.7}
    },
  })

  -- Shadow Word: Death and Void Ray buff, if talent taken.
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 46,
    recharge = 32379,
    icon = 32379,
    playerbuff = 205371,
    barcolors = {
      recharge = {212/255, 000/255, 000/255, 0.7},
      playerbuff = {141/255, 050/255, 171/255, 0.4}
    },
  })

  -- Shadow Word: Void
  self:newSpell({
  requiredTree = 3,
  requiredTalent = 3,
  cast = 205351,
  recharge = 205351,
  barcolors = {
       recharge = {171/255, 131/255, 222/255, 0.6},
     },
  })

  -- Shadow Crash
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 20,
    cast = 205385,
    cooldown = 205385,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
    },
  })

  -- Power Infusion
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 16,
    playerbuff = 10060,
    cooldown = 10060,
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {252/255, 242/255, 050/255, 0.7}
    },
  })

  -- Shadowfiend / Mindbender
  self:newSpell({
    requiredTree = 3,
    cooldown = {200174, 34433},
    playerbuff = 63619,
    auraunit = 'none',
    barcolors = {
      cooldown = {171/255, 191/255, 181/255, 0.6},
      playerbuff = {191/255, 161/255, 202/255, 0.7}
    },
  })

end
