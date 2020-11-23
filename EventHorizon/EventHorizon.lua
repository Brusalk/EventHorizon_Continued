local EHN,ns = ...
EventHorizon = ns

local class = select(2,UnitClass('player'))
local playername = UnitName('player')..' - '..GetRealmName('player')

local Cataclysm = select(4,GetBuildInfo()) >= 40000
local Mop = select(4,GetBuildInfo()) >= 50000
local Wod = select(4,GetBuildInfo()) >= 60000
local Legion = select(4,GetBuildInfo()) >= 70000
local BFA = select(4,GetBuildInfo()) >= 80000
local Shadowlands = select(4, GetBuildInfo()) >= 90000

local DEBUG = false
local spellIDsEnabled = DEBUG -- Toggles display of spellIDs in tooltips. Useful for working on spell configs

-- Wod Changes
local _GetSpellInfo, _GetTalentInfo, _GetNumTalents, _GetAddOnInfo = GetSpellInfo, GetTalentInfo, GetNumTalents, GetAddOnInfo
local GetSpellInfo, GetTalentInfo, GetNumTalents, GetAddOnInfo = _GetSpellInfo, _GetTalentInfo, _GetNumTalents, _GetAddOnInfo
if Wod then
  GetSpellInfo = function(...)
    local name, rank, icon, castingTime, minRange, maxRange = _GetSpellInfo(...)
    return name, rank, icon, nil, nil, nil, castingTime, minRange, maxRange
  end

  GetTalentInfo = function(talentIndex, isInspect, talentGroup, inspectedUnit, classID)
    local tier = math.floor((talentIndex-1)/3 + 1)
    local column = (talentIndex-1)%3 + 1
    -- nameTalent, icon, tier, column, active
    local _, name, icon, selected, selectable = _GetTalentInfo(tier, column, talentGroup or GetActiveSpecGroup(), inspectedUnit, nil)
    return name, icon, tier, column, selected
  end

  GetNumTalents = function()
    if Wod then
      return 21
    else
      return 18
    end
  end

  GetAddOnInfo = function(id_or_name)
    if type(id_or_name) == "number" then
      return _GetAddOnInfo(id_or_name)
    else
      for i=1, GetNumAddOns() do
        local name, title, notes, enabled, loadable, reason, security_clearance = _GetAddOnInfo(i)
        if name == id_or_name then
          return name, title, notes, enabled, loadable, reason, security_clearance
        end
      end
    end
    return
  end
end

ns.wodf = {
    ["GetSpellInfo"] = GetSpellInfo,
    ["GetTalentInfo"] = GetTalentInfo,
    ["GetNumTalents"] = GetNumTalents,
    ["GetAddOnInfo"] = GetAddOnInfo,
}

local WodStatusText = ""
if Wod then
  WodStatusText = WodStatusText .. "This is a beta release of the WoD version of EventHorizon. As such, expect there to be bugs. "
else
  WodStatusText = WodStatusText .. "This is the backwards compatible version of the WoD beta version of EventHorizon. "
end
WodStatusText = WodStatusText .. "If you encounter a bug, please copy the whole error message including stack trace and tell me about it on EventHorizon's WowInterface page. \n\n"
WodStatusText = WodStatusText .. "I only play a few specs, so most of these configs are my best guess given a few hours on beta and training dummies. \n"
WodStatusText = WodStatusText .. "If you're interested in helping me out with improving class configurations, please don't hesitate to let me know on EventHorizon's WowInterface page. \n\n  Thanks! ^.^ \n - Brusalk \n\n"

-- Legion API Changes

local _GetSpellInfo, _GetTalentInfo, _GetNumTalents, _GetAddOnInfo = GetSpellInfo, GetTalentInfo, GetNumTalents, GetAddOnInfo
local GetSpellInfo, GetTalentInfo, GetNumTalents, GetAddOnInfo = _GetSpellInfo, _GetTalentInfo, _GetNumTalents, _GetAddOnInfo

local LegionStatusText = ""

LegionStatusText = LegionStatusText .. "If you encounter a bug, please copy the whole error message including stack trace and tell me about it on EventHorizon's WowInterface page. \n\n"
LegionStatusText = LegionStatusText .. "I don't plan on updating every individual class config for every spec. It takes me weeks to play every class and spec to a level I feel comfortable with enough to set the default config for, and I don't have time for that anymore. \n"
LegionStatusText = LegionStatusText .. "If you have a class config that you think is good enough for your spec or class, please post it to EventHorizon's WowInterface page so I can add it! \n\n  Thanks! ^.^ \n - Brusalk \n\n"



local LegionSpecIDMapping = {
  [62] = "Mage: Arcane",
  [63] = "Mage: Fire",
  [64] = "Mage: Frost",
  [65] = "Paladin: Holy",
  [66] = "Paladin: Protection",
  [70] = "Paladin: Retribution",
  [71] = "Warrior: Arms",
  [72] = "Warrior: Fury",
  [73] = "Warrior: Protection",
  [102] = "Druid: Balance",
  [103] = "Druid: Feral",
  [104] = "Druid: Guardian",
  [105] = "Druid: Restoration",
  [250] = "Death Knight: Blood",
  [251] = "Death Knight: Frost",
  [252] = "Death Knight: Unholy",
  [253] = "Hunter: Beast Mastery",
  [254] = "Hunter: Marksmanship",
  [255] = "Hunter: Survival",
  [256] = "Priest: Discipline",
  [257] = "Priest: Holy",
  [258] = "Priest: Shadow",
  [259] = "Rogue: Assassination",
  [260] = "Rogue: Outlaw",
  [261] = "Rogue: Subtlety",
  [262] = "Shaman: Elemental",
  [263] = "Shaman: Enhancement",
  [264] = "Shaman: Restoration",
  [265] = "Warlock: Affliction",
  [266] = "Warlock: Demonology",
  [267] = "Warlock: Destruction",
  [268] = "Monk: Brewmaster",
  [269] = "Monk: Windwalker",
  [270] = "Monk: Mistweaver",
  [577] = "Demon Hunter: Havoc",
  [581] = "Demon Hunter: Vengeance",
}

local LegionClassesNotImplemented = {
  [64] = true,
  [268] = true,
  [270] = true,
}


local BuildLegionClassConfigStatusText = function()
  local ret = "EventHorizon\nCurrent Class Status \n\n"
  for specID, classname in pairs(LegionSpecIDMapping) do
    local id, name, desc, icon, background, role, class = GetSpecializationInfoByID(specID)
    if LegionClassesNotImplemented[specID] then
      ret = ret .. name .. " | NYI \n"
    end
  end
  ret = ret .. "\nIf your spec is Not Yet Implemented (NYI), please send me your customized config via WoWInterface or the Discord server, so I can add it as the default config for your spec!\n"
  return ret
end

-- BFA Alpha
local BFAStatusText = ""

BFAStatusText = BFAStatusText .. "Welcome to EventHorizon for BFA -- This is a beta release, so expect bugs and things not to work. Also, it is highly likely your class config has not been updated."
BFAStatusText = BFAStatusText .. "If you do encounter a bug, please copy the whole error message including stack trace and post it in EventHorizon's discord \n\n"
BFAStatusText = BFAStatusText .. "Just like Legion, it takes me weeks to play every class and spec to a level I feel comfortable with enough to set the default config for, and I likely will not have the time to do that for every spec before launch \n"
BFAStatusText = BFAStatusText .. "If you have an updated class config for your spec, please post it to EventHorizon's Discord so I can add it! \n\n  Thanks!\n - Brusalk \n\n"



local BFASpecIDMapping = {
  [62] = "Mage: Arcane",
  [63] = "Mage: Fire",
  [64] = "Mage: Frost",
  [65] = "Paladin: Holy",
  [66] = "Paladin: Protection",
  [70] = "Paladin: Retribution",
  [71] = "Warrior: Arms",
  [72] = "Warrior: Fury",
  [73] = "Warrior: Protection",
  [102] = "Druid: Balance",
  [103] = "Druid: Feral",
  [104] = "Druid: Guardian",
  [105] = "Druid: Restoration",
  [250] = "Death Knight: Blood",
  [251] = "Death Knight: Frost",
  [252] = "Death Knight: Unholy",
  [253] = "Hunter: Beast Mastery",
  [254] = "Hunter: Marksmanship",
  [255] = "Hunter: Survival",
  [256] = "Priest: Discipline",
  [257] = "Priest: Holy",
  [258] = "Priest: Shadow",
  [259] = "Rogue: Assassination",
  [260] = "Rogue: Outlaw",
  [261] = "Rogue: Subtlety",
  [262] = "Shaman: Elemental",
  [263] = "Shaman: Enhancement",
  [264] = "Shaman: Restoration",
  [265] = "Warlock: Affliction",
  [266] = "Warlock: Demonology",
  [267] = "Warlock: Destruction",
  [268] = "Monk: Brewmaster",
  [269] = "Monk: Windwalker",
  [270] = "Monk: Mistweaver",
  [577] = "Demon Hunter: Havoc",
  [581] = "Demon Hunter: Vengeance",
}

local BFAClassesNotImplemented = {
  [62] = "Mage: Arcane",
  [63] = "Mage: Fire",
  [64] = "Mage: Frost",
  [65] = "Paladin: Holy",
  [66] = "Paladin: Protection",
  [70] = "Paladin: Retribution",
  [73] = "Warrior: Protection",
  [253] = "Hunter: Beast Mastery",
  [254] = "Hunter: Marksmanship",
  [255] = "Hunter: Survival",
  [262] = "Shaman: Elemental",
  [263] = "Shaman: Enhancement",
  [264] = "Shaman: Restoration",
  [265] = "Warlock: Affliction",
  [266] = "Warlock: Demonology",
  [267] = "Warlock: Destruction",
  [577] = "Demon Hunter: Havoc",
  [581] = "Demon Hunter: Vengeance",
}


local BuildBFAClassConfigStatusText = function()
  local ret = "EventHorizon - BFA Alpha Release\nCurrent Class Status \n\n"
  for specID, classname in pairs(BFASpecIDMapping) do
    local id, name, desc, icon, background, role, class = GetSpecializationInfoByID(specID)
    if BFAClassesNotImplemented[specID] then
      ret = ret .. name .. " | NYI \n"
    end
  end
  ret = ret .. "\nIf your spec is Not Yet Implemented (NYI), please send me your customized config via Discord, so I can add it as the default config for your spec!\n"
  return ret
end

-- Shadowlands Changes
local _CreateFrame = CreateFrame
local CreateFrame = _CreateFrame
if Shadowlands then
  CreateFrame = function(frameType, frameName, parentFrame, inheritsFrame)
    if not inheritsFrame then
      -- Frames must inherit from the backdrop mixin in order to have the backdrop-associated APIs now
      inheritsFrame = "BackdropTemplate"
    end
    return _CreateFrame(frameType, frameName, parentFrame, inheritsFrame)
  end
end

local ShadowlandsStatusText = ""

ShadowlandsStatusText = ShadowlandsStatusText .. "Welcome to EventHorizon for Shadowlands -- This is a beta release, but things should work. "
ShadowlandsStatusText = ShadowlandsStatusText .. "If you do encounter a bug, please copy the whole error message including stack trace and post it in EventHorizon's discord \n\n"
ShadowlandsStatusText = ShadowlandsStatusText .. "Just like BFA, I won't be able to update spec configs to the quality bar I expect of myself. \n"
ShadowlandsStatusText = ShadowlandsStatusText .. "If you have an updated class config for your spec, please post it to EventHorizon's Discord so I can add it! \n\n  Thanks!\n - Discord: Brusalk#2615 \n\n"

local ShadowlandsSpecIDMapping = {
  [62] = "Mage: Arcane",
  [63] = "Mage: Fire",
  [64] = "Mage: Frost",
  [65] = "Paladin: Holy",
  [66] = "Paladin: Protection",
  [70] = "Paladin: Retribution",
  [71] = "Warrior: Arms",
  [72] = "Warrior: Fury",
  [73] = "Warrior: Protection",
  [102] = "Druid: Balance",
  [103] = "Druid: Feral",
  [104] = "Druid: Guardian",
  [105] = "Druid: Restoration",
  [250] = "Death Knight: Blood",
  [251] = "Death Knight: Frost",
  [252] = "Death Knight: Unholy",
  [253] = "Hunter: Beast Mastery",
  [254] = "Hunter: Marksmanship",
  [255] = "Hunter: Survival",
  [256] = "Priest: Discipline",
  [257] = "Priest: Holy",
  [258] = "Priest: Shadow",
  [259] = "Rogue: Assassination",
  [260] = "Rogue: Outlaw",
  [261] = "Rogue: Subtlety",
  [262] = "Shaman: Elemental",
  [263] = "Shaman: Enhancement",
  [264] = "Shaman: Restoration",
  [265] = "Warlock: Affliction",
  [266] = "Warlock: Demonology",
  [267] = "Warlock: Destruction",
  [268] = "Monk: Brewmaster",
  [269] = "Monk: Windwalker",
  [270] = "Monk: Mistweaver",
  [577] = "Demon Hunter: Havoc",
  [581] = "Demon Hunter: Vengeance",
}

local ShadowlandsClassesNotImplemented = {
  [65] = "Paladin: Holy",
  [66] = "Paladin: Protection",
  [71] = "Warrior: Arms",
  [72] = "Warrior: Fury",
  [73] = "Warrior: Protection",
  [250] = "Death Knight: Blood",
  [251] = "Death Knight: Frost",
  [252] = "Death Knight: Unholy",
  [253] = "Hunter: Beast Mastery",
  [254] = "Hunter: Marksmanship",
  [255] = "Hunter: Survival",
  [256] = "Priest: Discipline",
  [257] = "Priest: Holy",
  [262] = "Shaman: Elemental",
  [263] = "Shaman: Enhancement",
  [264] = "Shaman: Restoration",
  [268] = "Monk: Brewmaster",
  [269] = "Monk: Windwalker",
  [270] = "Monk: Mistweaver",
  [577] = "Demon Hunter: Havoc",
  [581] = "Demon Hunter: Vengeance",
}


local BuildShadowlandsClassConfigStatusText = function()
  local ret = "EventHorizon - Shadowlands Alpha Release\nCurrent Class Status \n\n"
  for specID, classname in pairs(ShadowlandsSpecIDMapping) do
    local id, name, desc, icon, background, role, class = GetSpecializationInfoByID(specID)
    if ShadowlandsClassesNotImplemented[specID] then
      ret = ret .. name .. " | NYI \n"
    end
  end
  ret = ret .. "\nIf your spec is Not Yet Implemented (NYI), please send me your customized config via Github or Discord, so I can add it as the default config for your spec!\n"
  return ret
end


ns.defaultDB = {
  point = {'CENTER', 'UIParent', 'CENTER'},
  isActive = true,
  version = 4,
}

ns.defaultDBG = {
  profiles = {
    default = {},
  },
  itemInfo = {},
  profilePerChar = {},
  defaultProfile = 'default',
  version = 4,
}

ns.db = {
  point = {'CENTER', 'UIParent', 'CENTER'},
  isActive = true,
  version = 4,
}

ns.frames = {
  config = {},  -- validated barframe config entries - format = ns.frames.config[i] = {barconfig}
  frames = {},  -- all loaded barframes
  active = {},  -- refs to barframes currently collecting information (matches talent spec)
  shown = {},    -- refs to barframes currently visible to the player (matches stance)
  mouseover = {},  -- refs to barframes requiring mouseover target information
}
ns.defaultconfig = {
  showTrinketBars = {
    default = true,
    boolean = true,
    name = 'Show Trinket Bars',
    desc = 'When enabled, displays trinkets in addition to spells and abilities.',
  },
  castLine = {
    default = true,
    boolean = true,
    number = true,
    name = 'End-of-Cast Line',
    desc = 'When enabled, adds a vertical line which marks the end of any spellcast in progress.',
  },
  gcdStyle = {
    default = 'line',
    valid = {'line','bar',false},
    name = 'Global Cooldown Style',
    desc = 'When set to Line, a vertical line will mark the end of the current GCD. \n When set to Bar, a textured bar is used instead. \n Can also be disabled to neither track or display the GCD.',
  },

  enableRedshift = {
    default = false,
    boolean = true,
    name = 'Enable Redshift',
    desc = 'An optional module which hides Axis untless certain conditions, such as combat or targeting, are met.',
  },
  Redshift = {
    name = 'Redshift States',
    desc = 'Conditions for the Redshift Module to show Axis.',
    sub = {
      showCombat = {
        default = true,
        boolean = true,
        name = 'Show in Combat',
        desc = 'When enabled, displays Axis when in combat.',
      },
      showHarm = {
        default = true,
        boolean = true,
        name = 'Show Harmful Units',
        desc = 'When enabled, displays Axis when an attackable unit is targeted.',
      },
      showHelp = {
        default = false,
        boolean = true,
        name = 'Show Helpful Units',
        desc = 'When enabled, displays Axis when a friendly unit is targeted.',
      },
      showBoss = {
        default = true,
        boolean = true,
        name = 'Show on Boss',
        desc = 'When enabled, displays Axis when a boss-level unit is targeted.',
      },
      showFocus = {
        default = false,
        boolean = true,
        name = 'Show on Focus',
        desc = 'When enabled, displays Axis when you have a focus target.'
      },
      hideVehicle = {
        default = true,
        boolean = true,
        name = 'Hide in Vehicle',
        desc = 'When enabled, HIDES Axis when using a vehicle with its own actionbar.',
      },
      hideVitals = {
        default = true,
        boolean = true,
        name = 'Hide Vitals',
        desc = 'When enabled, the Vitals display is hidden whenever Axis is hidden.',
      },
    },
  },

--      Pulse = 0.5,
--      PulseIntensity = 0.5,
--      PulseFPS = 30,

  Lines = {
    default = false,
    boolean = true,
    table = true,
    name = 'Static Lines',
    desc = 'When enabled, enables the Lines Module.',
  },
  LinesColor = {
    default = {1,1,1,0.5},
    table = true,
    name = 'Static Line Colors',
    desc = 'The color of any static lines being displayed by the Lines Axis Module.'
  },

  anchor = {
    default = {"TOPRIGHT", "EventHorizonHandle", "BOTTOMRIGHT"},
    table = true,
    name = 'Anchor Position',
    desc = "Axis' Handle Information",
  },
  width = {
    default = 150,
    number = true,
    name = 'Bar Width',
    desc = 'Set the width of shown bars. Icons add to the actual width of the window.'
  },
  height = {
    default = 18,
    number = true,
    name = 'Bar Height',
    desc = 'Set the height of each individual bar. Also sets the width of icons.',
  },
  spacing = {
    default = 0,
    number = true,
    name = 'Bar Spacing',
    desc = 'Set the spacing between each shown bar.',
  },
  staticheight = {
    default = false,
    number = true,
    boolean = true,
    name = 'Static Height',
    desc = 'When set, Axis will resize its bars to fit this height. \n When disabled, Axis will grow or shrink depending on the number of shown bars.'
  },
  hideIcons = {
    default = false,
    boolean = true,
    name = 'Hide Bar Icons',
    desc = 'When enabled, Icons are not shown, however stack-text is still shown.',
  },

  past = {
    default = -3,
    number = true,
    name = 'Past Time',
    desc = 'How many seconds in the past for Axis to display.',
  },
  future = {
    default = 12,
    number = true,
    name = 'Future Time',
    desc = 'How many seconds in the future for Axis to display.'
  },

  texturedbars = {
    default = true,
    boolean = true,
    name = 'Textured Bars',
    desc = 'When enabled, Axis displays textured bars according to the Bar Texture option. \n When disabled, Axis displays the bars as a solid color.',
  },

  bartexture = {
    default = "Interface\\Addons\\EventHorizon\\Smooth",
    string = true,
    name = 'Bar Texture',
    desc = 'Set the texture to use for each bar.',
  },
  texturealphamultiplier = {
    default = 2,
    number = true,
    name = 'Texture Alpha-Multiplier',
    desc = 'This option directly influences the opacity of textured bars to account for varying degrees of visibility.'
  },

  backdrop = {
    default = true,
    boolean = true,
    name = 'Show Backdrop',
    desc = 'When enabled, Axis displays the backdrop.',
  },
  padding = {
    default = 3,
    number = true,
    name = 'Backdrop Padding',
    desc = 'Set the padding between the backdrop and bar edges.'
  },
  bg = {
    default = "Interface\\ChatFrame\\ChatFrameBackground",
    string = true,
    name = 'Backdrop Texture',
    desc = 'Set the texture to use for the backdrop.',
  },
  border = {
    default = "Interface\\Tooltips\\UI-Tooltip-Border",
    string = true,
    name = 'Backdrop Border Texture',
    desc = 'Set the texture to use for the backdrop border.',
  },
  edgesize = {
    default = 8,
    number = true,
    name = 'Backdrop Edge Size',
    desc = 'Set the thickness of the backdrop border.',
  },
  inset = {
    default = {top = 2, bottom = 2, left = 2, right = 2},
    table = true,
    name = 'Backdrop Insets',
    desc = 'Trim the backdrop texture to account for its border.',
  },

  stackFont = {
    default = false,
    boolean = true,
    string = true,
    name = 'Stack Text Font',
    desc = 'Sets the font of the stack text shown on bar icons.',
  },
  stackFontSize = {
    default = false,
    boolean = true,
    number = true,
    name = 'Stack Text Size',
    desc = 'Set the size of the stack text shown on bar icons.',
  },
  stackFontOutline = {
    default = false,
    valid = {'OUTLINE','THICKOUTLINE','MONOCHROME',false},
    name = 'Stack Text Outline',
    desc = 'Set the outline of the stack text shown on bar icons.',
  },
  stackFontColor = {
    default = false,
    table = true,
    name = 'Stack Text Color',
    desc = 'Sets the color of the stack text shown on bar icons.',
  },
  stackFontShadow = {
    default = false,
    table = true,
    boolean = true,
    name = 'Stack Text Shadow',
    desc = 'Apply a shadow effect to the stack text shown on bar icons. \n This option adjusts the shadow color and can be left at default for black.',
  },
  stackFontShadowOffset = {
    default = false,
    table = true,
    boolean = true,
    name = 'Stack Text Shadow Offset',
    desc = 'Set the offset of the stack text shadow.',
  },
  stackOnRight = {
    default = false,
    boolean = true,
    name = 'Stack Text on Right',
    desc = 'When enabled the stack text is displayed on the right-hand side of the bars. \n When disabled, stack text is shown on the left side, as default.',
  },
}

ns.defaultcolors = {
  sent = {true,class == 'PRIEST' and 0.7 or 1,1},
  tick = {true,class == 'PRIEST' and 0.7 or 1,1},
  casting = {0,1,0.2,0.25},
  castLine = {0,1,0.2,0.3},
  cooldown = {0.6,0.8,1,0.3},
  debuffmine = {true,class == 'PRIEST' and 0.7 or 1,0.3},
  debuff = {true,0.5,0.3},
  playerbuff = {true,class == 'PRIEST' and 0.7 or 1,0.3},
  nowLine = {1,1,1,0.3},
  bgcolor = {0,0,0,0.6},
  bordercolor = {1,1,1,1},
  gcdColor = {1,1,1,0.5},
}

ns.defaultlayouts = {
  tick = {
    top = 0,
    bottom = 0.2,
  },
  smalldebuff = {
    top = 0.2,
    bottom = 0.35,
  },
  cantcast = {
    top = 0.35,
    bottom = 1,
  },
  default = {
    top = 0.2,
    bottom = 1,
  },
}

ns.config = {Redshift = {}, blendModes = {}}
ns.layouts = {}
ns.colors = {}

ns.otherIDs = {}    -- combatlog events either not directly tied to bars, or using spells other than bar.spellID
ns.modules = {}      -- storage for loaded modules - format = module = ns.modules[string.lower(moduleName)] = {namespace}


ns.vars = {        -- storage for widely used vars/math/etc - format = ns.vars[var] = val
  config = {},
  onepixelwide = 1,
  visibleFrame = true,
  numframes = 0,
  buff = {},
  debuff = {},
}
local vars = ns.vars

local UnitDebuff = UnitDebuff
local UnitBuff = UnitBuff

local SpellFrame = {}

local EventHorizonFrame = CreateFrame('Frame','EventHorizonFrame',UIParent)
local mainframe = CreateFrame('Frame',nil,EventHorizonFrame)
local frame = CreateFrame('Frame')
local frame2 = CreateFrame('Frame')
local frame3 = CreateFrame('Frame')
ns.mainframe = mainframe

-- Frames to be created on demand
local handle


local function printhelp(...) if select('#',...)>0 then return tostring((select(1,...))), printhelp(select(2,...)) end end

local function print(...)
  ChatFrame1:AddMessage('EventHorizon | '..strjoin(' | ',printhelp(...)))
end

local function debug(...)
  if DEBUG then
    print("DEBUG | ", ...)
  end
end

local draworder = {
  default = -8,
  cooldown = -7,
  debuff = -6,
  playerbuff = -5,
  debuffmine = -4,
  casting = -3,
  sent = -2,
  tick = -1,
  channeltick = 0,
  now = 1,
  gcd = 2,
  nowI = 7,
}

local auraids = {
  tick = true,
  cantcast = true,
  debuff = true,
  playerbuff = true,
  debuffmine = true,
}

local customColors = {
  debuff = true,
  debuffmine = true,
  playerbuff = true,
}

local exemptColors = {
  default = true,
  sent = true,
  tick = true,
  channeltick = true,
  castLine = true,
  nowLine = true,
  bgcolor = true,
  bordercolor = true,
  gcdColor = true,
}

local equipSlots = {
  ["ChestSlot"] = 5,
  ["FeetSlot"] = 8,
  ["Finger0Slot"] = 11,
  ["Finger1Slot"] = 12,
  ["HandsSlot"] = 10,
  ["HeadSlot"] = 1,
  ["LegsSlot"] = 7,
  ["MainHandSlot"] = 16,
  ["NeckSlot"] = 2,
  ["SecondaryHandSlot"] = 17,
  ["ShirtSlot"] = 4,
  ["ShoulderSlot"] = 3,
  ["TabardSlot"] = 19,
  ["Trinket0Slot"] = 13,
  ["Trinket1Slot"] = 14,
  ["WaistSlot"] = 6,
  ["WristSlot"] = 9,
}

local mainframeEvents = {
  ['COMBAT_LOG_EVENT_UNFILTERED'] = true,
  ['PLAYER_TALENT_UPDATE'] = true,
  ['ACTIVE_TALENT_GROUP_CHANGED'] = true,
  ['UPDATE_SHAPESHIFT_FORM'] = true,
  ['UPDATE_SHAPESHIFT_FORMS'] = true,
  ['SPELL_UPDATE_COOLDOWN'] = true,
  ['PLAYER_LEVEL_UP'] = true,
  ['PLAYER_TARGET_CHANGED'] = true,
  ['UNIT_AURA'] = true,
  ['PLAYER_TOTEM_UPDATE'] = true,
  ['PLAYER_ENTERING_WORLD'] = true,
}

local reloadEvents = {
  ['PLAYER_REGEN_DISABLED'] = true,
  ['PLAYER_REGEN_ENABLED'] = true,
  ['ZONE_CHANGED_NEW_AREA'] = true,
  ['ZONE_CHANGED_INDOORS'] = true,
  ['LFG_LOCK_INFO_RECEIVED'] = true,
  ['PLAYER_TALENT_UPDATE'] = true,
  ['ACTIVE_TALENT_GROUP_CHANGED'] = true,
  ['PLAYER_ENTERING_WORLD'] = true,
}

local tickevents = {
  ['SPELL_PERIODIC_DAMAGE'] = true,
  ['SPELL_PERIODIC_HEAL'] = true,
  ['SPELL_PERIODIC_ENERGIZE'] = true,
  ['SPELL_PERIODIC_DRAIN'] = true,
  ['SPELL_PERIODIC_LEACH'] = true,
  ['SPELL_DAMAGE'] = true,
  ['SPELL_HEAL'] = true,
  --['SPELL_AURA_APPLIED'] = true,
}

-- Dispatch event to method of the event's name.
local EventHandler = function (self, event, ...)
  local f = self[event]
  if f then
    --if event ~= 'COMBAT_LOG_EVENT_UNFILTERED' then print(event) end
    if event == 'COMBAT_LOG_EVENT' or event == 'COMBAT_LOG_EVENT_UNFILTERED' then
      -- I'm sorry Blizz, but this is kinda dumb...
      -- Even weirder is we don't get any sort of event ID to query with, we just have to call the method? Feels weird man
      return f(self, CombatLogGetCurrentEventInfo())
    end
    f(self,...)
    ns:ModuleEvent(event,...)
  end
end

local Clone = function (t)
  local new = {}
  local i, v = next(t, nil)  -- i is an index of t, v = t[i]
  while i do
    new[i] = v
    i, v = next(t, i)
  end
  return new
end

-- pairs(t) for metatable usage. Doesn't return numeric index unless value is keyless.
function mpairs(t)
  local visited = {}
  local f
  f = function(_, k)
    if not t then
      return
    end
    while true do
      local k2, v2 = next(t, k)
      if k2 == nil then
        break
      end
      if not visited[k2] then
        visited[k2] = true
        return k2, v2
      end
      k = k2
    end
    local mt = getmetatable(t)
    if mt then
      local indextable = mt.__index
      if type(indextable) == "table" then
        t = indextable
        return f()
      end
    end
    t = nil
  end
  return f
end

-- Since Blizzard doesn't provide the ability to look up a slot name from a slotID...
local GetSlotName = function (slot)
  for k, v in pairs(equipSlots) do
    if v == slot then return k end
  end
end

local mainframe_PLAYER_TOTEM_UPDATE = function( self, slot )
    for i, spellframe in pairs(ns.frames.frames) do
        if spellframe.totem then
            spellframe:PLAYER_TOTEM_UPDATE( slot )
            -- Totem Mastery doesn't populate immediately, so we delay.
            C_Timer.After( 0.1, function () spellframe:PLAYER_TOTEM_UPDATE( slot ) end )
        end
    end
end

local mainframe_UNIT_AURA = function (self,unit)
  if vars.buff[unit] then
    table.wipe(vars.buff[unit])
    for i = 1, 50 do
      local name, icon, count, _, duration, expirationTime, source, _, _, spellID = UnitBuff(unit,i)
      --print(name,icon,count,duration,expirationTime,source,spellID)
      if not (name and spellID) then break end
      table.insert(vars.buff[unit],{
        name = name,
        icon = icon,
        count = count,
        duration = duration,
        expirationTime = expirationTime,
        source = source,
        spellID = spellID,
      })
    end
  end
  if vars.debuff[unit] then
    table.wipe(vars.debuff[unit])
    for i = 1,100 do
      local name, icon, count, _, duration, expirationTime, source, _, _, spellID = UnitDebuff(unit,i)
      if not (name and spellID) then break end
      table.insert(vars.debuff[unit], {
        name = name,
        icon = icon,
        count = count,
        duration = duration,
        expirationTime = expirationTime,
        source = source,
        spellID = spellID,
      })
    end
  end
  for i,spellframe in pairs(ns.frames.frames) do
    if (spellframe.auraunit and spellframe.auraunit == unit) then
      spellframe:UNIT_AURA(unit)
    end
  end
end

local GetAura = function (self)
  local s = self.isType == 'playerbuff' and 'buff' or 'debuff'
  local a = vars[s][self.auraunit]
  if not a then return end
  if type(self.auraname) == 'table' then
    for k,aura in pairs(a) do
      for i = 1,#self.auraname do
        if (aura.name == self.auraname[i]) and (aura.source == 'player' or self.unique) and (not(self.uniqueID) or self.uniqueID == aura.spellID) then
          if aura.expirationTime == 0 and aura.duration == 0 then
            aura.duration = 86400 -- Pretend it's actually gonna last a full day. Probably long enough
            aura.expirationTime = GetTime() + aura.duration
          end
          return aura.name, aura.icon, aura.count, aura.duration, aura.expirationTime, aura.source, aura.spellID
        end
      end
    end
  else
    for k,aura in pairs(a) do
      if (aura.name == self.auraname) and (aura.source == 'player' or self.unique) and (not(self.uniqueID) or self.uniqueID == aura.spellID) then
          if aura.expirationTime == 0 and aura.duration == 0 then
            aura.duration = 86400 -- Pretend it's actually gonna last a full day. Probably long enough
            aura.expirationTime = GetTime() + aura.duration
          end
        return aura.name, aura.icon, aura.count, aura.duration, aura.expirationTime, aura.source, aura.spellID
      end
    end
  end
end

ns.GetAura = function (self,auralist,auratype,unit)
  if not auratype and unit then return error('Invalid arg in EventHorizon:GetAura(self,auralist,auratype,unit)') end
  local a = vars[auratype][unit]
  if not a then return end
  if type(auralist) == 'table' then
    for k,aura in pairs(a) do
      for i = 1,#auralist do
        local t = type(auralist[i])
        if (t == 'string' and aura.name or t == 'number' and aura.spellID) == auralist[i] then
          if aura.expirationTime == 0 and aura.duration == 0 then
            aura.duration = 86400 -- Pretend it's actually gonna last a full day. Probably long enough
            aura.expirationTime = GetTime() + aura.duration
          end
          return aura.name, aura.icon, aura.count, aura.duration, aura.expirationTime, aura.source, aura.spellID
        end
      end
    end
  else
    for k,aura in pairs(a) do
      local t = type(auralist)
      if (t == 'string' and aura.name or t == 'number' and aura.spellID) == auralist then
        if aura.expirationTime == 0 and aura.duration == 0 then
          aura.duration = 86400 -- Pretend it's actually gonna last a full day. Probably long enough
          aura.expirationTime = GetTime() + aura.duration
        end
        return aura.name, aura.icon, aura.count, aura.duration, aura.expirationTime, aura.source, aura.spellID
      end
    end
  end
end

-- SpellFrame - All spell bar frames inherit from this class.

--Indicators represent a point or range of time. There are different types. The type determines the color and position.
local typeparent = {}

local SpellFrame_SetStacks = function (self,count)
  if type(count) == "number" and (count > 0) then
    self.stacks:SetFormattedText('%d',count)
  else
    self.stacks:SetText()
  end
end

local SpellFrame_NotInteresting = function (self, unitid, spellname)
  return unitid ~= 'player' or spellname ~= self.spellname
end

-- FindItemInfo:
local SpellFrame_FindItemInfo = function (self,slotID)
  local itemID = self.itemID or GetInventoryItemID('player',slotID or self.slotID)
  if itemID then
    local dbI = EventHorizonDBG.itemInfo[itemID]
    if dbI and (dbI.name and dbI.tex) then
      return itemID,dbI.name,dbI.tex
    else
      local name,_,_,_,_,_,_,_,_,tex = GetItemInfo(itemID)
      if (name and tex) then
        EventHorizonDBG.itemInfo[itemID] = {name = name, tex = tex}
        return itemID,name,tex
      end
    end
  end
end

local SpellFrame_AddIndicator = function (self, typeid, layoutid, time, usetexture, top, bottom)
  local indicator
  local parent = typeparent[typeid]

  if not parent then
    parent = {}
    parent.unused = {}
    typeparent[typeid] = parent
    --if DEBUG and typeid=='tick'  then parent.numchildren=0 end--]]
  end

  if #parent.unused>0 then
    indicator = tremove(parent.unused)
    indicator:ClearAllPoints()
    indicator.start = nil
    indicator.stop = nil
    indicator.happened = nil
    -- if DEBUG and typeid=='tick'  then debug('reusing indicator',indicator.frameindex) end--]]
  else
    indicator = mainframe:CreateTexture(nil, 'ARTWORK', nil, draworder[typeid])
    indicator.parent = parent
    -- if DEBUG and typeid=='tick' then parent.numchildren=parent.numchildren+1 indicator.frameindex=parent.numchildren debug('adding indicator',indicator.frameindex) end--]]
  end

  indicator:Hide()
  indicator:SetWidth(vars.onepixelwide)

  indicator.typeid = typeid
  indicator.layoutid = layoutid
  indicator.time = time
  indicator.usetexture = usetexture
  indicator.top = top
  indicator.bottom = bottom

  self:StyleIndicator(indicator)

  tinsert(self.indicators, indicator)
  debug("SpellFrame_AddIndicator", indicator, self.indicators[#self.indicators])
  return indicator
end

local SpellFrame_StyleIndicator = function(self, indicator)
  local parent = typeparent[indicator.typeid]
  local custom_bar_texture

  if self.bartexture and (indicator.usetexture or not exemptColors[indicator.typeid]) then
    custom_bar_texture = self.bartexture
  end

  -- Layout
  local layouts = ns.layouts
  local layout = layouts[indicator.layoutid] or layouts.default
  local color = ns:getColor(self, indicator.typeid) or ns.colors.default

  local topOffset, bottomOffset = -layout.top*vars.barheight, -layout.bottom*vars.barheight
  local parentFrame = self

  if layoutid == 'frameline' then -- frameline layout is fullheight of the mainframe
    color = indicator.typeid == 'sent' and ns:getColor(self, 'castLine') or ns:getColor(self, indicator.typeid)
    topOffset = 0
    bottomOffset = 0
    parentFrame = ns.mainframe
  elseif indicator.top and indicator.bottom then -- custom top/bottom
       topOffset = -indicator.top    *vars.barheight
    bottomOffset = -indicator.bottom*vars.barheight
  end

  indicator:SetPoint('TOP',    parentFrame, 'TOP', 0, topOffset)
  indicator:SetPoint('BOTTOM', parentFrame, 'TOP', 0, bottomOffset)

  if indicator.usetexture then
    indicator:SetTexture(custom_bar_texture or vars.bartexture)
    indicator:SetTexCoord(unpack(layout.texcoords))
  else
    indicator:SetColorTexture(1,1,1,1)
  end

  indicator:SetVertexColor(unpack(color))

  if ns.config.blendModes[indicator.typeid] and type(ns.config.blendModes[indicator.typeid]) == 'string' then
    indicator:SetBlendMode(ns.config.blendModes[indicator.typeid])
  end

end

local SpellFrame_AddSegment = function(self, typeid, layoutid, start, stop, start2, top, bottom)
  if stop<start then return end
  local indicator = self:AddIndicator(typeid, layoutid, start, vars.texturedbars, top, bottom)
  indicator.time = nil
  indicator.start = start
  indicator.stop = stop
  -- debug("SpellFrame_AddSegment", indicator, indicator.start, indicator.stop, indicator.time)
  return indicator
end

local SpellFrame_Remove = function (self,indicator)
  -- debug("SpellFrame_Remove", indicator)
  if type(indicator)=='number' then
    local index, indicator = indicator, self.indicators[indicator]
    indicator:Hide()
    --if DEBUG and indicator.typeid=='tick' then debug('deleting',indicator.frameindex) end--]]
    tinsert(indicator.parent.unused, tremove(self.indicators, index))
  else
    for index=1,#self.indicators do
      if self.indicators[index]==indicator then
        indicator:Hide()
        --if DEBUG and indicator.typeid=='tick' then debug('deleting',indicator.frameindex) end--]]
        tinsert(indicator.parent.unused, tremove(self.indicators,index))
        break
      end
    end
  end
end

local SpellFrame_OnUpdate = function (self,elapsed)
  local now = GetTime()
  local diff = now+vars.past

  -- spellframe.nexttick is used to schedule the creation of predicted ticks as soon as they scroll past now+future.
  local nexttick = self.nexttick
  if nexttick and nexttick <= now+vars.future then
    if nexttick<=self.lasttick then
      self:AddIndicator('tick', 'tick', nexttick)
      self.latesttick = nexttick
      self.nexttick = nexttick + (self.dotMod or self.dot)
    else
      self.nexttick = nil
    end
  end
  for k=#self.indicators,1,-1 do
    local indicator = self.indicators[k]
    local time = indicator.time
    if time then
      -- Example:
      -- [-------|------->--------]
      -- past    now     time     future
      -- now=795, time=800, past=-3, then time is time-now-past after past.
      local p = (time-diff)*vars.scale
      local remove = p<0 or (time<=now and indicator.typeid=='tick' and not indicator.happened)
      if remove then
        -- debug("OnUpdate - remove", indicator, indicator.time, indicator.start, indicator.stop)
        indicator:Hide()
        --if DEBUG and indicator.typeid=='tick' then debug('deleting',indicator.frameindex) end--]]
        tinsert(indicator.parent.unused, tremove(self.indicators,k))
      elseif p<=1 then
        -- debug("OnUpdate - p<=1", indicator, indicator.time, indicator.start, indicator.stop)
        indicator:SetPoint('LEFT', self, 'LEFT', p*vars.barwidth, 0)
        indicator:Show()
      end
    else
      local start, stop = indicator.start, indicator.stop
      local p1 = (start-diff)*vars.scale
      local p2 = (stop-diff)*vars.scale
      if p2<0 then
       -- debug("OnUpdate - p2<0")
        indicator:Hide()
        --if DEBUG and indicator.typeid=='tick' then debug('deleting',indicator.frameindex) end--]]
        tinsert(indicator.parent.unused, tremove(self.indicators,k))
      elseif 1<p1 then
        -- debug("OnUpdate - p1>1")
        indicator:Hide()
      else
        indicator:Show()
        indicator:SetPoint('LEFT', self, 'LEFT', 0<=p1 and p1*vars.barwidth or 0, 0)
        indicator:SetPoint('RIGHT', self, 'LEFT', p2<=1 and p2*vars.barwidth+1 or vars.barwidth, 0)
      end
    end
  end
end

local SpellFrame_UNIT_SPELLCAST_SENT = function (self, unitid, target, castGuid, spellID)
  local spellname = GetSpellInfo(spellID)
  if ((self.cast and not(self.cast[spellname])) or (spellname ~= self.spellname)) or unitid ~= 'player' then return end
  local now = GetTime()
  self:AddIndicator('sent', 'default', now)
end

local Cast_Start = function (self, unitid, castGUID, spellID)
  local name,_,icon = GetSpellInfo(spellID)
  local unitid, spellname, spellrank = unitid, name, -1
  if not(self.cast[spellname]) or unitid ~= 'player' then return end
  local _,_,_,startTime,endTime,_ = self.cast[spellname].func(unitid)
  if not(startTime and endTime) then return end

  startTime, endTime = startTime/1000, endTime/1000
  self.casting = self:AddSegment('casting', 'default', startTime, endTime)

  self.lastcast = name
  if not(self.keepIcon) then
    self.icon:SetTexture(icon)
  end

  if vars.castLine and (endTime - startTime > vars.castLine) then
    self.castLine = self:AddIndicator('sent', 'frameline', endTime)
  end

  local numhits = self.cast[spellname].numhits and self.cast[spellname].numhits ~= true and self.cast[spellname].numhits
  if numhits then
    local casttime = endTime - startTime
    local tick = casttime/numhits
    if numhits and numhits ~= true then
      for i=1,numhits do
        self:AddIndicator('channeltick', 'channeltick', startTime + i*tick)
      end
    end
  end
end

local Cast_Update = function (self, unitid, castGUID, spellID)
  --debug('UNIT_SPELLCAST_CHANNEL_UPDATE',unitid, spellname, spellrank)
  local name,_,icon = GetSpellInfo(spellID)
  local unitid, spellname, spellrank = unitid, name, -1
  if not(self.cast[spellname]) or unitid ~= 'player' then return end
  local _,_,_,startTime,endTime,_ = self.cast[spellname].func(unitid)
  if not (startTime and endTime) then return end
  startTime, endTime = startTime/1000, endTime/1000
  if self.casting then
    self.casting.stop = endTime
    if vars.castLine and self.castLine then
      self.castLine.time = endTime
    end
  end
  self:RemoveChannelTicksAfter(endTime)
end

local Cast_Stop = function (self, unitid, castGUID, spellID)
  local name,_,icon = GetSpellInfo(spellID)
  local unitid, spellname, spellrank = unitid, name, -1

  if not(self.cast[spellname]) or unitid ~= 'player' then return end
  local now = GetTime()
  if self.casting then
    self.casting.stop = now
    if vars.castLine and self.castLine then
      self.castLine.time = now
    end
    self.casting = nil
  end
  self:RemoveChannelTicksAfter(now)
end

local SpellFrame_PLAYER_TOTEM_UPDATE = function ( self, slot )

    if not ( self.totem ) then return end
    local tUp, tName, tStart, tDuration, tIcon = GetTotemInfo( slot )
    if not tUp or tName ~= GetSpellInfo( self.totem ) then return end

    local now = GetTime()

    local name, icon, count, duration, expirationTime, source, spellID = tName, tIcon, 1, tDuration, tStart + tDuration, "player", tID
    local addnew

    if name then
        start = now

        if icon and not (self.cast or self.slotID or self.keepIcon) then self.icon:SetTexture(icon) end

        if self.aurasegment and (self.aurasegment.lastunit == "player") then
      -- The aura is currently displayed
      if expirationTime~=self.aurasegment.stop then
        if self.alwaysrefresh and not self.cast then -- alwaysrefresh = buff. Cast + buff - HoT = BAD. Buffs with cast time and no HoT component are treated much differently.
          if self.dot then -- ...check to see if it's a HoT. If so, it's treated as a DoT.
            self.aurasegment.stop = start-0.2
            if self.cast and self.useSmalldebuff then
              self.cantcast.stop = start-0.2
            end
            self:RemoveTicksAfter(start)
            addnew = true
          else
            -- If it's a buff with no cast time or HoT component, no special handling needed, move along.
            self.aurasegment.stop = expirationTime
          end
        else
          -- The aura was replaced.
          self.aurasegment.stop = start-0.2
          if self.cast and self.useSmalldebuff then
            self.cantcast.stop = start-0.2
          end
          self:RemoveTicksAfter(start)
          addnew = true
        end
        if self.internalcooldown and type(self.internalcooldown) == 'number' then
          local stop = now + self.internalcooldown
          if start > stop then
            start = now
          end
          self:AddSegment('cooldown', 'cooldown', start, stop)
        end
      end

    else
      addnew = true
      if self.internalcooldown and type(self.internalcooldown) == 'number' then
        local stop = now + self.internalcooldown
        if start > stop then
          start = now
        end
        self:AddSegment('cooldown', 'cooldown', start, stop)
      end
    end
    self:SetStacks(1)
  else
    if self.aurasegment then
      if math.abs(self.aurasegment.stop - now)>0.3 then
        self.aurasegment.stop = now
        if self.cast and self.useSmalldebuff then
          self.cantcast.stop = now-0.2
        end
      end
      self:RemoveTicksAfter(now)
      self.aurasegment = nil
      self:SetStacks()
    end
  end
    self:UpdateTotem(addnew, source, now, start, expirationTime, duration, name)
end

local SpellFrame_UNIT_AURA = function (self, unitid)
  if unitid~=self.auraunit then return end
  if not (self.spellname and self.auraname) then return end

  local name, icon, count, duration, expirationTime, source, spellID = GetAura(self,unitid)
  --print(name, icon, count, duration, expirationTime, source, spellID)
  local afflicted = name and (self.unique or source=='player') and (not self.minstacks or count>=self.minstacks)
  local addnew
  local now = GetTime()
  local start
  local targ = UnitName(self.auraunit)

  if self.uniqueID and self.uniqueID ~= spellID then
    return
  end

  --[[
  if self.aurasegment and expirationTime == 0 and duration == 0 then  -- Timeless aura, bar exists (Overkill)
    for i = #self.indicators,1,-1 do
      self:Remove(i)
    end
    self.aurasegment = nil
    self.nexttick = nil
    self.stacks:SetText()
    return
  end

  if expirationTime == 0 then
    return
  end
  ]]

  if afflicted then
    start = expirationTime-duration
    if icon and not(self.cast or self.slotID or self.keepIcon) then self.icon:SetTexture(icon) end
    if self.aurasegment and (self.aurasegment.lastunit == targ) then
      -- The aura is currently displayed
      if expirationTime~=self.aurasegment.stop then
        if self.alwaysrefresh and not self.cast then -- alwaysrefresh = buff. Cast + buff - HoT = BAD. Buffs with cast time and no HoT component are treated much differently.
          if self.dot then -- ...check to see if it's a HoT. If so, it's treated as a DoT.
            self.aurasegment.stop = start-0.2
            if self.cast and self.useSmalldebuff then
              self.cantcast.stop = start-0.2
            end
            self:RemoveTicksAfter(start)
            addnew = true
          else
            -- If it's a buff with no cast time or HoT component, no special handling needed, move along.
            self.aurasegment.stop = expirationTime
          end
        else
          -- The aura was replaced.
          self.aurasegment.stop = start-0.2
          if self.cast and self.useSmalldebuff then
            self.cantcast.stop = start-0.2
          end
          self:RemoveTicksAfter(start)
          addnew = true
        end
        if self.internalcooldown and type(self.internalcooldown) == 'number' then
          local stop = now + self.internalcooldown
          if start > stop then
            start = now
          end
          self:AddSegment('cooldown', 'cooldown', start, stop)
        end
      end
    else
      addnew = true
      if self.internalcooldown and type(self.internalcooldown) == 'number' then
        local stop = now + self.internalcooldown
        if start > stop then
          start = now
        end
        self:AddSegment('cooldown', 'cooldown', start, stop)
      end
    end
    self:SetStacks(count)
  else
    if self.aurasegment then
      if math.abs(self.aurasegment.stop - now)>0.3 then
        self.aurasegment.stop = now
        if self.cast and self.useSmalldebuff then
          self.cantcast.stop = now-0.2
        end
      end
      self:RemoveTicksAfter(now)
      self.aurasegment = nil
      self:SetStacks()
    end
  end
  self:UpdateDoT(addnew, source, now, start, expirationTime, duration, name)
end

local mainframe_PLAYER_TARGET_CHANGED = function (self)
  local exists = UnitExists('target')
  local dead
  if exists then
    dead = UnitIsDead('target')
  end
  for i,spellframe in pairs(ns.frames.frames) do
    if spellframe.auraunit == 'target' then
      if spellframe.aurasegment then
        for i = #spellframe.indicators,1,-1 do
          local ind = spellframe.indicators[i]
          if auraids[ind.typeid] then
            spellframe:Remove(i)
          end
        end
        spellframe.aurasegment = nil
        spellframe.targetdebuff = nil
        spellframe.nexttick = nil
        spellframe.recenttick = nil
        spellframe:SetStacks()
      end

      if spellframe.refreshable then
        if exists then
          if dead then
            spellframe.debuffs[UnitGUID('target')] = nil
          else
            spellframe.targetdebuff = spellframe.debuffs[UnitGUID('target')]
          end
        end
      end
    end
  end

  if UnitExists('target') then
    self:UNIT_AURA('target')
  end
end

local SpellFrame_RemoveTicksAfter = function (self, min)
  local indicators = self.indicators
  for i = #indicators,1,-1 do
    local ind = indicators[i]
    if (ind.typeid == 'tick') and ind.time>min then
      self:Remove(i)
    end
  end
  --print('removing ticks after',min)
  self.nexttick = nil
end

local SpellFrame_RemoveChannelTicksAfter = function (self, min)
  local indicators = self.indicators
  for i = #indicators,1,-1 do
    local ind = indicators[i]
    if ind.typeid == 'channeltick' and ind.time>min then
      self:Remove(i)
    end
  end
  self.nextchanneltick = nil
end

local mainframe_CLEU_OtherInterestingSpell = function (self, time, event, hideCaster, srcguid, srcname, srcflags, destguid, destname, destflags, spellid, spellname)
  local now = GetTime()

  if ns.otherIDs[spellname] then
    local id = ns.otherIDs[spellname]
    local bf = ns.frames.frames
    if event == 'SPELL_DAMAGE' and id.isChannel then
      for i in pairs(bf) do
        if bf[i].cast and bf[i].cast[spellname] then
          local tick = bf[i]:AddIndicator('tick', 'tick', now)
          tick.happened = true
          break
        end
      end
    end
  end
end

local AddTicks = {}
AddTicks.stop = function (self,now,fresh)
  local nexttick = self.start
  while nexttick<=self.stop+0.1 do
    if now+vars.future<nexttick then
      self.nexttick = nexttick
      self.lasttick = self.stop
      break
    end
    if now+vars.past<=nexttick then
      self:AddIndicator('tick', 'tick', nexttick)
      self.latesttick = nexttick
    end
    nexttick = nexttick+(self.dotMod or self.dot)
  end
end

AddTicks.start = function (self,now)

  local nexttick = now+(self.dotMod or self.dot)
  while nexttick<=(self.stop+0.2) do
    if now+vars.future<nexttick then
      -- The next tick is not visible yet.
      self.nexttick = nexttick
      self.lasttick = self.stop
      break
    end
    if now+vars.past<=nexttick then
      local tick = self:AddIndicator('tick', 'tick', nexttick)
      self.latesttick = nexttick
    end
    nexttick = nexttick+(self.dotMod or self.dot)
  end
end

local SpellFrame_COMBAT_LOG_EVENT_UNFILTERED = function (...)
  local self, timestamp, event, hideCaster, srcguid,srcname,srcflags, destguid,destname,destflags, spellid,spellname = ...
  local now = GetTime()

  if event == 'SPELL_CAST_SUCCESS' then
    --debug('SPELL_CAST_SUCCESS',destguid)
    self.castsuccess[destguid] = now

  elseif tickevents[event] then
    local isInvalid = not(self.dot) and (self.cast and self.cast[spellname] and not(self.cast[spellname].numhits))  -- filter out cast+channel bars
    if isInvalid then return end
    if UnitGUID(self.auraunit or 'target')==destguid then
      local tick = self:AddIndicator('tick', 'tick', now)
      tick.happened = true
      if (self.dot and (self.stop and self.stop ~= nil)) then
        if self.isHasted and self.ticks then
          self.dotMod = self.ticks.last and (now - self.ticks.last) or self.dot
          self.dotMod = self.dotMod > self.dot and self.dot or self.dotMod
          self.ticks.last = now
        end
        self:RemoveTicksAfter(now) -- Reconstruct ticks from spellframe info
        local nexttick = now+(self.dotMod or self.dot)
        self.nexttick = nil
        self.recenttick = now
        while nexttick<=(self.stop+0.2) do -- Account for lag
          if now+vars.future<nexttick then
            -- The next tick is not visible yet.
            self.nexttick = nexttick
            self.lasttick = self.stop
            break
          end
          if now+vars.past<=nexttick then
            -- The next tick is visible.
            local tick = self:AddIndicator('tick', 'tick', nexttick)
            if nexttick<=now then
              tick.happened = true
            end
            self.latesttick = nexttick
          end
          nexttick=nexttick+(self.dotMod or self.dot)
        end
      end
    end
  end
end

local SpellFrame_UNIT_AURA_refreshable = function (self, unitid)
  if unitid~=self.auraunit then return end
  if not(self.auraname and self.spellname) then return end
  local name, icon, count, duration, expirationTime, source, spellID = GetAura(self,unitid)
  local afflicted = name and (self.unique or source=='player') and (not self.minstacks or count>=self.minstacks)
  local addnew, refresh
  local now = GetTime()
  local guid = UnitGUID(self.auraunit or 'target')
  --print(name,source,self.spellname,self.auraname)
  -- First find out if the debuff was refreshed.

  --[[ if self.aurasegment and expirationTime == 0 and duration == 0 then  -- Timeless aura, bar exists (Overkill)
    for i = #self.indicators,1,-1 do
      self:Remove(i)
    end
    self.aurasegment = nil
    self.nexttick = nil
    self.stacks:SetText()
    return
  end ]]

  --[[ if expirationTime == 0 then
    return
  end ]]

  if afflicted then
    start = expirationTime-duration
    if icon and not(self.cast or self.slotID or self.keepIcon) then self.icon:SetTexture(icon) end
    if self.targetdebuff then
      if self.targetdebuff.stop == expirationTime then
        start = self.targetdebuff.start
      else
        -- Check for refresh.
        if start < self.targetdebuff.stop then
          local totalduration = self.targetdebuff.stop - self.targetdebuff.start
          local lasttick = self.targetdebuff.stop - math.fmod(totalduration, self.dotMod or self.dot)
          local success = self.castsuccess[guid]
          local not_recast = true -- Poisons are never actually recast, so we default to true here, because success will always be nil.
          if success then
            not_recast = math.abs(success-start)>0.5
          end
          if not_recast and start < lasttick then
            -- The current debuff was refreshed.
            start = self.targetdebuff.start
            refresh = true
          end
        end
      end
    end
    if self.aurasegment then
      if expirationTime~=self.aurasegment.stop and not refresh then
        -- The current debuff was replaced.
        self.aurasegment.stop = start-0.2
        self:RemoveTicksAfter(start)

        --debug('replaced')
        addnew = true
      end
    else
      addnew = true
    end
    self:SetStacks(count)
  else
    if self.aurasegment then
      if math.abs(self.aurasegment.stop - now)>0.3 then
        -- The current debuff ended.
        self.aurasegment.stop = now
        if self.cantcast then
          self.cantcast.stop = now
        end
      end
      self:RemoveTicksAfter(now)
      self.aurasegment = nil
      self.cantcast = nil
      self.targetdebuff = nil
      self.recenttick = nil
      self:SetStacks()
    end
  end
  self:UpdateDoT(addnew, source, now, start, expirationTime, duration, name, refresh, guid)
end

local SpellFrame_UpdateDoT = function (self, addnew, source, now, start, expirationTime, duration, name, refresh, guid)
  local addticks
  local isHasted
  local checkDoT = self.auranamePrimary or name
  local isPrimary = checkDoT == name or nil
  self.start, self.stop, self.duration = start, expirationTime, duration

  local targ = UnitName(self.auraunit)
  if addnew then
    --debug('addnew', start, expirationTime)
    local typeid = (source=='player' and self.isType) or (source~='player' and 'debuff')
    if self.cast and self.useSmalldebuff then
      self.aurasegment = self:AddSegment(typeid, 'smalldebuff', start, expirationTime)

      local hastedcasttime = select(7, GetSpellInfo(self.lastcast or self.spellname))/1000
      self.cantcast = self:AddSegment(typeid, 'cantcast', start, expirationTime-hastedcasttime)

            --local pandemic_duration = duration*0.3
            --self.cantcast = self:AddSegment(typeid, 'cantcast', start, expirationTime - pandemic_duration
            --self.cantcast.pandemic_duration = pandemic_duration

      self.aurasegment.lastunit = targ
    else
      self.aurasegment = self:AddSegment(typeid, 'default', start, expirationTime)
      self.aurasegment.lastunit = targ
    end
    -- Add visible ticks.
    if self.dot and isPrimary then
      addticks = start
    end
    if self.debuffs then
      -- Refreshable only.
      self.targetdebuff = {start=start, stop=expirationTime}
      self.debuffs[guid] = self.targetdebuff
    end
    self.recenttick = now
  elseif refresh then
    -- debug('refresh', start, expirationTime)
    -- Note: refresh requires afflicted and self.targetdebuff. Also, afflicted and not self.debuff implies addnew.
    -- So we can get here only if afflicted and self.debuff and self.targetdebuff.
    self.aurasegment.stop = expirationTime
    self.targetdebuff.stop = expirationTime
    if self.cantcast then
      self.cantcast.start = start
      self.cantcast.stop = expirationTime - select(7, GetSpellInfo(self.lastcast or self.spellname))/1000
    end
    if self.latesttick then
      addticks = self.latesttick
    end
  end
  if addticks then
    addticks = self.recenttick or addticks
    local nexttick = addticks+(self.dotMod or self.dot)
    self.nexttick = nil

    if self.hasted then
      isHasted = true
    end

    if isHasted and self.expectedTicks then    -- Using expectedTicks
      self.dotMod = (expirationTime - start)/self.expectedTicks
    elseif isHasted then
      local bct = ns.config.hastedSpellID[2]
      local hct = select(7, GetSpellInfo(ns.config.hastedSpellID[1]))/1000
      self.dotMod = self.dot*(hct/bct)
--[[    if ns.config.nonAffectingHaste then
        for i,nah in ipairs(ns.config.nonAffectingHaste) do
          local name,_,_,_,_,source = ns:GetAura(nah[1],'buff','player')
          if name and (source == 'player') then
            self.dotMod = self.dotMod * nah[2]
          end
        end
      end--]]
    end
    self:RemoveTicksAfter(now)
    --self:AddTicks(now)

    if self.hasted then
      isHasted = true
    end

    if isHasted and self.ticks then          -- Tick-process haste handling
      self.ticks.last = self.ticks.last or now
      self.dotMod = self.dotMod and self.dotMod or self.dot
      if (self.dotMod > self.dot) or (self.dotMod < 1.5) then self.dotMod = self.dot end
      self.isHasted = true
    elseif isHasted and self.expectedTicks then    -- Using expectedTicks
      self.dotMod = (expirationTime - start)/self.expectedTicks
    end

    while nexttick<=(self.stop+0.2) do -- Account for lag
      if now+vars.future<nexttick then
        -- The next tick is not visible yet.
        self.nexttick = nexttick
        self.lasttick = self.stop
        break
      end
      if now+vars.past<=nexttick then
        -- The next tick is visible.
        local tick = self:AddIndicator('tick', 'tick', nexttick)
        if nexttick<=now then
          tick.happened = true
        end
        self.latesttick = nexttick
      end
      nexttick=nexttick+(self.dotMod or self.dot)
    end

  end
end

local SpellFrame_UpdateTotem = function (self, addnew, source, now, start, expirationTime, duration, name, refresh, guid)
  local addticks
  local isHasted
  local checkDoT = self.auranamePrimary or name
  local isPrimary = checkDoT == name or nil
  self.start, self.stop, self.duration = start, expirationTime, duration

  local targ = "player"
  if addnew then
    --debug('addnew', start, expirationTime)
    local typeid = (source=='player' and self.isType) or (source~='player' and 'debuff')
    if self.cast and self.useSmalldebuff then
      self.aurasegment = self:AddSegment(typeid, 'smalldebuff', start, expirationTime)

      local hastedcasttime = select(7, GetSpellInfo(self.lastcast or self.spellname))/1000
      self.cantcast = self:AddSegment(typeid, 'cantcast', start, expirationTime-hastedcasttime)

            --local pandemic_duration = duration*0.3
            --self.cantcast = self:AddSegment(typeid, 'cantcast', start, expirationTime - pandemic_duration
            --self.cantcast.pandemic_duration = pandemic_duration

      self.aurasegment.lastunit = targ
    else
      self.aurasegment = self:AddSegment(typeid, 'default', start, expirationTime)
      self.aurasegment.lastunit = targ
    end
    -- Add visible ticks.
    if self.dot and isPrimary then
      addticks = start
    end
    if self.debuffs then
      -- Refreshable only.
      self.targetdebuff = {start=start, stop=expirationTime}
      self.debuffs[guid] = self.targetdebuff
    end
    self.recenttick = now
  elseif refresh then
    -- debug('refresh', start, expirationTime)
    -- Note: refresh requires afflicted and self.targetdebuff. Also, afflicted and not self.debuff implies addnew.
    -- So we can get here only if afflicted and self.debuff and self.targetdebuff.
    self.aurasegment.stop = expirationTime
    self.targetdebuff.stop = expirationTime
    if self.cantcast then
      self.cantcast.start = start
      self.cantcast.stop = expirationTime - select(7, GetSpellInfo(self.lastcast or self.spellname))/1000
    end
    if self.latesttick then
      addticks = self.latesttick
    end
  end
  if addticks then
    addticks = self.recenttick or addticks
    local nexttick = addticks+(self.dotMod or self.dot)
    self.nexttick = nil

    if self.hasted then
      isHasted = true
    end

    if isHasted and self.expectedTicks then    -- Using expectedTicks
      self.dotMod = (expirationTime - start)/self.expectedTicks
    elseif isHasted then
      local bct = ns.config.hastedSpellID[2]
      local hct = select(7, GetSpellInfo(ns.config.hastedSpellID[1]))/1000
      self.dotMod = self.dot*(hct/bct)
--[[    if ns.config.nonAffectingHaste then
        for i,nah in ipairs(ns.config.nonAffectingHaste) do
          local name,_,_,_,_,source = ns:GetAura(nah[1],'buff','player')
          if name and (source == 'player') then
            self.dotMod = self.dotMod * nah[2]
          end
        end
      end--]]
    end
    self:RemoveTicksAfter(now)
    --self:AddTicks(now)

    if self.hasted then
      isHasted = true
    end

    if isHasted and self.ticks then          -- Tick-process haste handling
      self.ticks.last = self.ticks.last or now
      self.dotMod = self.dotMod and self.dotMod or self.dot
      if (self.dotMod > self.dot) or (self.dotMod < 1.5) then self.dotMod = self.dot end
      self.isHasted = true
    elseif isHasted and self.expectedTicks then    -- Using expectedTicks
      self.dotMod = (expirationTime - start)/self.expectedTicks
    end

    while nexttick<=(self.stop+0.2) do -- Account for lag
      if now+vars.future<nexttick then
        -- The next tick is not visible yet.
        self.nexttick = nexttick
        self.lasttick = self.stop
        break
      end
      if now+vars.past<=nexttick then
        -- The next tick is visible.
        local tick = self:AddIndicator('tick', 'tick', nexttick)
        if nexttick<=now then
          tick.happened = true
        end
        self.latesttick = nexttick
      end
      nexttick=nexttick+(self.dotMod or self.dot)
    end

  end
end

local SpellFrame_PLAYER_REGEN_ENABLED = function (self)
  local thresh = GetTime() - 10
  local remove = {}
  for guid,data in pairs(self.debuffs) do
    if data.stop < thresh then
      tinsert(remove, guid)
    end
  end
  for _,guid in ipairs(remove) do
    --debug('removing',guid,self.spellname)
    self.debuffs[guid]=nil
  end
end

local SpellFrame_SPELL_UPDATE_CHARGES = function(self)
  if not self.rechargeTable then return end

  local current, max, startTime, duration, unknown = GetSpellCharges(self.rechargeTable.spellID)
  local displayMax = math.min(self.rechargeTable.maxDisplayCount or max, max)
  local now = GetTime()
  self.rechargeIndicators = self.rechargeIndicators or {}

  -- We want to show an indicator for each charge that ends when _that_ charge is available

  -- Since current is the number of charges currently available, all of the charge indicators in this loop
  -- are available and so should be removed
  for charge=1, current do
    local chargeIndicator = self.rechargeIndicators[charge]
    if chargeIndicator then
      --  debug("removing indicator", "charge", charge, "current", current, "displayMax", displayMax)
      -- nponoBegHuk: the "for" section of the code below doesn't address the issue when charges "magically" appear due to procs/talents.
      self.rechargeIndicators[charge].stop = math.min(now, self.rechargeIndicators[charge].stop)
      -- nponoBegHuk: The indicator is gone from the table but will live in our memories. And on the screen. P.S.: Please feel free to delete my dumb comments.
      self.rechargeIndicators[charge] = nil
    end
  end

  -- These all need to have indicators, or the indicators need to be updated to match new values
  for charge=current+1, displayMax do
    local chargeIndicator = self.rechargeIndicators[charge]

    local chargeStart = startTime
    local chargeStop = startTime + duration*(charge-current)
    -- debug("chargeStop", chargeStop)

    if chargeIndicator then
      -- debug("updating indicator", "charge", charge, "current", current, "displayMax", displayMax, "chargeStart", chargeStart, "chargeStop", chargeStop)
      -- UpdateCharges event will set the start time of the higher-order charge to be chargeStop - duration
      -- Thus, in order to preserve continuity in the past, we want to disallow updating the start time to a newer value
      -- nponoBegHuk: past is past and it does not need to be changed. Not sure when this is needed. Please elaborate. Disabling for now.
      -- chargeIndicator.start = math.min(chargeStart, chargeIndicator.start)
      chargeIndicator.stop = chargeStop
    else -- We need to make one
      -- Want largest charge on bottom
      local topPercent = (charge - 1) / displayMax
      local bottomPercent = charge / displayMax
      -- nponoBegHuk: once again, changing the past and disobeying second law of thermodynamics is not what I would want to meddle with.
      self.rechargeIndicators[charge] = self:AddSegment('recharge', 'recharge', math.max(now, chargeStart), chargeStop, nil, topPercent, bottomPercent)
      --  debug("adding indicator", "charge", charge, "current", current, "displayMax", displayMax, "chargeStart", chargeStart, "chargeStop", chargeStop, "topPercent", topPercent, "bottomPercent", bottomPercent, "indicatorTime", self.rechargeIndicators[charge].time, "indicatorStart", self.rechargeIndicators[charge].start, "indicatorStop", self.rechargeIndicators[charge].stop)
    end
  end

  -- Set the stacks on the icon to be the current number of charges
--  self:SetStacks(current)
end

local SpellFrame_UNIT_SPELL_HASTE = SpellFrame_SPELL_UPDATE_CHARGES

local SpellFrame_SPELL_UPDATE_COOLDOWN = function (self)
--  print(self.spellname,self.cooldownID,'SPELL_UPDATE_COOLDOWN')
  if self.slotID and self.cooldownID and not(self.spellname) then  -- item is equipped but has none of the needed info, so rescan it.
    return self:PLAYER_EQUIPMENT_CHANGED(self.slotID)
  end
  if not(self.cooldownID or self.spellname) then return end

  local start = 0
  local duration = 0
  local enabled
  local ready

  if self.cooldownTable then -- we choose the one with the longer CD (This is mostly for sfiend/mindbender bar)
    for i,cooldown in pairs(self.cooldownTable) do
      start2, duration2, enabled2 = self.CooldownFunction(cooldown)
      if start2+duration2 > start+duration then
        --print(cooldown, "better", start2+duration2, start+duration)
        start = start2
        duration = duration2
        enabled = enabled2
        ready = (enabled==1 and start~=0 and duration) and start+duration
      end
    end
  else
    start, duration, enabled = self.CooldownFunction(self.cooldownID or self.spellname)
    ready = enabled==1 and start~=0 and duration and start+duration
  end
  --print(start, duration, enabled, ready)
  local _, gcdDuration = GetSpellCooldown(ns.config.gcdSpellID)
  if ready and duration>gcdDuration then
    -- The spell is on cooldown, but not just because of the GCD.
    if self.cooldown ~= ready then  -- The CD has changed since last check
      if not(self.coolingdown) then  -- No CD bar exists.
        self.coolingdown = self:AddSegment('cooldown', self.smallCooldown and 'smallCooldown' or 'cooldown', start, ready)
      elseif self.coolingdown.stop and self.coolingdown.stop ~= ready then  -- cd exists but has changed
        -- nponoBegHuk: if you want a good story about changing past, watch Steins;Gate. 
        -- self.coolingdown.start = start
        self.coolingdown.stop = ready
      end
      self.cooldown = ready
    end
  else
    if self.coolingdown then
      -- Spell is off cooldown or cd expires during GCD window
      local now = GetTime()
      -- See when the cooldown is ready. If the spell is currently on GCD, check the GCD end; otherwise check now.
      if self.cooldown > (ready or now) then
        -- The cooldown ended earlier.
        self.coolingdown.stop = now
      end
      self.coolingdown = nil
    end
    self.cooldown = nil
  end
end

local SpellFrame_PLAYER_EQUIPMENT_CHANGED = function (self,slot,equipped)
  if not (slot or self.slotID) or (self.slotID ~= slot) then return end

  for i = #self.indicators,1,-1 do
    self:Remove(i)
  end

  self.aurasegment = nil
  self.nexttick = nil
  self:SetStacks()

  self.cooldown = nil
  self.coolingdown = nil
  self.playerbuff = nil
  self.spellname = nil
  self.auraname = nil
  self.internalcooldown = true

  local itemID,name,tex = self:FindItemInfo()
  self.cooldownID = itemID

  if (itemID and name and tex) and not(ns.trinkets.blacklist[name]) then
    self.spellname = name
    self.icon:SetTexture(tex)

    self.stance = true -- Always show

    if ns.trinkets[name] then
      if type(ns.trinkets[name]) == 'number' then
        self.playerbuff = ns.trinkets[name]
      elseif type(ns.trinkets[name]) == 'table' then
        self.playerbuff = ns.trinkets[name][1]
        self.internalcooldown = ns.trinkets[name][2]
      end
    elseif self.slotID == 10 then
      self.playerbuff = 54758    -- Engy gloves
    elseif self.slotID == 8 then
      self.playerbuff = 54861    -- Nitro Boosts
    end

    if type(self.playerbuff)=='number' then
      self.auraname = (GetSpellInfo(self.playerbuff))
    elseif type(self.playerbuff)=='table' then
      self.auraname = {}
      self.auranamePrimary = (GetSpellInfo(self.playerbuff[1]))
      for i,id in ipairs(self.playerbuff) do
        tinsert(self.auraname, (GetSpellInfo(id)))
      end
      self.AuraFunction = UnitBuffUnique
    else
      self.auraname = self.spellname
    end
    self:SPELL_UPDATE_COOLDOWN()
  else
    self.stance = 50 -- More efficient than other methods of hiding the bar.
    self.icon:SetColorTexture(0,0,0,0)
  end

  -- Throttle equipment checks to every 2 seconds. This should decrease overall cpu load while making equipment checks more reliable on beta/ptr.
--  vars.EQCframes = vars.EQCframes or {}
--  table.insert(vars.EQCframes,self)
  --print('equipment update - slot '..self.slotID)
  if not(vars.currentEQcheck) then
    frame2.elapsed = 0
    vars.currentEQcheck = true
    frame2:SetScript('OnUpdate', function (self,elapsed)
      self.elapsed = self.elapsed + elapsed
      if self.elapsed >= 2 then
        mainframe:UPDATE_SHAPESHIFT_FORM()
    --[[  for i,v in ipairs(vars.EQCframes) do
          v:SPELL_UPDATE_COOLDOWN()
        end  ]]--
        vars.currentEQcheck = nil
    --    vars.EQCframes = nil
        --print('equipment check onupdate complete and cleared')
        self:SetScript('OnUpdate',nil)
      end
    end)
  end
end

--[[
Things get ugly again here.
UNIT_AURA does not fire for mouseover units, so we need to emulate it.
UPDATE_MOUSEOVER_UNIT does not fire when a mouseover unit is cleared, so we need to emulate that as well.
The UMU check is unthrottled by necessity. UNIT_AURA doesn't really need to be run more than 10 times per second, so it gets throttled to save cycles.
]]--
local TTL,TSLU = 0.15,0
local UpdateMouseover = function (self,elapsed)
  TSLU = TSLU+elapsed
  if not(UnitExists('mouseover')) then
    ns:CheckMouseover()
    frame:SetScript('OnUpdate',nil)
  else
    if (TSLU >= TTL) then
      mainframe:UNIT_AURA('mouseover')
      TSLU = 0
    end
  end
end

local SpellFrame_UPDATE_MOUSEOVER_UNIT = function (self)
  --print("UPDATE_MOUSEOVER_UNIT")
  if UnitExists('mouseover') then
    vars.isMouseover = true
    self.auraunit = 'mouseover'
  else
    vars.isMouseover = nil
    self.auraunit = self.baseunit
  end
  frame:SetScript('OnUpdate',UpdateMouseover)

  if self.aurasegment then
    for i = #self.indicators,1,-1 do
      local ind = self.indicators[i]
      if auraids[ind.typeid] then
        self:Remove(i)
      end
    end
    self.aurasegment = nil
    self.nexttick = nil
    self:SetStacks()
  end

  if self.refreshable then
    if UnitExists(self.auraunit) then
      local guid = UnitGUID(self.auraunit)
      if UnitIsDead(self.auraunit) then
        self.debuffs[guid] = nil
      else
        self.targetdebuff = self.debuffs[guid]
        --if self.targetdebuff then debug(self.spellname, 'have old') end
        mainframe:UNIT_AURA(self.auraunit)
        --if self.aurasegment then debug(self.spellname, 'added new') end
      end
    end
  elseif UnitExists(self.auraunit) then
    mainframe:UNIT_AURA(self.auraunit)
  end
end

-- A SpellFrame is active (i.e. listening to events) iff the talent requirements are met.
-- The table EventHorizon.frames.active contains all the active frames.
-- If the stance requirement is not met, the frame is hidden, but still active.
local SpellFrame_Deactivate = function (self)
  if not self.isActive then return end
  --debug('unregistering events for', self.spellname)
  self:UnregisterAllEvents()
  if self.interestingCLEU then
    mainframe.framebyspell[self.spellname] = nil
  end
  self:Hide()
  for index=#self.indicators,1,-1 do
    self:Remove(index)
  end
  self.isActive = nil
end

local SpellFrame_Activate = function (self)
  if self.isActive then return end
  --debug('registering events for', self.spellname)
  for event in pairs(self.interestingEvent) do
    -- debug("Registering Event", event)
    self:RegisterEvent(event)
  end
  if self.interestingCLEU and self.spellname then
    debug(self.spellname)
    mainframe.framebyspell[self.spellname] = self
  end

  self:Show()
  self.isActive = true
end

local timer = 0
local checkInProgress
function ns:CheckTalents()
  if not self.isReady or checkInProgress then return end
  checkInProgress = true
  frame3:SetScript('OnUpdate', function (f,elapsed)
    timer = timer + elapsed
    if timer >= 2 then
      timer = 0
      checkInProgress = nil
      ns:CheckRequirements()
      f:SetScript('OnUpdate',nil)
    end
  end)
end

function ns:SetFrameDimensions()
  local left,right,top,bottom = 0.07, 0.93, 0.07, 0.93
  local barheight2 = self.config.height
  local modHeight = self.config.height

  local sfn = type(self.config.staticframes) == 'number' and self.config.staticframes or 0
  local sfi = self.config.hideIcons == true
  if (#ns.frames.shown >= sfn) and type(self.config.staticheight) == 'number' then
    mainframe:SetHeight(self.config.staticheight)
    vars.barheight = (self.config.staticheight - (vars.barspacing*(vars.numframes - 1)))/vars.numframes
    modHeight = vars.barheight
    local ratio = vars.barheight/barheight2
    ratio = math.abs( (1-(1/ratio))/2 )  -- Yes, this was a bitch to figure out.
    if vars.barheight > barheight2 then  -- icon is taller than it is wide
      left = left + ratio
      right = right - ratio
    else
      top = top + ratio
      bottom = bottom - ratio
    end
  else
    vars.barheight = barheight2
    mainframe:SetHeight(vars.numframes * (vars.barheight+vars.barspacing) - vars.barspacing)
  end

  vars.nowleft = -vars.past/(vars.future-vars.past)*vars.barwidth-0.5 + (ns.config.hideIcons and 0 or ns.config.height)
  if ns.frames.nowIndicator then
    ns.frames.nowIndicator:SetPoint('BOTTOM',mainframe,'BOTTOM')
    ns.frames.nowIndicator:SetPoint('TOPLEFT',mainframe,'TOPLEFT', vars.nowleft, 0)
    ns.frames.nowIndicator:SetWidth(vars.onepixelwide)
    ns.frames.nowIndicator:SetColorTexture(unpack(self.colors.nowLine))
  end

  for i, spellframe in ipairs(ns.frames.shown) do
    --spellframe:ClearAllPoints()
    spellframe:SetHeight(vars.barheight)
    spellframe:SetWidth(vars.barwidth)

    spellframe.icon:ClearAllPoints()
    spellframe:SetPoint('RIGHT', mainframe, 'RIGHT')
    if i == 1 then
      spellframe:SetPoint('TOPLEFT', mainframe, 'TOPLEFT', sfi and 0 or barheight2, 0)
    else
      spellframe:SetPoint('TOPLEFT', ns.frames.shown[i-1], 'BOTTOMLEFT', 0, -vars.barspacing)
    end
    if not(sfi) then
      spellframe.icon:SetPoint('TOPRIGHT',spellframe,'TOPLEFT')
      spellframe.icon:SetWidth(barheight2)
      spellframe.icon:SetHeight(modHeight)
      spellframe.icon:SetTexCoord(left,right,top,bottom)
    end

    for i, indicator in ipairs(spellframe.indicators) do
      spellframe:StyleIndicator(indicator)
    end
  end
end
--[[
function ns:AddCheckedTalent(tab,index)
  local required = true
  for k,v in ipairs(self.talents) do
    if (v[1] == tab) and (v[2] == index) then
      required = nil
    end
  end
  if required then
    table.insert(self.talents,{tab,index})
  end
end
]]
function ns:CheckRequirements()
  if not ns.isReady then return end

  --print('CheckTalents')
  table.wipe(self.frames.active)
  table.wipe(self.frames.mouseover)
  --print('checkrequirements')
  --print(GetTime())

  EventHorizonDB.charInfo = EventHorizonDB.charInfo or {}
  local cc = EventHorizonDB.charInfo

  vars.activeTree = GetSpecialization() or 0
  vars.activeTalentGroup = GetActiveSpecGroup('player')
  vars.currentLevel = UnitLevel('player')

  vars.currentTalents = {};

    for i=1, GetNumTalents() do
        local nameTalent, icon, tier, column, active = GetTalentInfo(i);
        vars.currentTalents[i] = active;
    end

  for i,config in ipairs(self.frames.config) do
    local rS = config.requiredTree
    local rL = config.requiredLevel or 1
    local rT = config.requiredTalent
    local nRT = config.requiredTalentUnselected

    local haveSpecReq = true
    local haveTalentReq = true
    local haveTalentRequiredUnselected = true
    local haveLevelReq = rL <= vars.currentLevel

    if rS then
      haveSpecReq = nil
      if type(rS) == 'number' then
        rS = {rS}
      end
      --print(config.spellID,rS)
      for i,spec in ipairs(rS) do
                --print("    ", spec, vars.activeTree)
        if spec == vars.activeTree then
          haveSpecReq = true
        end
      end
    end

        -- All talents must be active for it to work
    if rT then
      haveTalentReq = true
      if type(rT) == 'number' then
          rT = {rT}
      end
      --nameTalent, icon, tier, column, active = GetTalentInfo(rT);
      for i, talent in ipairs(rT) do
          haveTalentReq = haveTalentReq and vars.currentTalents[talent]
      end
    end

      --print("nRT Check:", nRT, vars.currentTalents[nRT])
    if nRT then
      if vars.currentTalents[nRT] then
        haveTalentRequiredUnselected = nil
      end
    end


    -- Check if there already is a frame
    local spellframe = self.frames.frames[i]
    local frameExists = spellframe~=nil

    if haveSpecReq and haveLevelReq and haveTalentReq and haveTalentRequiredUnselected then
      if frameExists then
        spellframe:Activate()
      else
        spellframe = self:CreateSpellBar(config)
        self.frames.frames[i] = spellframe
      end
      table.insert(self.frames.active, spellframe)

      if spellframe.usemouseover then
        table.insert(self.frames.mouseover, spellframe)
      end

      if type(config.cooldown) == "table" then -- We need to update the spellID again
        spellframe.cooldownTable = config.cooldown
      end
    else
      if frameExists then
        spellframe:Deactivate()
      end
    end
  end

  local activate = #self.frames.active > 0
  self:Activate(activate)
  if activate then
    mainframe:UPDATE_SHAPESHIFT_FORM()
  else
    ns:DisplayEmptyFrameTip()
  end

  ns:ModuleEvent('CheckTalents')
end

local mainframe_UPDATE_SHAPESHIFT_FORM = function (self)
  local stance = GetShapeshiftForm()
  -- On PLAYER_LOGIN, GetShapeshiftForm() sometimes returns a bogus value (2 on a priest with 1 form). Ignored for Warlocks and cached information.
  if not(stance) or (GetNumShapeshiftForms() and class ~= 'WARLOCK' and stance>GetNumShapeshiftForms()) then return end
  mainframe:SetHeight(1)
  table.wipe(ns.frames.shown)

  EventHorizonDB.charInfo.stance = stance
  vars.numframes = 0

  for i,spellframe in ipairs(ns.frames.active) do
    local shown = spellframe:IsShown()

    if spellframe.stance then
      shown = false
      if type(spellframe.stance) == 'table' then
        shown = false
        for i in ipairs(spellframe.stance) do
          if spellframe.stance[i] == stance then
            shown = true
          end
        end
      elseif spellframe.stance == true then
        shown = true
      elseif spellframe.stance == stance and not shown then
        shown = true
      elseif spellframe.stance and spellframe.stance ~= stance and shown then
        shown = false
      end
    end

    if spellframe.notstance then
      shown = true
      if spellframe.notstance and type(spellframe.notstance) == 'table' then
        for i in ipairs(spellframe.notstance) do
          if spellframe.notstance[i] == stance then
            shown = false
          end
        end
      elseif spellframe.notstance == stance then
        shown = false
      end
    end

    if shown then
      spellframe:Show()
      vars.numframes = vars.numframes+1
      table.insert(ns.frames.shown,spellframe)
    else
      spellframe:Hide()
      for i,indicator in ipairs(spellframe.indicators) do
        indicator:Hide()
      end
    end
  end

  if vars.numframes>0 then
    ns:SetFrameDimensions()
    if (EventHorizonDB.redshift) and (ns.modules.redshift.isReady and EventHorizonDB.redshift.isActive == true) then
      ns.modules.redshift:Check()
    elseif ns.isActive and vars.visibleFrame then
      mainframe:Show()
    end
  else
    mainframe:Hide()
  end

  return true
end

function ns:CheckMouseover()
  for i,spellframe in ipairs(self.frames.mouseover) do
    spellframe:UPDATE_MOUSEOVER_UNIT()
  end
end

-- GCD indicator
local mainframe_SPELL_UPDATE_COOLDOWN = function (self)
  if ns.frames.gcd then
    local start, duration = GetSpellCooldown(vars.gcdSpellName)
    local sfi = ns.config.hideIcons
    --print(start,duration)
    if start and duration and duration>0 then
      vars.gcdend = start+duration
      mainframe:SetScript('OnUpdate', function (self, elapsed)
        if vars.gcdend then
          local now = GetTime()
          if vars.gcdend<=now then
            vars.gcdend = nil
            ns.frames.gcd:Hide()
          else
            local diff = now+vars.past
            local p = (vars.gcdend-diff)*vars.scale
            if p<=1 then
              ns.frames.gcd:SetPoint('RIGHT', self, 'RIGHT',(p-1)*vars.barwidth+vars.onepixelwide, 0)
              ns.frames.gcd:Show()
            end
          end
        end
      end)
    else
      vars.gcdend = nil
      ns.frames.gcd:Hide()
      mainframe:SetScript('OnUpdate', nil)
    end
  end
end

-- Dispatch the CLEU.
local mainframe_COMBAT_LOG_EVENT_UNFILTERED = function (...)
  local self,time, event, hideCaster, srcguid,srcname,srcflags, destguid,destname,destflags, spellid,spellname = ...
  if srcguid~=vars.playerguid or event:sub(1,5)~='SPELL' then return end
  local spellframe = self.framebyspell[spellname]
  if ns.otherIDs[spellname] then
    mainframe:CLEU_OtherInterestingSpell(time, event, hideCaster, srcguid,srcname,srcflags, destguid,destname,destflags, spellid,spellname)
  end
  if spellframe then
    if spellframe.interestingCLEU[event] then
      spellframe:COMBAT_LOG_EVENT_UNFILTERED(time, event, hideCaster, srcguid,srcname,srcflags, destguid,destname,destflags, spellid,spellname)
    end
  end
end

function ns:LoadClassModule()
  local class = select(2,UnitClass('player'))

  class = class:sub(1,1)..class:sub(2):lower() -- 'WARLOCK' -> 'Warlock'

  local name, _, _, enabled, loadable = GetAddOnInfo('EventHorizon_'..class)

  DisableAddOn('EventHorizon_Redshift')
  DisableAddOn('EventHorizon_Lines')

  if not loadable then return end

  local loaded, reason = LoadAddOn(name)
  if loaded and self.InitializeClass then
    return true
  end
end

--[[
spellid: number, rank doesn't matter
abbrev: string
config: table
{
  cast = <boolean>,
  channeled = <boolean>,
  numhits = <number of hits per channel>,
  cooldown = <boolean>,
  debuff = <boolean>,
  dot = <tick interval in s, requires debuff>,
  refreshable = <boolean>,
}
--]]
function ns:NewSpell(config)
  local spellid = config.spellID or config.itemID or config.slotID
  if type(spellid)~='number' then
    return
  end

  table.insert(self.frames.config, config)
end

function ns:newSpell(config) -- New class config to old class config
  local n = {}
  local c = config

  n.spellID = (type(config.debuff)=="table" and (type(config.debuff[1])=="table" and config.debuff[1][1] or config.debuff[1]) or config.debuff) or (type(config.cast)=="table" and config.cast[1] or config.cast) or (type(config.cooldown)=="table" and config.cooldown[1] or config.cooldown) or (config.recharge) or (type(config.playerbuff)=="table" and (type(config.playerbuff[1])=="table" and config.playerbuff[1][1] or config.playerbuff[1]) or config.playerbuff) or EventHorizon.config.gcdSpellID

  n.itemID = c.itemID
  n.slotID = c.slotID
  n.cast = c.cast
  n.channeled = c.channel or c.channeled
  n.cooldown = c.cooldown
  n.recharge = c.recharge
  n.rechargeMaxDisplayCount = c.rechargeMaxDisplayCount
  n.refreshable = c.refreshable == false and false or true

  if type(c.debuff) == "table" then
    if type(c.debuff[1]) == "table" then
      n.dot = c.debuff[1][2]
      n.debuff = {}
      for i,debuff in ipairs(c.debuff) do
        table.insert(n.debuff, debuff[1])
      end
    else
      n.debuff = c.debuff[1]
      n.dot = c.debuff[2]
    end
  elseif c.debuff then
    n.debuff = c.debuff
  end



  if type(c.playerbuff) == "table" and not n.debuff then
    if type(c.playerbuff[1]) == "table" then
      n.dot = c.playerbuff[1][2]
      n.playerbuff = {}
      for i,spell in ipairs(c.playerbuff) do
        table.insert(n.playerbuff, spell[1])
      end
    else
      n.playerbuff = c.playerbuff[1]
      n.dot = c.playerbuff[2]
    end
  else
    n.playerbuff = c.playerbuff
  end

  if n.dot == 0 then
    n.dot = nil
  end

  if class == "HUNTER" or class == "ROGUE" or class == "WARRIOR" or class == "DEATHKNIGHT" or class == "DEATH_KNIGHT" or class == "MONK" then
    n.hasted = false
  elseif class == "PRIEST" or class == "MAGE" or class == "WARLOCK" or class == "PALADIN" or class == "SHAMAN" then
    n.hasted = true
  else
    if GetSpecialization() == 1 then --Balance Druid
      n.hasted = true
    else
      n.hasted = false
    end
  end

  if c.hasted == true or c.hasted == false then -- overwrite default. Ex: Doom for warlocks doesn't benefit from haste
    n.hasted = c.hasted
  end

  n.recast = c.recast
  n.minstacks = c.minstacks
  n.internalcooldown = c.internalcooldown
  n.unique = c.unique
  n.keepIcon = c.keepIcon
  n.icon = c.icon
  n.smallCooldown = c.smallCooldown

  n.requiredTree = c.requiredTree
  n.requiredLevel = c.requiredLevel
  n.requiredTalent = c.requiredTalent
  n.requiredTalentUnselected = c.requiredTalentUnselected
  n.requiredArtifactTalent = c.requiredArtifactTalent

  n.stance = c.stance
  n.auraunit = c.unitaura
  n.auraunit = c.auraunit

  n.totem = c.totem

  n.bartexture = c.bartexture
  n.barcolors = c.barcolors

  --  print("Debuff is type", type(config.debuff), "and has 1st value of", select(1,config.debuff))
  debug("Adding", n.spellID, n.debuff, n.cast, n.dot, n.cooldown)
  ns:NewSpell(n)

end


--Set spellframe attributes separately from bar creation. Helps keep things tidy and all, y'know?
local function SetSpellAttributes(spellframe,config)
  local slotname, spellname, tex, _
  local interestingEvent = {}
  local interestingCLEU = {}
  local otherids = ns.otherIDs

  if config.spellID then
    spellname, _, tex = GetSpellInfo(config.spellID)
  elseif config.itemID then
    spellname,_,_,_,_,_,_,_,_,tex,_ = GetItemInfo(config.itemID)
  elseif config.slotID then
    slotname = GetSlotName(config.slotID)
    spellframe.slotID = config.slotID
    spellframe.slotName = slotname
    local itemID = GetInventoryItemID('player', config.slotID)
    if itemID then
      spellname,_,_,_,_,_,_,_,_,tex,_ = GetItemInfo(itemID)
    else
      spellname = slotName
      tex = nil
    end
  end
  --debug('creating frame for ',spellname)
  spellframe.spellname = spellname

  -- Create and set the spell icon.
  if config.icon then
    local t = type(config.icon)
    if t == 'number' then
      if config.spellID then
        _,_,tex = GetSpellInfo(config.icon)
      elseif config.itemID then
        tex = select(10,GetItemInfo(config.icon))
      end
    elseif t == 'string' then
      tex = config.icon
    end
    config.keepIcon = true
  end

  spellframe.iconTexture = tex

  interestingEvent['UNIT_SPELLCAST_SENT'] = true

  if config.itemID or config.slotID then
    spellframe.cooldown = true  -- Not getting out of this one. It's an item, what else do you watch?
    spellframe.cooldownTable = type(config.cooldown)=="table" and config.cooldown or nil
    spellframe.cooldownID = config.itemID
    spellframe.CooldownFunction = GetItemCooldown
    interestingEvent['SPELL_UPDATE_COOLDOWN'] = true
    interestingEvent['BAG_UPDATE_COOLDOWN'] = true
    if config.slotID then
      config.playerbuff = true
      config.internalcooldown = true  -- Failsafe
      interestingEvent['PLAYER_EQUIPMENT_CHANGED'] = true
    end
  end

  if config.cast or config.channeled then
    spellframe.cast = {}
    if config.channeled then
      -- Register for the CLEU tick event.
      interestingCLEU.SPELL_DAMAGE = true
      -- Register event functions
      interestingEvent['UNIT_SPELLCAST_CHANNEL_START'] = true
      interestingEvent['UNIT_SPELLCAST_CHANNEL_STOP'] = true
      interestingEvent['UNIT_SPELLCAST_CHANNEL_UPDATE'] = true
      local tcc = type(config.channeled)
      if config.channeled == true then  -- defaults
        spellframe.cast[spellname] = {
          numhits = config.numhits or true,  -- use numhits as an indicator that the cast is channeled and not to change smalldebuff, or something.
          func = UnitChannelInfo,
          id = config.spellID,
        }
      elseif tcc == 'number' then
        local sn = GetSpellInfo(config.channeled)
        spellframe.cast[sn] = {
          numhits = config.numhits or true,  -- use numhits as an indicator that the cast is channeled and not to change smalldebuff, or something.
          func = UnitChannelInfo,
          id = config.channeled,
        }
        otherids[sn] = {isChannel = true}
      elseif tcc == 'table' then
        local channel = type(config.channeled[1]) == 'table' and config.channeled or {config.channeled}
        for _,v in ipairs(channel) do
          local sn = GetSpellInfo(v[1])
          spellframe.cast[sn] = {
            numhits = v[2] or config.numhits or true,
            func = UnitChannelInfo,
            id = v[1],
          }
          otherids[sn] = {isChannel = true}
        end
      end
    end
    if config.cast then
      interestingEvent['UNIT_SPELLCAST_START'] = true
      interestingEvent['UNIT_SPELLCAST_STOP'] = true
      interestingEvent['UNIT_SPELLCAST_DELAYED'] = true
      spellframe.useSmalldebuff = config.recast
      if ((config.debuff or config.playerbuff) and type(config.debuff or config.playerbuff) == 'boolean') then
        spellframe.useSmalldebuff = true
      end
      if config.cast == true then
        spellframe.cast[spellname] = {
          func = UnitCastingInfo,
          id = config.spellID
        }
      else
        config.cast = type(config.cast) == 'table' and config.cast or {config.cast}
        for _,id in ipairs(config.cast) do
          spellframe.cast[GetSpellInfo(id)] = {
            func = UnitCastingInfo,
            id = id
          }
        end
      end
    end
  end

  if config.cooldown then
    if type(config.cooldown) == 'number' then
      spellframe.cooldownID = config.cooldown
      spellframe.cooldown = true
      spellframe.cooldownTable = nil
    elseif type(config.cooldown) == 'table' then -- If the second spellID entered is actually usable, then use that otherwise use the other
      spellframe.cooldownID = true
      spellframe.cooldownTable = config.cooldown
      spellframe.cooldown = true
    else -- /shrug
      spellframe.cooldown = config.cooldown
      spellframe.cooldownTable = nil
    end
    spellframe.CooldownFunction = GetSpellCooldown
    interestingEvent['SPELL_UPDATE_COOLDOWN'] = true
  elseif config.recharge then
    -- Handles tracking of spells with charges
    local maxCharges = config.rechargeMaxDisplayCount
    if not maxCharges or type(maxCharges) ~= "number" or maxCharges < 1 then
      maxCharges = false
    end
    spellframe.rechargeTable = {
      spellID = config.recharge,
      maxDisplayCount = config.rechargeMaxDisplayCount
    }
    interestingEvent['SPELL_UPDATE_CHARGES'] = true
    interestingEvent['UNIT_SPELL_HASTE'] = true
  end

  if config.debuff then
    spellframe.isType = 'debuffmine'
    spellframe.AuraFunction = UnitDebuff
    spellframe.auraunit = config.auraunit or 'target'
    vars.debuff[spellframe.auraunit] = {}
    if spellframe.auraunit == 'mouseover' then
      interestingEvent['UPDATE_MOUSEOVER_UNIT'] = true
      spellframe.usemouseover = true
      spellframe.baseunit = config.baseunit or 'target'
    end
    local tcd = type(config.debuff)
    if tcd == 'number' then
      spellframe.auraname = (GetSpellInfo(config.debuff))
    elseif tcd == 'table' then
      spellframe.auranamePrimary = (GetSpellInfo(config.spellID))
      spellframe.auraname = {}
      for i,id in ipairs(config.debuff) do
        tinsert(spellframe.auraname, (GetSpellInfo(id)))
      end
      spellframe.AuraFunction = UnitDebuffUnique
    else
      spellframe.auraname = spellname
    end
--    interestingEvent['UNIT_AURA'] = true
--    interestingEvent['PLAYER_TARGET_CHANGED'] = true
    if config.dot then
      spellframe.dot = config.dot
      interestingCLEU.SPELL_PERIODIC_DAMAGE = true
      spellframe.AddTicks = AddTicks.stop
      if config.refreshable then
        spellframe.refreshable = true
        spellframe.UNIT_AURA = SpellFrame.UNIT_AURA_refreshable
--        spellframe.PLAYER_TARGET_CHANGED = SpellFrame.PLAYER_TARGET_CHANGED_refreshable
        interestingEvent['PLAYER_REGEN_ENABLED'] = true
        interestingCLEU.SPELL_CAST_SUCCESS=true
        spellframe.debuffs = {}
        spellframe.castsuccess = {}
      end
    end
  elseif config.playerbuff then
    spellframe.isType = 'playerbuff'
    spellframe.AuraFunction = UnitBuff
    spellframe.auraunit = config.auraunit or 'player'
    vars.buff[spellframe.auraunit] = {}
    if config.auraunit then
--      interestingEvent['PLAYER_TARGET_CHANGED'] = true
    end
    if spellframe.auraunit == 'mouseover' then
      interestingEvent['UPDATE_MOUSEOVER_UNIT'] = true
      spellframe.usemouseover = true
      spellframe.baseunit = config.baseunit or 'target'
    end
    spellframe.alwaysrefresh = true
--    interestingEvent['UNIT_AURA'] = true
    local tcp = type(config.playerbuff)
    if tcp == 'number' then
      spellframe.auraname = (GetSpellInfo(config.playerbuff))
    elseif tcp == 'table' then
      spellframe.auraname = {}
      spellframe.auranamePrimary = (GetSpellInfo(config.spellID))
      for i,id in ipairs(config.playerbuff) do
        tinsert(spellframe.auraname, (GetSpellInfo(id)))
      end
      spellframe.AuraFunction = UnitBuffUnique
    else
      spellframe.auraname = spellname
    end

    if config.dot then    -- Register for periodic effect intervals.
      spellframe.dot = config.dot
      spellframe.AddTicks = AddTicks.stop
      interestingCLEU.SPELL_PERIODIC_HEAL = true
      if config.refreshable then
        spellframe.refreshable = true
        spellframe.UNIT_AURA = SpellFrame.UNIT_AURA_refreshable
--        spellframe.PLAYER_TARGET_CHANGED = SpellFrame.PLAYER_TARGET_CHANGED_refreshable
        interestingEvent['PLAYER_REGEN_ENABLED'] = true
        interestingCLEU.SPELL_CAST_SUCCESS=true
        spellframe.debuffs = {}
        spellframe.castsuccess = {}
      end
    end

  elseif config.totem then
    spellframe.totem = config.totem
    spellframe.isType = 'playerbuff'
    spellframe.auraunit = config.auraunit or 'player'
    spellframe.AuraFunction = 'GetTotemInfo'
    vars.buff[spellframe.auraunit] = {}
    spellframe.alwaysrefresh = true
    spellframe.auraname = GetSpellInfo(config.totem)
  end


  if config.cleu or config.event then -- Register custom CLEU events.
    if config.event then -- Optional alias for the forgetful.
      config.cleu = config.event
    end
    local cleu = type(config.cleu)
    if cleu == 'string' then -- Single event
      interestingCLEU[config.cleu] = true
    elseif cleu == 'table' then
      for i in pairs(config.cleu) do -- Multiple events
        interestingCLEU[ config.cleu[i] ] = true
      end
    end
  end

  spellframe.hasted = config.hasted
  spellframe.minstacks = config.minstacks
  spellframe.stance = config.stance
  spellframe.notstance = config.notstance
  spellframe.internalcooldown = config.internalcooldown
  spellframe.bartexture = config.bartexture
  spellframe.barcolors = config.barcolors or {}
  spellframe.unique = config.unique
  spellframe.uniqueID = config.uniqueID
  spellframe.keepIcon = config.keepIcon
  spellframe.smallCooldown = config.smallCooldown

  spellframe.interestingCLEU = interestingCLEU
  return interestingEvent
end

function ns:getColor(config, typeid)
  debug("getColor", config, typeid, config.barcolors[typeid] and typeid or "default color")
  return config.barcolors[typeid] or self.colors[typeid]
end

function ns:CreateSpellBar(config)
  local slotname, spellname, tex, _

  local spellframe = CreateFrame('Frame', nil, mainframe)
  mainframe.numframes = mainframe.numframes+1

  spellframe.interestingEvent = SetSpellAttributes(spellframe,config)

  -- Create the bar.
  spellframe.indicators = {}
  if ns.config.barbg then
    spellframe:SetBackdrop{bgFile = vars.bartexture}
    spellframe:SetBackdropColor(unpack(self:getColor(spellframe, "barbgcolor")))
  end

  spellframe.icon = spellframe:CreateTexture(nil, 'BORDER')
  spellframe.icon:SetTexture(spellframe.iconTexture)

  spellframe.stacks = spellframe:CreateFontString(nil, 'OVERLAY')
  if vars.stackFont then
    spellframe.stacks:SetFont(vars.stackFont,vars.stackFontSize)
    if vars.stackFontShadow then
      spellframe.stacks:SetShadowColor(unpack(vars.stackFontShadow))
      spellframe.stacks:SetShadowOffset(unpack(vars.stackFontShadowOffset))
    end
  else
    spellframe.stacks:SetFontObject('NumberFontNormalSmall')
  end
  spellframe.stacks:SetVertexColor(unpack(vars.stackFontColor))

  for k,v in pairs(SpellFrame) do
    if not spellframe[k] then spellframe[k] = v end
  end

  spellframe:SetScript('OnEvent', EventHandler)
  spellframe:SetScript('OnUpdate', spellframe.OnUpdate)

  local sfi = self.config.hideIcons
  local sor = self.config.stackOnRight
  -- Layout
  spellframe.stacks:SetPoint((sfi and not(sor)) and 'BOTTOMLEFT' or 'BOTTOMRIGHT', (sfi or sor) and spellframe or spellframe.icon, (sfi and not(sor)) and 'BOTTOMLEFT' or 'BOTTOMRIGHT')
  spellframe.stacks:SetJustifyH(sor and 'LEFT' or 'RIGHT')

  spellframe:Activate()

  if config.slotID then
    spellframe:PLAYER_EQUIPMENT_CHANGED(config.slotID)  -- Initialize trinkets and such if needed.
  end

  return spellframe
end

function ns:LoadModules()
  for i,module in pairs(self.modules) do
    if not EventHorizonDB[i] then EventHorizonDB[i] = { isActive = true } end
    if (EventHorizonDB[i] and EventHorizonDB[i].isActive == true) or module.alwaysLoad then
      if not(self.modules[i].Enable) then self.modules[i].Enable = function () end end
      if not(self.modules[i].Disable) then self.modules[i].Disable = function () end end
      self.modules[i]:Init()
      self.modules[i]:Enable()
      vars.modulesLoaded = true
    end
  end
end

function ns:ActivateModule(module,slash)
  if EventHorizonDB[module].isActive ~= true then
    self.modules[module].isActive = true
    EventHorizonDB[module].isActive = true
    if not(self.modules[module].isReady == true) then self.modules[module].Init() end
    self.modules[module].Enable(slash)
  end
end

function ns:DeactivateModule(module,slash)
  if EventHorizonDB[module].isActive == true then
    self.modules[module].isActive = false
    EventHorizonDB[module].isActive = false
    if not(self.modules[module].isReady == true) then self.modules[module].Init() end
    self.modules[module].Disable(slash)
  end
end

function ns:ToggleModule(module,slash)
  if EventHorizonDB[module].isActive ~= true then
    self:ActivateModule(module,slash)
  else
    self:DeactivateModule(module,slash)
  end
end

-- External event handler for modules, same rules as EH's event handler (passes self, extra args, event is presumed known)
function ns:ModuleEvent(event, ...)
  for i,module in pairs(self.modules) do
    local f = module[event]
    if f then
      f(module,...)
    end
  end
end

function ns:Activate(...)
  local activate = select('#',...) == 0 or ...
  --debug('Activate',activate, ...)
  if not activate then
    return self:Deactivate()
  end
  for k,v in pairs(mainframeEvents) do
    mainframe:RegisterEvent(k)
  end

  self.isActive = true
  vars.visibleFrame = true

  if (self.modules.redshift.isReady and EventHorizonDB.redshift.isActive == true) then
    self.modules.redshift:Check()
  else
    mainframe:Show()
  end
end

function ns:Deactivate()
  if self.isActive==false then
    return
  end
  mainframe:UnregisterAllEvents()
  mainframe:RegisterEvent('ACTIVE_TALENT_GROUP_CHANGED')

  mainframe:Hide()

  self.isActive = false
end

function ns:InitDB()
  if not EventHorizonDB then EventHorizonDB = self.defaultDB end
--  print('initdb')
  local reset
    -- Upgrade DB.
  if EventHorizonDB and not EventHorizonDB.version then
    EventHorizonDB.version = 0
  end
  if EventHorizonDB.version ~= EventHorizon.defaultDB.version then
    reset = true
    table.wipe(EventHorizonDB)
    EventHorizonDB = Clone(ns.defaultDB)
  end

  if not EventHorizonDBG then EventHorizonDBG = self.defaultDBG end
    -- Upgrade DB.
  if EventHorizonDBG and not EventHorizonDBG.version then
    EventHorizonDBG.version = 0
  end
  if EventHorizonDBG.version ~= EventHorizon.defaultDBG.version then
    reset = true
    table.wipe(EventHorizonDBG)
    EventHorizonDBG = Clone(ns.defaultDBG)
  end

  -- If profile doesn't exist, set it to the default.
  EventHorizonDBG.profilePerChar[playername] = EventHorizonDBG.profilePerChar[playername] or EventHorizonDBG.defaultProfile
  local ppc = EventHorizonDBG.profilePerChar[playername]

  if not EventHorizonDBG.profiles[ppc] then
    EventHorizonDBG.profiles[ppc] = {}
  end
  self.vars.currentProfile = EventHorizonDBG.profiles[ppc]

  if reset then
    print('Your savedvariables have been reset due to potential conflicts with older versions.')
  end

  self.db = EventHorizonDB
  self.dbg = EventHorizonDBG
end

-- We only want to show the empty frame tip if it's been more than
function ns:DisplayEmptyFrameTip()
  if EventHorizonDB.DisplayEmptyFrameTipLastShown == true then return end -- If true, then never show

  EventHorizonDB.DisplayEmptyFrameTipLastShown = EventHorizonDB.DisplayEmptyFrameTipLastShown or 0
  if time() > EventHorizonDB.DisplayEmptyFrameTipLastShown + (60*60*24*3) then -- Only show every couple days
    StaticPopup_Show("EH_DisplayEmptyFrameTip")
  end
end


--[[
Should only be called after the DB is loaded and spell and talent information is available.
--]]
function ns:Initialize()
  -- Make sure this function is called only once.
  --self.Initialize = nil
  --print('initialize')
  self:InitDB()
  local popupIn = function(popup_to_show, delay)
    local popup_f = CreateFrame("frame")
    local elapsedTime = 0
    popup_f:SetScript("OnUpdate", function(self, elapsed)
      elapsedTime = elapsedTime + elapsed
      if elapsedTime > delay then
        StaticPopup_Show(popup_to_show)
        popup_f:SetScript("OnUpdate", nil)
        popup_f = nil
      end
    end)
  end

  StaticPopupDialogs["EH_WodDialog"] = {
    text = WodStatusText,
    showAlert = true,
    button1 = "Hide Forever",
    button2 = "Hide",
    hideOnEscape = 1,
    OnAccept = function()
      StaticPopup_Hide("EH_WodDialog")
      EventHorizonDB.__WodClassStatusNotification2 = true
    end
  }

  StaticPopupDialogs["EH_GithubDialog1"] = {
    text = "EventHorizon is now on Github! If you encounter any bugs or errors with EventHorizon, please create a new 'issue' on the below Github so I can track and fix it!",
    hasEditBox = true,
    button1 = "Okay",
    hideOnEscape = 1,
    OnShow = function(self, data)
      self.editBox:SetText("https://github.com/Brusalk/EventHorizon_Continued")
    end,
    EditBoxOnTextChanged = function(self, data)
      self:SetText("https://github.com/Brusalk/EventHorizon_Continued") -- Esentially don't allow them to change the value
    end,
    OnAccept = function()
      StaticPopup_Hide("EH_GithubDialog1")
      EventHorizonDB.__GithubDialog1NotificationShadowlands = true
    end,
  }

  StaticPopupDialogs["EH_DiscordDialog1"] = {
    text = "EventHorizon now has a Discord! Come say hi, and feel free to ask some questions!",
    hasEditBox = true,
    button1 = "Okay",
    hideOnEscape = 1,
    OnShow = function(self, data)
      self.editBox:SetText("discord.gg/mR8xUUK")
    end,
    EditBoxOnTextChanged = function(self, data)
      self:SetText("discord.gg/mR8xUUK") -- Esentially don't allow them to change the value
    end,
    OnAccept = function()
      EventHorizonDB.__DiscordDialog1NotificationShadowlands = true
    end,
    OnHide = function()
      StaticPopup_Hide("EH_DiscordDialog1")
      if not EventHorizonDB.__GithubDialog1NotificationShadowlands then
         popupIn("EH_GithubDialog1", 0.5)
      end
    end,
  }

  StaticPopupDialogs["EH_LegionDialog2"] = {
    text = BuildLegionClassConfigStatusText(),
    showAlert = true,
    button1 = "Hide Forever",
    button2 = "Hide",
    hideOnEscape = 1,
    OnAccept = function()
      EventHorizonDB.__LegionClassConfigStatusNotification2 = true
    end,
    OnHide = function()
      StaticPopup_Hide("EH_LegionDialog2")
      if not EventHorizonDB.__DiscordDialog1Notification then
        popupIn("EH_DiscordDialog1", 0.5)
      end
    end,
  }


  StaticPopupDialogs["EH_LegionDialog1"] = {
    text = LegionStatusText,
    showAlert = true,
    button1 = "Hide Forever",
    button2 = "Hide",
    hideOnEscape = 1,
    OnAccept = function()
      EventHorizonDB.__LegionClassStatusNotification2 = true
    end,
    OnHide = function()
      StaticPopup_Hide("EH_LegionDialog1")
      if not EventHorizonDB.__LegionClassConfigStatusNotification2 then
        popupIn("EH_LegionDialog2", 0.5)
      end
    end,
  }

  StaticPopupDialogs["EH_BFADialog2"] = {
    text = BuildBFAClassConfigStatusText(),
    showAlert = true,
    button1 = "Hide Forever",
    button2 = "Hide",
    hideOnEscape = 1,
    OnAccept = function()
      EventHorizonDB.__BFAClassConfigStatusNotification2 = true
    end,
    OnHide = function()
      StaticPopup_Hide("EH_BFADialog2")
      if not EventHorizonDB.__DiscordDialog1Notification then
        popupIn("EH_DiscordDialog1", 0.5)
      end
    end,
  }


  StaticPopupDialogs["EH_BFADialog1"] = {
    text = BFAStatusText,
    showAlert = true,
    button1 = "Hide Forever",
    button2 = "Hide",
    hideOnEscape = 1,
    OnAccept = function()
      EventHorizonDB.__BFAClassStatusNotification2 = true
    end,
    OnHide = function()
      StaticPopup_Hide("EH_BFADialog1")
      if not EventHorizonDB.__BFAClassConfigStatusNotification2 then
        popupIn("EH_BFADialog2", 0.5)
      end
    end,
  }

  StaticPopupDialogs["EH_EmptyConfig"] = {
    text = "EventHorizon: Failed to load any spell configs for your spec. Either your spec has not been implemented yet, or there was an error loading your config. Consider checking your class config.\n\nEventHorizon will not display until the spell config is fixed",
    showAlert = true,
    button1 = "Okay",
    hideOnEscape = 1
  }

  StaticPopupDialogs["EH_DisplayEmptyFrameTip"] = {
    text = "EventHorizon is currently hidden. This is not a bug! This is because your current class config doesn't show any bars for your current talents/stance/level, etc.",
    showAlert = true,
    button2 = "Hide",
    button1 = "Hide Forever",
    OnAccept = function()
      EventHorizonDB.DisplayEmptyFrameTipLastShown = true
    end,
    OnHide = function()
      EventHorizonDB.DisplayEmptyFrameTipLastShown = EventHorizonDB.DisplayEmptyFrameTipLastShown == true and true or time()
    end,
    hideOnEscape = 1
  }


  StaticPopupDialogs["EH_ShadowlandsDialog2"] = {
    text = BuildShadowlandsClassConfigStatusText(),
    showAlert = true,
    button1 = "Hide Forever",
    button2 = "Hide",
    hideOnEscape = 1,
    OnAccept = function()
      EventHorizonDB.__ShadowlandsClassConfigStatusNotification2 = true
    end,
    OnHide = function()
      StaticPopup_Hide("EH_ShadowlandsDialog2")
      if not EventHorizonDB.__DiscordDialog1Notification then
        popupIn("EH_DiscordDialog1", 0.5)
      end
    end,
  }


  StaticPopupDialogs["EH_ShadowlandsDialog1"] = {
    text = ShadowlandsStatusText,
    showAlert = true,
    button1 = "Hide Forever",
    button2 = "Hide",
    hideOnEscape = 1,
    OnAccept = function()
      EventHorizonDB.__ShadowlandsClassStatusNotification2 = true
    end,
    OnHide = function()
      StaticPopup_Hide("EH_ShadowlandsDialog1")
      if not EventHorizonDB.__ShadowlandsClassConfigStatusNotification2 then
        popupIn("EH_ShadowlandsDialog2", 0.5)
      end
    end,
  }

  if Shadowlands then
    if EventHorizonDB.__ShadowlandsClassStatusNotification2 then -- Dialog1 hidden
      if EventHorizonDB.__ShadowlandsClassConfigStatusNotification2 then -- We've hidden dialog2
        if EventHorizonDB.__DiscordDialog1NotificationShadowlands then
          if not EventHorizonDB.__GithubDialog1NotificationShadowlands then
            popupIn("EH_GithubDialog1", 2)
          end
        else
          popupIn("EH_DiscordDialog1", 2)
        end
      else
        popupIn("EH_ShadowlandsDialog2", 2)
      end
    else
      popupIn("EH_ShadowlandsDialog1", 2) -- Need to show Dialog1
    end
  elseif BFA then
    if EventHorizonDB.__BFAClassStatusNotification2 then -- Dialog1 hidden
      if EventHorizonDB.__BFAClassConfigStatusNotification2 then -- We've hidden dialog2
        if EventHorizonDB.__DiscordDialog1NotificationBFA then
          if not EventHorizonDB.__GithubDialog1NotificationBFA then
            popupIn("EH_GithubDialog1", 2)
          end
        else
          popupIn("EH_DiscordDialog1", 2)
        end
      else
        popupIn("EH_BFADialog2", 2)
      end
    else
      popupIn("EH_BFADialog1", 2) -- Need to show Dialog1
    end
  elseif Legion then
    if EventHorizonDB.__LegionClassStatusNotification2 then -- Dialog1 hidden
      if EventHorizonDB.__LegionClassConfigStatusNotification2 then -- We've hidden dialog2
        if EventHorizonDB.__DiscordDialog1Notification then
          if not EventHorizonDB.__GithubDialog1Notification then
            popupIn("EH_GithubDialog1", 2)
          end
        else
          popupIn("EH_DiscordDialog1", 2)
        end
      else
        popupIn("EH_LegionDialog2", 2)
      end
    else
      popupIn("EH_LegionDialog1", 2) -- Need to show Dialog1
    end
  end

  --debug('GetTalentInfo(1,1)',GetTalentInfo(1,1))
  vars.playerguid = UnitGUID('player')

  -- Create the main and spell frames.
  mainframe:SetHeight(1)
  mainframe.numframes = 0
  mainframe.framebyspell= {}
  mainframe:SetScript('OnEvent', EventHandler)
  mainframe:SetScale(self.config.scale or 1)

  vars.buff.player = {}

  if not self:LoadClassModule() then
    return
  end

  self:ApplyConfig()

  if self.config.showTrinketBars and self.config.showTrinketBars == true then
    self:NewSpell({slotID = 13})
    self:NewSpell({slotID = 14})
  end

  local sfi = self.config.hideIcons
  mainframe:SetWidth(vars.barwidth + (sfi and 0 or self.config.height))

  self:SetupStyleFrame()    -- Spawn backdrop frame.

  -- Create the indicator for the current time.
  -- Bugfix: When the UI scale is at a very low setting, textures with a width of 1
  -- were not visible in some resolutions.
  local effectiveScale = mainframe:GetEffectiveScale()
  if effectiveScale then
    vars.onepixelwide = 1/effectiveScale
  end
  --nowI = CreateFrame('Frame',nil,mainframe)
  --nowI:SetFrameLevel(20)
  ns.frames.nowIndicator = mainframe:CreateTexture(nil, 'ARTWORK', nil, draworder.nowI)

  ns.frames.nowIndicator:SetPoint('BOTTOM',mainframe,'BOTTOM')
  ns.frames.nowIndicator:SetPoint('TOPLEFT',mainframe,'TOPLEFT', vars.nowleft, 0)
  ns.frames.nowIndicator:SetWidth(vars.onepixelwide)
  ns.frames.nowIndicator:SetColorTexture(unpack(self.colors.nowLine))
  if self.config.blendModes.nowLine and type(self.config.blendModes.nowLine) == 'string' then
    ns.frames.nowIndicator:SetBlendMode(self.config.blendModes.nowLine)
  end

  local anchor = self.config.anchor or {'TOPRIGHT', 'EventHorizonHandle', 'BOTTOMRIGHT'}
  if anchor[2]=='EventHorizonHandle' then
    -- Create the handle to reposition the frame.
    handle = CreateFrame('Frame', 'EventHorizonHandle', mainframe)
    handle:SetFrameStrata('HIGH')
    handle:SetWidth(10)
    handle:SetHeight(5)
    handle:EnableMouse(true)
    handle:SetClampedToScreen(1)
    handle:RegisterForDrag('LeftButton')
    handle:SetScript('OnDragStart', function(handle, button) handle:StartMoving() end)
    handle:SetScript('OnDragStop', function(handle)
      handle:StopMovingOrSizing()
      local a,b,c,d,e = handle:GetPoint(1)
      if type(b)=='frame' then
        b=b:GetName()
      end
      EventHorizonDB.point = {a,b,c,d,e}
    end)
    handle:SetMovable(true)

    mainframe:SetPoint(unpack(anchor))
    handle:SetPoint(unpack(EventHorizonDB.point))

    handle.tex = handle:CreateTexture(nil, 'ARTWORK', nil, 7)
    handle.tex:SetAllPoints()
    handle:SetScript('OnEnter',function(frame) frame.tex:SetColorTexture(1,1,1,1) end)
    handle:SetScript('OnLeave',function(frame) frame.tex:SetColorTexture(1,1,1,0.1) end)
    handle.tex:SetColorTexture(1,1,1,0.1)

    if EventHorizonDB.isLocked then
      handle:Hide()
    end
  end

  vars.gcdSpellName = self.config.gcdSpellID and (GetSpellInfo(self.config.gcdSpellID))
  if vars.gcdSpellName and self.config.gcdStyle then
    -- Create the GCD indicator, register cooldown event.
    ns.frames.gcd = mainframe:CreateTexture(nil, 'ARTWORK',nil,draworder.gcd)
    ns.frames.gcd:SetPoint('BOTTOM',mainframe,'BOTTOM')
    ns.frames.gcd:SetPoint('TOP',mainframe,'TOP')
    ns.frames.gcd:Hide()

    if self.config.gcdStyle == 'line' then
      ns.frames.gcd:SetWidth(vars.onepixelwide)
    else
      ns.frames.gcd:SetPoint('LEFT',mainframe,'LEFT', vars.nowleft, 0)
    end

    local gcdColor = self.colors.gcdColor or {.5,.5,.5,.3}
    ns.frames.gcd:SetColorTexture(unpack(gcdColor))
    if self.config.blendModes.gcdColor and type(self.config.blendModes.gcdColor) == 'string' then
      ns.frames.gcd:SetBlendMode(self.config.blendModes.gcdColor)
    end
  end

  if not(ns.config.hastedSpellID and type(ns.config.hastedSpellID) == 'table') then
    vars.useOldHaste = true
  end

  if ns.config.nonAffectingHaste then
    if type(ns.config.nonAffectingHaste[1]) == 'number' then
      ns.config.nonAffectingHaste = {ns.config.nonAffectingHaste}
    end
  end

  mainframe:SetPoint(unpack(anchor))

  SLASH_EVENTHORIZON1 = '/eventhorizon'
  SLASH_EVENTHORIZON2 = '/ehz'
  SlashCmdList['EVENTHORIZON'] = function(msg)
    local cmd = string.lower(msg)
    local toggle = not(msg) or cmd == ''

    if cmd == 'help' then
      print('Use "/eventhorizon" or "/ehz" to show or hide EventHorizon.')
      print('To enable or disable a module, use "/ehz ModuleName". For example, "/ehz redshift".')
      print('To see a list of currently installed modules and visible bars, use "/ehz status".')
      if anchor[2]=='EventHorizonHandle' then
        print('  EventHorizon is currently '..(EventHorizonDB.isLocked and 'locked.' or 'movable.'))
        print('  To '..(EventHorizonDB.isLocked and 'unlock ' or 'lock ')..'EventHorizon, use "/ehz lock".')
        print('  If you are unable see or move EventHorizon, use "/ehz reset".')
      end
    elseif cmd == 'status' then
      print('Installed plugins:')
      for i in pairs(self.modules) do print('  '..i) end
      print('Visible bars:')
      for i,v in pairs(self.frames.shown) do print('  ' .. v.spellname) end
    elseif cmd == 'reset' then
      if anchor[2]=='EventHorizonHandle' then
        print('Resetting EventHorizon\'s position.')
        EventHorizonHandle:SetPoint(unpack(self.defaultDB.point))
        self:CheckTalents()
      else
        print"The frame is otherwise anchored. Adjust config.anchor in [my]config.lua to move EventHorizon."
      end
    elseif cmd == 'lock' then
      if anchor[2]=='EventHorizonHandle' then
        if EventHorizonHandle:IsShown() then
          EventHorizonHandle:Hide()
          EventHorizonDB.isLocked = true
        else
          EventHorizonHandle:Show()
          EventHorizonDB.isLocked = nil
        end
        print("The frame is now "..(EventHorizonDB.isLocked and 'locked.' or 'unlocked.'))
      else
        print"The frame is otherwise anchored. Adjust config.anchor in [my]config.lua to move EventHorizon."
      end
    elseif self.modules[cmd] then
      self:ToggleModule(string.lower(msg))
      print(string.lower(msg)..' has been turned '..((self.modules[string.lower(msg)].isActive == true) and 'ON' or 'OFF')..'.')
    elseif toggle then
      if self.isActive then
        print('Deactivating. Use "/ehz help" to see what else you can do.')
        self:Deactivate()
        mainframe:UnregisterEvent('ACTIVE_TALENT_GROUP_CHANGED')
      else
        print('Activating. Use "/ehz help" to see what else you can do.')
        print('Will be hidden automatically if there\' no active bars')
        self:Activate()
        self:CheckTalents()
      end
    else
      print('Invalid command. Use "/ehz" alone to show or hide EventHorizon, or "/ehz help" to see a list of commands.')
    end
    EventHorizonDB.isActive = self.isActive
  end

  ns.isActive = EventHorizonDB.isActive
  if not EventHorizonDB.isActive then
    self:Deactivate()
    mainframe:UnregisterEvent('ACTIVE_TALENT_GROUP_CHANGED')
  end


  -- Display helpful error message if there was a problem loading the class config
  debug("config: " .. #self.frames.config)
  if #self.frames.config < 1 then
    StaticPopup_Show("EH_EmptyConfig")
  end

  ns.mainframe:Hide() -- Hide EH until the config loads
  ns:Load()

end


function ns:Load()
  if self.isReady then return end
  self.isReady = true
  self:CheckRequirements()
  self:LoadModules()

  debug("frames shown " .. #self.frames.shown)
  if #self.frames.shown < 1 then
    ns:DisplayEmptyFrameTip()
  else
    ns.mainframe:Show()
  end
end

function ns:ApplyConfig()
  table.wipe(ns.vars.config)
  local config = {}
  local ppc = EventHorizonDBG.profilePerChar[playername] -- EventHorizonDBG.profilePerChar[playername] = 'ProfileName'
  if ppc then
    config = EventHorizonDBG.profiles[ppc] -- EventHorizon.profiles[ProfileName] = {overriddenConfig}
  end
  setmetatable(config,{__index = ns.config}) -- Set non-overridden values to what is in [my]config.lua
  self:InitializeClass() -- Set config values in class modules

  vars.past = -math.abs(config.past or -3)  -- We really don't want config.past to be positive, so negative absolute values work great here.
  vars.future = math.abs(config.future or 9)
  vars.barheight = config.height or 18
  vars.barwidth = config.width or 150
  vars.barspacing = config.spacing or 0
  vars.scale = 1/(vars.future-vars.past)
  vars.bartexture = config.bartexture or 'Interface\\Addons\\EventHorizon\\Smooth'
  vars.texturedbars = config.texturedbars
  vars.texturealpha = config.texturealphamultiplier or 1
  vars.classburn = config.classburn or 0.7
  vars.classalpha = config.classalpha or 0.3
  vars.castLine = config.castLine and ((type(config.castLine) == 'number' and config.castLine) or config.castLine == true and 0) or nil
  vars.nowleft = -vars.past/(vars.future-vars.past)*vars.barwidth-0.5 + (config.hideIcons and 0 or config.height)

  local classcolors = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS
  self.classcolor = Clone(classcolors[select(2,UnitClass('player'))])

  vars.stackFont = config.stackFont
  vars.stackFontSize = config.stackFontSize
  vars.stackFontColor = config.stackFontColor == true and {1,1,1,1} or config.stackFontColor or {1,1,1,1}
  vars.stackFontShadow = config.stackFontShadow == true and {0,0,0,0.5} or config.stackFontShadow or {0,0,0,0.5}
  vars.stackFontShadowOffset = config.stackFontShadowOffset == true and {1,-1} or config.stackFontShadowOffset or {1,-1}

  for colorid,color in pairs(self.colors) do
    if color[1] == true then
      if color[2] then
        self.colors[colorid] = {self.classcolor.r * color[2], self.classcolor.g * color[2], self.classcolor.b * color[2], color[3] or vars.classalpha}    -- For really bad reasons, this took a very long time to get right...
      else
        self.colors[colorid] = {self.classcolor.r, self.classcolor.g, self.classcolor.b, vars.classalpha}
      end
    end
  end

  if vars.texturedbars then
    for colorid,color in pairs(self.colors) do
      if color[4] and not(exemptColors[colorid]) then
        color[4] = vars.texturealpha*color[4]
      end
    end
  end

  local layouts = self.layouts
  layouts.frameline = {
    top = 0,
    bottom = 1,
  }
  local default = layouts.default
  for typeid,layout in pairs(layouts) do
    if typeid~='default' then
      for k,v in pairs(default) do
        if layout[k]==nil then
          layout[k] = v
        end
      end
    end
    layout.texcoords = {0, 1, layout.top, layout.bottom}
  end

  ns:ModuleEvent('ApplyConfig')
end

function ns:UpdateConfig()
  if not(self.isReady) then return end
  self:ApplyConfig()

  mainframe:SetScale(self.config.scale or 1)
  local effectiveScale = mainframe:GetEffectiveScale()
  if effectiveScale then
    vars.onepixelwide = 1/effectiveScale
  end

  self:SetupStyleFrame()    -- Spawn backdrop frame.

  vars.nowleft = -vars.past/(vars.future-vars.past)*vars.barwidth-0.5 + (ns.config.hideIcons and 0 or ns.config.height)
  --nowI:SetFrameLevel(20)
  ns.frames.nowIndicator:SetPoint('BOTTOM',mainframe,'BOTTOM')
  ns.frames.nowIndicator:SetPoint('TOPLEFT',mainframe,'TOPLEFT', vars.nowleft, 0)
  ns.frames.nowIndicator:SetColorTexture(unpack(self.colors.nowLine))

  local anchor = self.config.anchor or {'TOPRIGHT', 'EventHorizonHandle', 'BOTTOMRIGHT'}
  if anchor[2]=='EventHorizonHandle' then
    -- Create the handle to reposition the frame.
    handle = handle or CreateFrame('Frame', 'EventHorizonHandle', mainframe)
    handle:SetFrameStrata('HIGH')
    handle:SetWidth(10)
    handle:SetHeight(5)
    handle:EnableMouse(true)
    handle:SetClampedToScreen(1)
    handle:RegisterForDrag('LeftButton')
    handle:SetScript('OnDragStart', function(handle, button) handle:StartMoving() end)
    handle:SetScript('OnDragStop', function(handle)
      handle:StopMovingOrSizing()
      local a,b,c,d,e = handle:GetPoint(1)
      if type(b)=='frame' then
        b=b:GetName()
      end
      EventHorizonDB.point = {a,b,c,d,e}
    end)
    handle:SetMovable(true)

    mainframe:SetPoint(unpack(anchor))
    handle:SetPoint(unpack(EventHorizonDB.point))

    handle.tex = handle:CreateTexture(nil, 'BORDER')
    handle.tex:SetAllPoints()
    handle:SetScript('OnEnter',function(frame) frame.tex:SetColorTexture(1,1,1,1) end)
    handle:SetScript('OnLeave',function(frame) frame.tex:SetColorTexture(1,1,1,0.1) end)
    handle.tex:SetColorTexture(1,1,1,0.1)
  end

  vars.gcdSpellName = self.config.gcdSpellID and (GetSpellInfo(self.config.gcdSpellID))
  if vars.gcdSpellName and self.config.gcdStyle then
    -- Create the GCD indicator, register cooldown event.
    ns.frames.gcd = mainframe:CreateTexture('EventHorizonns.frames.gcd', 'BORDER')
    ns.frames.gcd:SetPoint('BOTTOM',mainframe,'BOTTOM')
    ns.frames.gcd:SetPoint('TOP',mainframe,'TOP')
    ns.frames.gcd:Hide()

    if self.config.gcdStyle == 'line' then
      ns.frames.gcd:SetWidth(vars.onepixelwide)
    else
      ns.frames.gcd:SetPoint('LEFT',mainframe,'LEFT', vars.nowleft, 0)
    end

    local gcdColor = self.colors.gcdColor or {.5,.5,.5,.3}
    ns.frames.gcd:SetColorTexture(unpack(gcdColor))
  end

  mainframe:SetPoint(unpack(anchor))
  self:SetFrameDimensions()
end

local loginCheck = function ()
  if ns.isActive == true then
    ns:CheckTalents()

    for i,spellframe in pairs(ns.frames.shown) do
      if spellframe.slotID then spellframe:PLAYER_EQUIPMENT_CHANGED(spellframe.slotID) end
    end
  end
end

function ns:SetupStyleFrame()
  local c = self.config.backdrop
  if c then
    if not(self.styleframe) then self.styleframe = CreateFrame('Frame',nil,mainframe) end
  else
    if self.styleframe then self.styleframe:Hide() end
    return
  end

  local styleframe = self.styleframe
  local stylebg = self.config.bg or 'Interface\\ChatFrame\\ChatFrameBackground'
  local styleborder = self.config.border or 'Interface\\Tooltips\\UI-Tooltip-Border'
  local stylebgcolor = self.colors.bgcolor or {0,0,0,0.6}
  local stylebordercolor = self.colors.bordercolor or {1,1,1,1}
  local styleinset = self.config.inset or {top = 2, bottom = 2, left = 2, right = 2}
  local stylepadding = self.config.padding or 3
  local styleedge = self.config.edgesize or 8

  styleframe:SetFrameStrata('BACKGROUND')
  styleframe:SetPoint('TOPRIGHT', mainframe, 'TOPRIGHT', stylepadding, stylepadding)
  styleframe:SetPoint('BOTTOMLEFT', mainframe, 'BOTTOMLEFT', -stylepadding, -stylepadding)
  styleframe:SetBackdrop({
    bgFile = stylebg,
    edgeFile = styleborder, tileSize = 0, edgeSize = styleedge,
    insets = styleinset,
  })
  styleframe:SetBackdropColor(unpack(stylebgcolor))
  styleframe:SetBackdropBorderColor(unpack(stylebordercolor))
end

function ns:RegisterModule(module,namespace)
  if not(module and namespace) then
    print("Module registration failed. Usage: EventHorizon:RegisterModule(module,namespace)")
  end
  local module = string.lower(module)
  self.modules[module] = namespace
end


frame:SetScript('OnEvent', EventHandler)
frame:RegisterEvent('PLAYER_LOGIN')

frame.PLAYER_ALIVE = function (self)
  self:SetScript('OnUpdate', UpdateMouseover)
  frame2:SetScript('OnEvent', EventHandler)
  for k,v in pairs(reloadEvents) do
    frame2:RegisterEvent(k)
    frame2[k] = loginCheck
  end
  if not(ns.isReady) then
    ns:Initialize()
  else
    ns:LoadModules()
  end
  self:UnregisterEvent('PLAYER_ALIVE')
end

frame.PLAYER_LOGIN = function (self)
  local talents = GetTalentInfo(1)
  if talents then
    self:UnregisterEvent('PLAYER_LOGIN')
    self:SetScript('OnUpdate', UpdateMouseover)
    frame2:SetScript('OnEvent', EventHandler)
    for k,v in pairs(reloadEvents) do
      frame2:RegisterEvent(k)
      frame2[k] = loginCheck
    end
    if not(ns.isReady) then
      ns:Initialize()
    else
      ns:LoadModules()
    end
  else
    self:UnregisterEvent('PLAYER_LOGIN')
    self:RegisterEvent('PLAYER_ALIVE')
  end
end

mainframe.CLEU_OtherInterestingSpell = mainframe_CLEU_OtherInterestingSpell
mainframe.UPDATE_SHAPESHIFT_FORM = mainframe_UPDATE_SHAPESHIFT_FORM
mainframe.SPELL_UPDATE_COOLDOWN = mainframe_SPELL_UPDATE_COOLDOWN
mainframe.COMBAT_LOG_EVENT_UNFILTERED = mainframe_COMBAT_LOG_EVENT_UNFILTERED
mainframe.UPDATE_SHAPESHIFT_FORMS = mainframe_UPDATE_SHAPESHIFT_FORM
mainframe.PLAYER_TALENT_UPDATE = ns.CheckTalents
mainframe.ACTIVE_TALENT_GROUP_CHANGED = ns.CheckTalents
mainframe.PLAYER_LEVEL_UP = ns.CheckTalents
mainframe.PLAYER_TARGET_CHANGED = mainframe_PLAYER_TARGET_CHANGED
mainframe.UNIT_AURA = mainframe_UNIT_AURA
mainframe.PLAYER_TOTEM_UPDATE = mainframe_PLAYER_TOTEM_UPDATE
mainframe.PLAYER_ENTERING_WORLD = mainframe_PLAYER_ENTERING_WORLD

SpellFrame.NotInteresting = SpellFrame_NotInteresting
SpellFrame.AddSegment = SpellFrame_AddSegment
SpellFrame.AddIndicator = SpellFrame_AddIndicator
SpellFrame.StyleIndicator = SpellFrame_StyleIndicator
SpellFrame.Remove = SpellFrame_Remove
SpellFrame.RemoveTicksAfter = SpellFrame_RemoveTicksAfter
SpellFrame.RemoveChannelTicksAfter = SpellFrame_RemoveChannelTicksAfter
SpellFrame.OnUpdate = SpellFrame_OnUpdate
SpellFrame.UpdateDoT = SpellFrame_UpdateDoT
SpellFrame.UpdateTotem = SpellFrame_UpdateTotem
SpellFrame.Activate = SpellFrame_Activate
SpellFrame.Deactivate = SpellFrame_Deactivate
SpellFrame.FindItemInfo = SpellFrame_FindItemInfo
SpellFrame.SetStacks = SpellFrame_SetStacks

SpellFrame.UNIT_AURA = SpellFrame_UNIT_AURA
SpellFrame.UNIT_AURA_refreshable = SpellFrame_UNIT_AURA_refreshable
SpellFrame.COMBAT_LOG_EVENT_UNFILTERED = SpellFrame_COMBAT_LOG_EVENT_UNFILTERED
SpellFrame.UNIT_SPELLCAST_SENT = SpellFrame_UNIT_SPELLCAST_SENT
SpellFrame.UNIT_SPELLCAST_CHANNEL_START = Cast_Start
SpellFrame.UNIT_SPELLCAST_CHANNEL_UPDATE = Cast_Update
SpellFrame.UNIT_SPELLCAST_CHANNEL_STOP = Cast_Stop
SpellFrame.UNIT_SPELLCAST_START = Cast_Start
SpellFrame.UNIT_SPELLCAST_STOP = Cast_Stop
SpellFrame.UNIT_SPELLCAST_DELAYED = Cast_Update
--SpellFrame.PLAYER_TARGET_CHANGED = SpellFrame_PLAYER_TARGET_CHANGED
--SpellFrame.PLAYER_TARGET_CHANGED_refreshable = SpellFrame_PLAYER_TARGET_CHANGED_refreshable
SpellFrame.PLAYER_REGEN_ENABLED = SpellFrame_PLAYER_REGEN_ENABLED
SpellFrame.SPELL_UPDATE_COOLDOWN = SpellFrame_SPELL_UPDATE_COOLDOWN
SpellFrame.BAG_UPDATE_COOLDOWN = SpellFrame_SPELL_UPDATE_COOLDOWN
SpellFrame.SPELL_UPDATE_CHARGES = SpellFrame_SPELL_UPDATE_CHARGES
SpellFrame.UNIT_SPELL_HASTE = SpellFrame_UNIT_SPELL_HASTE
SpellFrame.PLAYER_EQUIPMENT_CHANGED = SpellFrame_PLAYER_EQUIPMENT_CHANGED
SpellFrame.UPDATE_MOUSEOVER_UNIT = SpellFrame_UPDATE_MOUSEOVER_UNIT
SpellFrame.PLAYER_TOTEM_UPDATE = SpellFrame_PLAYER_TOTEM_UPDATE


local Redshift = {}
Redshift.Check = function (self)
  if EventHorizonDB.redshift.isActive ~= true then
    return Redshift:Disable()
  end
  if not(Redshift.frame) then
    Redshift.frame = CreateFrame("FRAME",nil,UIParent)
    Redshift.frame:SetScript('OnEvent',EventHandler)
    for k,v in pairs(Redshift.Events) do
      if v then
        Redshift.frame:RegisterEvent(k)
        Redshift.frame[k] = Redshift.Check
      end
    end
  end

  local s = Redshift.states

  showState = nil

  local attackable = UnitCanAttack("player","target")
  local targeting = UnitExists("target")
  local focusing = UnitExists("focus")
  local classify = UnitClassification("target")
  local dead = UnitIsDeadOrGhost("target")
  local vehicle = UnitHasVehicleUI("player")

  if(s.showCombat and UnitAffectingCombat("player")) then
    showState = true
  end

  if (s.showFocus and UnitExists("focus")) then
    showState = true
  end

  if targeting then
    if(s.showHelp and not attackable) and not dead then
      showState = true
    end
    if(s.showHarm and attackable) and not dead then
      showState = true
    end
    if(s.showBoss and classify == "worldboss") and not dead then
      showState = true
    end
  end

  if (s.hideVehicle and UnitHasVehicleUI("player")) then
    showState = nil
  end

  if showState then
    vars.visibleFrame = true
    mainframe:Show()
    if EventHorizon_VitalsFrame and s.hideVitals then
      EventHorizon_VitalsFrame:Show()
    end
  else
    vars.visibleFrame = false
    mainframe:Hide()
    if EventHorizon_VitalsFrame and s.hideVitals then
      EventHorizon_VitalsFrame:Hide()
    end
  end
end

Redshift.Init = function ()
  local settingsChanged = EventHorizonDB.redshift.lastConfig ~= ns.config.enableRedshift
  EventHorizonDB.redshift.lastConfig = ns.config.enableRedshift

  if settingsChanged then
    local ends = ns.config.enableRedshift and 'enabled' or 'disabled'
    local settingsString = "Redshift has been "..ends.." via config.lua. Ingame settings have been adjusted to match. Use /ehz redshift to enable or disable Redshift as needed."
    EventHorizonDB.redshift.isActive = ns.config.enableRedshift
  end

  local db = EventHorizonDB.redshift.isActive
  if not (db) then return end

  Redshift.states = {}
  Redshift.Events = {
    ["PLAYER_REGEN_DISABLED"] = true,
    ["PLAYER_REGEN_ENABLED"] = true,
    ["PLAYER_TARGET_CHANGED"] = true,
    ["PLAYER_GAINS_VEHICLE_DATA"] = true,
    ["PLAYER_LOSES_VEHICLE_DATA"] = true,
    ["UNIT_ENTERED_VEHICLE"] = true,
    ["UNIT_EXITED_VEHICLE"] = true,
    ["UNIT_ENTERING_VEHICLE"] = true,
    ["UNIT_EXITING_VEHICLE"] = true,
    ["VEHICLE_PASSENGERS_CHANGED"] = true,
  }

  for k,v in pairs(ns.config.Redshift) do
    if v then
      Redshift.states[k] = true
    end
  end

  if (EventHorizonDB.redshift.isActive == true) then Redshift:Check() end
  Redshift.isReady = true
end

Redshift.Enable = function (slash)
  if EventHorizonDB.redshift.isActive and not(Redshift.isReady) then
    Redshift:Init()
    Redshift:Check()
  elseif EventHorizonDB.redshift.isActive then
    Redshift:Check()
  end
  if Redshift.frame then Redshift.frame:SetScript('OnEvent',EventHandler) end
end

Redshift.Disable = function (slash)
  vars.visibleFrame = true
  if Redshift.frame then Redshift.frame:SetScript('OnEvent',nil) end
  if ns.isActive == true then mainframe:Show() end
end

local Lines = {}
Lines.CreateLines = function ()
  if Lines.frame then return end
  local c = ns.config.Lines
  local db = EventHorizonDB.lines.isActive == true
  if not(c and db) then return
  elseif type(c) == 'number' then c = {c}  -- Turn numbers into delicious tables.
  elseif type(c) ~= 'table' then return  -- Turn away everything else.
  end

  Lines.frame = CreateFrame('Frame',nil,UIParent)
  Lines.line = {}

  local multicolor
  local color = ns.config.LinesColor
  if color and type(color) == 'table' then
    if type(color[1]) == 'table' then
      multicolor = true  -- trying not to further complicate things
      for i,v in ipairs(c) do
        if not(color[i]) then
          color[i] = color[i-1] -- if we have more lines than colors, we need moar colors
        end
      end
    end
  else
    color = {1,1,1,0.5}
  end

  local now = -vars.past/(vars.future-vars.past)*vars.barwidth-0.5 + vars.barheight
  local pps = (vars.barwidth+vars.barheight-now)/vars.future

  for i = 1, #c do
    local seconds = c[i]
    local position = now+(pps*seconds)
    Lines.line[i] = mainframe:CreateTexture(nil,"OVERLAY")
    Lines.line[i]:SetPoint('TOPLEFT', mainframe, 'TOPLEFT', position, 0)
    if multicolor then
      Lines.line[i]:SetColorTexture(unpack(color[i]))
    else
      Lines.line[i]:SetColorTexture(unpack(color))
    end
    Lines.line[i]:SetWidth(vars.onepixelwide)
    Lines.line[i]:SetPoint('BOTTOM', mainframe, 'BOTTOM')
  end

  Lines.Enable = function ()
    for i = 1,#Lines.line do
      Lines.line[i]:Show()
    end
  end

  Lines.Disable = function ()
    for i = 1,#Lines.line do
      Lines.line[i]:Hide()
    end
  end
end

Lines.Init = function ()
  Lines.CreateLines()
  Lines.isReady = true
end
--[[
local Pulse = {
  cache = {},          -- subframe storage
  frames = {},        -- framerefs
  alwaysLoad = true,      -- Flag EH to load the module even when db.isActive ~= true
}

Pulse.Enable = function ()
  local cv = ns.config.Pulse
  local sv = ns.db.pulse
  local int = ns.config.PulseIntensity
  local fps = ns.config.PulseFPS
  if not(fps) or (type(fps) ~= 'number' or fps == 0) then
    fps = ns.defaultconfig.PulseFPS
  end

  if not Pulse.frame then
    Pulse.frame = CreateFrame('Frame',nil,mainframe)
  end

  Pulse.duration = (cv and sv.isActive) and ((cv == true or type(cv) ~= 'number') and ns.defaultconfig.Pulse or type(cv) == 'number' and cv)
  Pulse.intensity = int and (type(int) == 'number' and int > 0 and int) or ns.defaultconfig.PulseIntensity
  Pulse.TTL = (1000/fps)/1000

  if Pulse.duration and not(Pulse.framesCreated) then
    local ehf = EventHorizon.frames.frames
    --  for k,v in pairs(ns.frames.frames) do print(k,v) end
    for k,bar in pairs(ns.frames.frames) do  -- Use frametable since we want actual bar refs. Don't use ipairs here (will need to fix in other places, likely), as it won't fully iterate.
    --  local bar = ehf[i]
      if bar and bar.cooldown then
        local temp = {
          spellframe = bar,
          ['SPELL_UPDATE_COOLDOWN'] = true,
        }
        table.insert(Pulse.frames,temp)
      elseif bar and (bar.slotID or bar.internalcooldown) then  -- Check for slotID first, since it doesn't always use internalcooldown
        local temp = {
          spellframe = bar,
          ['UNIT_AURA'] = true,
        }
        table.insert(Pulse.frames,temp)
      end
    end
    Pulse.framesCreated = true
  end

  Pulse.frame:SetScript('OnEvent',Pulse.OnEvent)
  Pulse.frame:RegisterEvent('UNIT_AURA')
  Pulse.frame:RegisterEvent('SPELL_UPDATE_COOLDOWN')
end

Pulse.Disable = function ()
  Pulse.duration = nil
end

Pulse.OnFlash = function (self,elapsed)
  self.TSLU = self.TSLU + elapsed
  while self.TSLU >= Pulse.TTL do
    self.current = self.current and (self.current - self.TSLU) or Pulse.duration
    self.alpha = self.current >= 0 and self.current/(Pulse.duration*Pulse.intensity) or 0
    self.tex:SetAlpha(self.alpha)
    self.TSLU = self.TSLU - Pulse.TTL
    if self.current <= 0 then
      self:SetScript('OnUpdate',nil)
      self.current = nil
      self.alpha = nil
      print('clearing onupdates')
    end
  end
end

Pulse.OnAura = function (self,elapsed)
  self.remaining = self.remaining - elapsed

  if self.current and self.alpha then    -- finish off any remaining pulse
    self.TSLU = self.TSLU + elapsed
    while self.TSLU >= Pulse.TTL do
      self.current = self.current and (self.current - self.TSLU) or Pulse.duration
      self.alpha = self.current >= 0 and self.current/(Pulse.duration*Pulse.intensity) or 0
      self.tex:SetAlpha(self.alpha)
      self.TSLU = self.TSLU - Pulse.TTL
      if self.current <= 0 then
        self.current = nil
        self.alpha = nil
      end
    end
  end

  if self.remaining <= 0 and Pulse.duration then
    self.activeCD = nil
    self.remaining = nil
    self.TSLU = 0
    self:SetAllPoints(self.parent)
    self.tex:SetAllPoints(self)
    print('setting Pulse.OnFlash')
    self:SetScript('OnUpdate',Pulse.OnFlash)
  elseif self.remaining <= 0 then
    self.activeCD = nil
    self.remaining = nil
    self:SetScript('OnUpdate',nil)
  end
end

Pulse.OnEvent = function (self,event,unit)
  if event == 'UNIT_AURA' and unit ~= 'player' then return end
  for i = 1,#Pulse.frames do
    local frame = Pulse.frames[i]
    local f = Pulse.frames[i].spellframe
    if f then
      local icd = f.internalcooldown
      local cdTime
      local apply
      local now = GetTime()

      if icd and icd == true then
        icd = nil
      end

      if icd and event == 'UNIT_AURA' then
        local _,_,_,_,_,_,expirationTime,active = f.AuraFunction('player',f.auraname)
        local activeCD = frame.activeCD
        if active and expirationTime and (frame.flash and not(frame.flash.activeCD) or not(frame.flash)) then
          apply = true
          frame.activeCD = true
          cdTime = f.internalcooldown
          local start = expirationTime
          local stop = now + f.internalcooldown
          if start > stop then
            start = now
          end
          f:AddSegment('cooldown', 'cooldown', start, stop)
        end
      elseif event == 'SPELL_UPDATE_COOLDOWN' and not(icd) then
        local start, duration, enabled = f.CooldownFunction(f.cooldownID or f.spellname)
        local onCooldown = enabled == 1 and start ~= duration and start > 0 and duration > 1.5  -- Check duration against GCD to ensure we're not pulsing every time the char does something
        cdTime = duration

        if onCooldown and not(frame.activeCD) then
          apply = true
          print(onCooldown,frame.activeCD,start,duration,enabled)
        elseif (frame.flash and frame.flash.remaining) and not(onCooldown) then  -- cooldown expired before pulse went off
          frame.flash.remaining = 0  -- flash at next opportunity
          --print'flash'
        elseif (frame.flash and frame.flash.remaining) and (frame.flash.remaining > (start+duration-now+1)) then -- HOPEFULLY this will catch elemental shaman 2t10.
          frame.flash.remaining = start+duration-now
        end
        frame.activeCD = onCooldown
      end

      if apply and cdTime and Pulse.duration then  -- check for fresh application, make sure a cooldown time exists, and don't do anything if pulses are disabled
        if not(frame.flash) then
          frame.flash = CreateFrame('Frame',nil,f)
          frame.flash.tex = frame.flash:CreateTexture(nil,'BACKGROUND')
          frame.flash.tex:SetTexture(vars.texturedbars and vars.bartexture or unpack{1,1,1,1})
          frame.flash.tex:SetAlpha(0)
          frame.flash.TSLU = 0
        end
        frame.flash.parent = f
        frame.flash.TSLU = (frame.flash.current and frame.flash.alpha) and frame.flash.TSLU or 0
        frame.flash.remaining = cdTime
        frame.flash.activeCD = true
        frame.flash:SetScript('OnUpdate',Pulse.OnAura)
      end
    end
  end
end

Pulse.Init = function ()
  if Pulse.frame then return end
  Pulse:Enable()
  Pulse.isReady = true
end
]]--
ns:RegisterModule('lines',Lines)
ns:RegisterModule('redshift',Redshift)
--ns:RegisterModule('pulse',Pulse)





-- SpellID Debug (Shows up in the tooltip) --
if spellIDsEnabled then
  print("Showing SpellIDs in Tooltips")
  local hooksecurefunc, select, UnitBuff, UnitDebuff, UnitAura, UnitGUID, GetGlyphSocketInfo, tonumber, strfind = hooksecurefunc, select, UnitBuff, UnitDebuff, UnitAura, UnitGUID, GetGlyphSocketInfo, tonumber, strfind

  local types = {
    spell = "SpellID:",
    item  = "ItemID:",
    unit = "NPC ID:",
    quest = "QuestID:",
    talent = "TalentID:",
    achievement = "AchievementID:",
    criteria = "CriteriaID:",
    ability = "AbilityID:",
    currency = "CurrencyID:",
    artifactpower = "ArtifactPowerID:",
    enchant = "EnchantID:",
    bonus = "BonusID:",
    gem = "GemID:"
  }

  local function addLine(tooltip, id, type)
    local found = false

    -- Check if we already added to this tooltip. Happens on the talent frame
    for i = 1,15 do
      local frame = _G[tooltip:GetName() .. "TextLeft" .. i]
      local text
      if frame then text = frame:GetText() end
      if text and text == type then found = true break end
    end

    if not found then
      tooltip:AddDoubleLine(type, "|cffffffff" .. id)
      tooltip:Show()
    end
  end

  -- All types, primarily for detached tooltips
  local function onSetHyperlink(self, link)
    local type, id = string.match(link,"^(%a+):(%d+)")
    if not type or not id then return end
    if type == "spell" or type == "enchant" or type == "trade" then
      addLine(self, id, types.spell)
    elseif type == "talent" then
      addLine(self, id, types.talent)
    elseif type == "quest" then
      addLine(self, id, types.quest)
    elseif type == "achievement" then
      addLine(self, id, types.achievement)
    elseif type == "item" then
      addLine(self, id, types.item)
    elseif type == "currency" then
      addLine(self, id, types.currency)
    end
  end

  hooksecurefunc(ItemRefTooltip, "SetHyperlink", onSetHyperlink)
  hooksecurefunc(GameTooltip, "SetHyperlink", onSetHyperlink)

  -- Spells
  hooksecurefunc(GameTooltip, "SetUnitBuff", function(self, ...)
    local id = select(11, UnitBuff(...))
    if id then addLine(self, id, types.spell) end
  end)

  hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
    local id = select(11, UnitDebuff(...))
    if id then addLine(self, id, types.spell) end
  end)

  hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
    local id = select(10, UnitAura(...))
    if id then addLine(self, id, types.spell) end
  end)

  hooksecurefunc("SetItemRef", function(link, ...)
    local id = tonumber(link:match("spell:(%d+)"))
    if id then addLine(ItemRefTooltip, id, types.spell) end
  end)

  GameTooltip:HookScript("OnTooltipSetSpell", function(self)

    local id = select(2, self:GetSpell())
    if id then addLine(self, id, types.spell) end
  end)


  -- NPCs
  GameTooltip:HookScript("OnTooltipSetUnit", function(self)
    if C_PetBattles.IsInBattle() then return end
    local unit = select(2, self:GetUnit())
    if unit then
      local guid = UnitGUID(unit) or ""
      local id = tonumber(guid:match("-(%d+)-%x+$"), 10)
      if id and guid:match("%a+") ~= "Player" then addLine(GameTooltip, id, types.unit) end
    end
  end)

  -- Items
  local function attachItemTooltip(self)
    local link = select(2, self:GetItem())
    if not link then return end

    local itemString = string.match(link, "item:([%-?%d:]+)")
    if not itemString then return end

    local enchantid = ""
    local bonusid = ""
    local gemid = ""
    local bonuses = {}
    local itemSplit = {}

    for v in string.gmatch(itemString, "(%d*:?)") do
      if v == ":" then
        itemSplit[#itemSplit + 1] = 0
      else
        itemSplit[#itemSplit + 1] = string.gsub(v, ':', '')
      end
    end

    for index = 1, tonumber(itemSplit[13]) do
      bonuses[#bonuses + 1] = itemSplit[13 + index]
    end

    local gems = {}
    for i=1, 4 do
      local _,gemLink = GetItemGem(link, i)
      if gemLink then
        local gemDetail = string.match(gemLink, "item[%-?%d:]+")
        gems[#gems + 1] = string.match(gemDetail, "item:(%d+):")
      elseif flags == 256 then
        gems[#gems + 1] = "0"
      end
    end

    local id = string.match(link, "item:(%d*)")
    if (id == "" or id == "0") and TradeSkillFrame ~= nil and TradeSkillFrame:IsVisible() and GetMouseFocus().reagentIndex then
      local selectedRecipe = TradeSkillFrame.RecipeList:GetSelectedRecipeID()
      for i = 1, 8 do
        if GetMouseFocus().reagentIndex == i then
          id = C_TradeSkillUI.GetRecipeReagentItemLink(selectedRecipe, i):match("item:(%d*)") or nil
          break
        end
      end
    end

    if id and id ~= "" then
      addLine(self, id, types.item)
      if itemSplit[2] ~=0 then
        enchantid = itemSplit[2]
        addLine(self, enchantid, types.enchant)
      end
      if #bonuses > 0 then
        bonusid = table.concat(bonuses, '/')
        addLine(self, bonusid, types.bonus)
      end
      if #gems > 0 then
        gemid = table.concat(gems, '/')
        addLine(self, gemid, types.gem)
      end
    end
  end

  GameTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
  ItemRefTooltip:HookScript("OnTooltipSetItem", attachItemTooltip)
  ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
  ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)
  ShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip)
  ShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip)

  -- Achievement Frame Tooltips
  local f = CreateFrame("frame")
  f:RegisterEvent("ADDON_LOADED")
  f:SetScript("OnEvent", function(_, _, what)
    if what == "Blizzard_AchievementUI" then
      for i,button in ipairs(AchievementFrameAchievementsContainer.buttons) do
        button:HookScript("OnEnter", function()
          GameTooltip:SetOwner(button, "ANCHOR_NONE")
          GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0)
          addLine(GameTooltip, button.id, types.achievement)
          GameTooltip:Show()
        end)
        button:HookScript("OnLeave", function()
          GameTooltip:Hide()
        end)

        local hooked = {}
        hooksecurefunc("AchievementButton_GetCriteria", function(index, renderOffScreen)
          local frame = _G["AchievementFrameCriteria" .. (renderOffScreen and "OffScreen" or "") .. index]
          if frame and not hooked[frame] then
            frame:HookScript("OnEnter", function(self)
              local button = self:GetParent() and self:GetParent():GetParent()
              if not button or not button.id then return end
              local criteriaid = select(10, GetAchievementCriteriaInfo(button.id, index))
              if criteriaid then
                GameTooltip:SetOwner(button:GetParent(), "ANCHOR_NONE")
                GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0)
                addLine(GameTooltip, button.id, types.achievement)
                addLine(GameTooltip, criteriaid, types.criteria)
                GameTooltip:Show()
              end
            end)
            frame:HookScript("OnLeave", function()
              GameTooltip:Hide()
            end)
            hooked[frame] = true
          end
        end)
      end
    end
  end)

  -- Pet battle buttons
  hooksecurefunc("PetBattleAbilityButton_OnEnter", function(self)
    local petIndex = C_PetBattles.GetActivePet(LE_BATTLE_PET_ALLY)
    if ( self:GetEffectiveAlpha() > 0 ) then
      local id = select(1, C_PetBattles.GetAbilityInfo(LE_BATTLE_PET_ALLY, petIndex, self:GetID()))
      if id then
        local oldText = PetBattlePrimaryAbilityTooltip.Description:GetText(id)
        PetBattlePrimaryAbilityTooltip.Description:SetText(oldText .. "\r\r" .. types.ability .. "|cffffffff " .. id .. "|r")
      end
    end
  end)

  -- Pet battle auras
  hooksecurefunc("PetBattleAura_OnEnter", function(self)
    local parent = self:GetParent()
    local id = select(1, C_PetBattles.GetAuraInfo(parent.petOwner, parent.petIndex, self.auraIndex))
    if id then
      local oldText = PetBattlePrimaryAbilityTooltip.Description:GetText(id)
      PetBattlePrimaryAbilityTooltip.Description:SetText(oldText .. "\r\r" .. types.ability .. "|cffffffff " .. id .. "|r")
    end
  end)

  -- Currencies
  hooksecurefunc(GameTooltip, "SetCurrencyToken", function(self, index)
    local id = tonumber(string.match(GetCurrencyListLink(index),"currency:(%d+)"))
    if id then addLine(self, id, types.currency) end
  end)

  hooksecurefunc(GameTooltip, "SetCurrencyByID", function(self, id)
    if id then addLine(self, id, types.currency) end
  end)

  hooksecurefunc(GameTooltip, "SetCurrencyTokenByID", function(self, id)
    if id then addLine(self, id, types.currency) end
  end)


  hooksecurefunc("TaskPOI_OnEnter", function(self)
    if self and self.questID then addLine(WorldMapTooltip, self.questID, types.quest) end
  end)


end
--END TEMP--
