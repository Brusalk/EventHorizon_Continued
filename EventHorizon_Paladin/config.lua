local usemouseover = true -- Make this false or nil (or just delete the line altogether) to make your healing bars not change when you mouse over something.

function EventHorizon:InitializeClass()
  self.config.gcdSpellID = 19750 -- Flash of Light
  self.config.hastedSpellID = {7328,10} -- Redemption, probably not needed at all


  -- ---------------------------------------
  -- Holy
  -- ---------------------------------------

  -- Crusader Strike
   self:newSpell({
    requiredTree = 1,
    requiredTalent = 3,
    cooldown = 35395,
  })
  
  -- Judgment
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 18,
    cooldown = 20271,
    debuff = 196941,
  })

  -- Holy Shock
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 10,
    cooldown = 20473,
    keepIcon = true,
    cast = {20473, 19750, 82326},
  })

  -- Light of Dawn
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 40,
    cooldown = 85222,
  })

  -- Tyr's Deliverance
  self:newSpell({
    requiredTree = 1,
    requiredArtifactTalent = 200652,
    cooldown = 200652,
    playerbuff = 200652,
    auraunit = usemouseover and 'mouseover' or 'target',
  })
 
  -- Bestow Faith
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 1,
    cooldown = 223306,
  })

  -- Beacon of Virtue
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 21,
    cooldown = 200025,
    playerbuff = 200025,
    auraunit = usemouseover and 'mouseover' or 'target',
  })
  
  -- Holy Prism
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 15,
    cooldown = 114165,
  })
 
  -- Light's Hammer
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 2,
    cooldown = 114158,
  })

  -- Holy Avenger
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 14,
    cooldown = 105809,
    playerbuff = 105809,
  })
  
  -- Avenging Wrath
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 80,
    cooldown = 31842,
    playerbuff = 31842,
  })
  
  -- Aura Mastery
  self:newSpell({
    requiredTree = 1,
    requiredLevel = 70,
    cooldown = 31821,
    playerbuff = 31821,
  })
    
  -- Rule of Law
  self:newSpell({
    requiredTree = 1,
    requiredTalent = 6,
    playerbuff = 214202,
    recharge = 214202,
  })
  
 
  -- ---------------------------------------
  -- Protection
  -- ---------------------------------------

  -- Shield of the Righteous
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 20,
    playerbuff = 53600,
    recharge = 53600,
  })

  -- Consecration
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 14,
    cooldown = 26573,
    debuff = {204242,1},
    playerbuff = 188730,
  })

  -- Judgment
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 3,
    --cooldown = 20271,
    recharge = 20271,
  })

  -- Avenger's Shield
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 10,
    cooldown = 31935,
  })

    -- Hammer of the Righteous
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 10,
    requiredTalentUnselected = 2,
    recharge = 53595,
  })
  
  -- Blessed Hammer
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 2,
    -- debuff = 204301,
    recharge = 204019,
  })

    -- Eye of Tyr
  self:newSpell({
    requiredTree = 2,
    requiredArtifactTalent = 209202,
    cooldown = 209202,
    debuff = 209202,
  })

    -- Light of the Protector
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 40,
    requiredTalentUnselected = 13,
    cooldown = 184092,
  })
  
  -- Hand of the Protector
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 13,
    cooldown = 213652,
  })
  
--[[
  -- Knight Templar
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 14,
    playerbuff = 221886,
    recharge = 190784,
  })
]]--

    -- Seraphim
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 20,
    cooldown = 152262,
    playerbuff = 152262,
  })

  -- Avenging Wrath
  self:newSpell({
    requiredTree = 2,
    requiredLevel = 80,
    cooldown = 31884,
    playerbuff = 31884,
  })

  -- Bastion of Light
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 5,
    cooldown = 204035,
  })

--[[
  -- Blessing of Spellwarding
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 10,
    cooldown = 204018,
    playerbuff = 204018,
    auraunit = usemouseover and 'mouseover' or 'player',
  })
]]--

--[[
  -- Aegis of Light
  self:newSpell({
    requiredTree = 2,
    requiredTalent = 16,
    cooldown = 204150,
    playerbuff = 204150,
    auraunit = usemouseover and 'mouseover' or 'player',
  })
]]--


  -- ---------------------------------------
  -- Retribution
  -- ---------------------------------------

  -- Blade of Justice
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 18,
    cooldown = 184575,
    playerbuff = {{281178}, {326733}},
    barcolors   = {
     playerbuff  = {252/255, 222/255, 030/255, 0.5}
    },
  })

  -- Judgment
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 3,
    cooldown = 20271,
    debuff = {197277,0},
  })

  -- Crusader Strike
  self:newSpell({
    requiredTree = 3,
    recharge = 35395,
    playerbuff = 203316,
  })

  -- Hammer of Wrath
  self:newSpell({
    requiredTree = 3,
    cooldown = 24275,
    requiredLevel = 46,
  })

  -- Execution Sentence
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 3,
    cooldown = 343527,
    debuff = {343527,8},
    --hasted = true,
  })

  -- Wake of Ashes
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 39,
    cooldown = 255937,
    debuff = 255937,
  })

  -- Seraphim
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 15,
    cooldown = 152262,
    playerbuff = 152262,
  })

  -- Righteous Verdict
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 2,
    playerbuff = 267610,
  })

  -- Seraphim
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 21,
    cooldown = 343721,
    debuffmine = 343721,
  })

  --[[ Azerite Essence
  self:newSpell({
    requiredTree = 3,
    cooldown = {295373, 295258, 310690, 298452, 295186},
    barcolors = {
      playerbuff  = {211/255, 171/255, 211/255, 0.8},
    }
  })]]
 
  -- Divine Purpose
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 13,
    playerbuff = 223817,
  })

  -- Avenging Wrath
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 37,
    requiredTalentUnselected = 20,
    cooldown = 31884,
    playerbuff = 31884,
  })

  -- Crusade
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 20,
    cooldown = 231895,
    playerbuff = 231895,
  })

  -- Holy Avenger
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 14,
    cooldown = 105809,
    playerbuff = 105809,
  })

  -- Consecration (almost useless)
  self:newSpell({
    requiredTree = 3,
    cooldown = 26573,
  })


  -- Retribution Survivability Abilities and Talents


  --[[ Divine Shield
  self:newSpell({
    requiredTree = 3,
    requiredLevel = 18,
    cooldown = 642,
    playerbuff = 642,
  })]]

--[[
  -- Shield of Vengeance
  self:newSpell({
    requiredTree = 3,
    cooldown = 184662,
    playerbuff = 184662,
  })
]]--

--[[
  -- Eye for an Eye
  self:newSpell({
    requiredTree = 3,
    requiredTalent = 14,
    cooldown = 205191,
    playerbuff = 205191,
  })
]]--



  -- Situational CC spells, not included by default.
--[[
  -- Repentance
  self:newSpell({
    requiredTree = 1,2,3,
    requiredTalent = 8,
    cooldown = 20066,
  })
]]--

--[[
  -- Blinding Light
  self:newSpell({
    requiredTree = 1,2,3,
    requiredTalent = 9,
    cooldown = 115750,
  })
]]--

end
