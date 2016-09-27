--[[
This file, introduced in EventHorizon v1.6, makes trinkets incredibly easy to handle.

NOTE: Trinket bars act exactly like any other spell bar. EH doesn't care whether or not the trinket is equipped, and will show a blank bar if you have no trinket equipped, and an inactive bar with the trinket icon if that trinket is not on the list here.

Check config.lua for an option, -- config.showTrinketBars --, which will add trinket bars without needing to screw with the class configs.

If you would like to handle it manually and your trinket is on this list, just add one or both of these to your class config:

-- Top Trinket
self:NewSpell({slotID = 13})

-- Bottom Trinket
self:NewSpell({slotID = 14})

Additional flags that can be used: NOTHING. slotID does NOT play nice with other spell config flags. You can try, but it will just break things. Other than that fact, it's extremely easy to set up an equipment slot. Cooldowns and buffs are tracked as long as EH has the info for them.

Cooldowns:
Visible trinket cooldowns are tracked automatically. No tinkering required.
Internal trinket cooldowns (Equip: procs for the most part) rely on the list below. If your trinket is on the list, you should see the cooldown when it procs. (SHOULD, not WILL - I don't have every trinket on the list, so I can't confirm many of them, but the ones I've tested work perfectly.)

Buffs:
Since trinkets usually don't use buffs of the same name as the trinket itself, EventHorizon is only able to track the trinket buffs listed below. If your trinket is not on the list, bring it to my attention. At the time of the list's initial writing, EPIC ilvl 200+ trinkets with Equip: or Use: BUFFS should be mostly in. Blues haven't been written in. Proc/use effects that aren't buffs are not tracked.



Engineering items can be tracked as well. Gloves are slotID 10, feet are slotID 8. Hyperspeed Accelerators (glove haste buff) and Nitro Boosts (rocket boots) are done for you. Cooldowns are based on the item itself, which is a handy feature of the API that makes things that much more accurate.



Inventory items are a little different, but done in about the same way. You'll need the itemID for these:

-- Saronite Bombs
self:NewSpell({itemID = 41119})

If you need more flags...

-- Saronite Bombs
self:NewSpell({
	itemID = 41119,
	debuff = 12345,
	stance = 9,
})

...etc.

Incompatible flags:
* cooldown - Setting the cooldown flag overrides GetItemCooldown with GetSpellCooldown. Basically, if you add the cooldown flag, you're only getting the item's icon.
* dot - Well, technically it would work, but only if the item has a buff or debuff, and I doubt it would work quite correctly.

Flags that work:
* playerbuff / debuff - These work just fine.
* internalcooldown - Since it works off playerbuff/debuff, setting an ICD may serve as a substitute if you really do want cooldown information for whatever additional spell you're tracking. Not sure if I'd recommend it though.
* auraunit - Affects nothing but playerbuff/debuff, so setting a custom unit to watch is fine.
* cleu/event - Should be fine, though not sure what you'd need it for in this case.
* requiredTalent - Yep, works fine.
* requiredGlyph - Should be fine as well, though talents usually work better (unless you have two mostly identical specs with different glyphs).
* stance/nostance - Should work fine.

Anything not listed, I have no idea. Heck, I haven't even tried most of the ones that ARE listed, I'm just pretty sure they won't horribly break things.



Now, about the big list below.

If your trinket is NOT on the list, as long as it has a Use effect its cooldown WILL still be tracked. Bring the trinket to my attention via the WoWInterface comments page and I'll add its buff for the next release. The initial release of this file contains most ilvl 200+ epic trinkets with Use and Equip effects, with internal cooldowns as applicable.

Some trinkets are exempt from this list due to their complex nature. Death's Choice/Verdict and certain oldschool trinkets are among them.

Some trinkets on the list may not work correctly. If they don't, let me know.

If you have questions, feel free to ask.

]]--


-- ["ItemName or ItemID"] = spellID or {spellID,internalCooldown}
-- If you need multiple spellids and don't need an internal cooldown, use {{spellID1,spellID2,...},true}

EventHorizon.trinkets = {
	['Sharpened Twilight Scale'] = {75458,45},
	["Death's Choice"] = {67708,45},
	["Death's Verdict"] = {67708,45},
	["Deathbringer's Will"] = {{71485,71491,71486,71492,71484},105}, -- That's just evil, Blizz.
	["Corroded Skeleton Key"] = 71586,
	["Corpse Tongue Coin"] = {71639,30},
	["Dislodged Foreign Object"] = {71601,45},
	["Sindragosa's Flawless Fang"] = 71638,
	["Phylactery of the Nameless Lich"] = {71636,100},
	["Muradin's Spyglass"] = 71572,
	["Maghia's Misguided Quill"] = 71579,
	["Herkuml War Token"] = 71396,
	["Purified Lunar Dust"] = {71584,45},
	["Unidentifiable Organ"] = 71577,
	["Whispering Fanged Skull"] = {71541,45},
	["Reign of the Dead"] = {67759,2},
	["Reign of the Unliving"] = {67759,2},
	["Juggernaut's Vitality"] = 67753,
	["Satrina's Impeding Scarab"] = 67753,
	["Binding Stone"] = 67740,
	["Binding Light"] = 67740,
	["Eitrigg's Oath"] = 67742,
	["Ferver of the Frostborn"] = 67742,
	["Fetish of Volatile Power"] = 67744,
	["Talisman of Volatile Power"] = 67744,
	["Mark of Supremacy"] = 67695,
	["Glyph of Indomitability"] = 67694,
	["Talisman of Resurgence"] = 67684,
	["Shard of the Crystal Heart"] = 67683,
	["Vengeance of the Forsaken"] = 67747,
	["Victor's Call"] = 67747,
	["Flare of the Heavens"] = {64713,45},
	["Show of Faith"] = {64739,45},
	["Ephemeral Snowflake"] = 71568,
	["Ick's Rotting Thumb"] = 71569,
	["Needle-Encrusted Scorpion"] = {71403,45},
	["Nevermelting Ice Crystal"] = 71563,
	["Heart of Iron"] = 64763,
	["Blood of the Old God"] = 64792,
	["Dark Matter"] = {65024,45},
	["Living Flame"] = 64712,
	["Mark of Norgannon"] = 60319,
	["Meteorite Crystal"] = 64999,
	["Mjolnir Runestone"] = {65019,45},
	["Pandora's Plea"] = {64741,45},
	["Scale of Fates"] = 64707,
	["Sif's Remembrance"] = {65003,45},
	["The General's Heart"] = {64765,45},
	["Wrathstone"] = 64800,
	["Elemental Focus Stone"] = {65004,45},
	["Energy Siphon"] = 65008,
	["Eye of the Broodmother"] = 65006,
	["Furnace Stone"] = 65011,
	["Pyrite Infuser"] = {65014,45},
	["Royal Seal of King Llane"] = 65012,
	["Defender's Code"] = 60286,
	["Dying Curse"] = 60494,
	["Fury of the Five Flights"] = 60314,
	["Grim Toll"] = {60437,45},
	["Illustration of the Dragon Soul"] = 60486,
	["Rune of Repulsion"] = 60258,
	["Abyssal Rune"] = {67669,45},
	["Ancient Pickled Egg"] = {60062,45},
	["Banner of Victory"] = {67671,45},
	["Brawler's Souvenir"] = 68443,
	["Coren's Chromium Coaster"] = {60065,45},
	["Mirror of Truth"] = {60065,45},
	["Embrace of the Spider"] = {60492,45},
	["Je'Tze's Bell"] = {49623,45},
	["Loatheb's Shadow"] = 60439,
	["Majestic Dragon Figurine"] = 60525,
	["Mithril Pocketwatch"] = {60064,45},
	["Sundial of the Exiled"] = {60064,45},
	["Repelling Charge"] = 60180,
	["Spirit-World Glass"] = 60527,
	["Tears of Bitter Anguish"] = {58904,45},
	["The Black Heart"] = {67631,45},
	["The Egg of Mortal Essence"] = {60062,45},
	["Valor Medal of the First War"] = 60054,
	["Battlemaster's Accuracy"] = 55915,
	["Battlemaster's Avidity"] = 55915,
	["Battlemaster's Bravery"] = 55915,
	["Battlemaster's Conviction"] = 55915,
	["Battlemaster's Fury"] = 55915,
	["Battlemaster's Hostility"] = 55915,
	["Battlemaster's Precision"] = 55915,
	["Battlemaster's Rage"] = 55915,
	["Battlemaster's Ruination"] = 55915,
	["Battlemaster's Vivacity"] = 55915,
	["Battlemaster's Aggression"] = 44055,
	["Battlemaster's Alacrity"] = 44055,
	["Battlemaster's Audacity"] = 44055,
	["Battlemaster's Celerity"] = 44055,
	["Battlemaster's Courage"] = 44055,
	["Battlemaster's Cruelty"] = 44055,
	["Battlemaster's Depravity"] = 44055,
	["Battlemaster's Determination"] = 44055,
	["Battlemaster's Perseverance"] = 44055,
	["Battlemaster's Resolve"] = 44055,
	["Solace of the Fallen"] = 67696,
	["Solace of the Defeated"] = 67696,
	["Platinum Disks of Battle"] = 64524,
	["Platinum Disks of Sorcery"] = 64525,
	["Platinum Disks of Swiftness"] = 64527,
	["Darkmoon Card: Greatness"] = {60234,45},
	["Darkmoon Card: Berserker!"] = 60196,
	["Darkmoon Card: Illusion"] = 57350,
	["Frenzyheart Insignia of Fury"] = 59821,
	["Flow of Knowledge"] = {60064,45},
	["Essence of Gossamer"] = {60218,45},
	["Forge Ember"] = {60479,45},
	["Incisor Fragment"] = 60299,
	["Jouster's Fury"] = {63250,45},
	["Lavanthor's Talisman"] = 60215,
	["Mark of the War Prisoner"] = 60480,
	["Meteorite Whetstone"] = 60302,
	["Offering of Sacrifice"] = 60180,
	["Spark of Life"] = {60520,45},
	["Sphere of Red Dragon's Blood"] = 60305,
	["Winged Talisman"] = 60521,
	["Seal of the Pantheon"] = 60214,
	["Soul Preserver"] = 60513, -- Is a proc, confirmed no ICD
	["Tome of Arcane Phenomena"] = 60471,
	["Cannoneer's Fuselighter"] = 59657,
	["Cannoneer's Morale"] = 59657,
	["Fezzik's Pocketwatch"] = 59658,
	["Chuchu's Tiny Box of Horrors"] = 61618,
	["Crusader's Locket"] = {61671,45},
	["Futuresight Rune"] = 61426,
	["Rune of Finite Variation"] = 61427,
	["Rune of Infinite Power"] = 61428,
	["Softly Glowing Orb"] = 61617,
	["Thorny Rose Brooch"] = 61620,
	["Noise Machine"] = {55019,60},
	["Sonic Booster"] = {55018,60},
	["Badge of the Infiltrator"] = 62088,
	["Spiritist's Focus"] = 48875,
	["Insignia of Bloody Fire"] = 48875,
	["Mendicant's Charm"] = 48875,
	["Talon of Hatred"] = 61778,
	["Memento of Tyrande"] = {37655,45},
	["The Skull of Gul'dan"] = 40396,
	["Automated Weapon Coater"] = 51978,
	["Foresight's Anticipation"] = 51985,
	["Scarab of Isanoth"] = 51987,
	["Valonforth's Remembrance"] = {54838,45},
	["Will of the Red Dragonflight"] = 33662,
	["First Mate's Pocketwatch"] = 50263,
	["Fury of the Encroaching Storm"] = 47806,
	["Horn of the Herald"] = 47816,
	["Mender of the Oncoming Dawn"] = 47807,
	["Sailor's Knotted Charm"] = 50261,
	["Strike of the Seas"] = 47816,
	["Braxley's Backyard Moonshine"] = 47217,
	["Death Knight's Anguish"] = {54696,45}, -- Tracks only the 20 second buff.
	["Fury of the Crimson Drake"] = 48868,
	["Harbinger's Wrath"] = 48846,
	["Infused Coldstone Rune"] = 47215,
	["Serrah's Star"] = {54739,45},
	["Talisman of the Tundra"] = 48847,
	["Tidal Boon"] = 48855,
	["Vial of Renewal"] = 48865,
	["Warsong's Fervor"] = 48848,
	["Warsong's Wrath"] = 48846,
	["Ancient Aqir Artifact"] = 43713,
	["Berserker's Call"] = 43716,
	["Hex Shrunken Head"] = 43712,
	["Tome of Diabolic Remedy"] = 43710,
	["Earring of Soulful Meditation"] = 40402,
	["Scarab of Displacement"] = 38351,
	["Sextant of Unstable Currents"] = 38348,
	["Spyglass of the Hidden Fleet"] = 38325,
	["Tome of Fiery Redemption"] = 37198,
	["Tsunami Talisman"] = {42084,45},
	["Warp-Spring Coil"] = {37174,45},
	["Dragonspine Trophy"] = {34775,45},
	["Eye of Gruul"] = 37723, -- This was a bitch. Also, confirmed no ICD.
	["Eye of Magtheridon"] = 34747,
	["Figurine - Crimson Serpent"] = 46783,
	["Figurine - Empyrean Tortoise"] = 46780,
	["Figurine - Seaspray Albatross"] = 46785,
	["Figurine - Shadowsong Panther"] = 46784,
	["Commendation of Kael'thas"] = {45058,30},
	["Moroes' Lucky Pocket Watch"] = 34519,
	["Pendant of the Violet Eye"] = 29601,
	["Ribbon of Sacrifice"] = 38332,
	["Shard of Contempt"] = 45053,
	["Abacus of Violent Odds"] = 33807,
	["Arcanist's Stone"] = 34000,
	["Argussian Compass"] = 39228,
	["Badge of Tenacity"] = 40729,
	["Bangle of Endless Blessings"] = 34210, -- Only track the clicky effect - if there were ever two needed bars on a trinket, this would be the one...
	["Brooch of the Immortal King"] = 40538,
	["Crystalforged Trinket"] = 40724,
	["Figurine - Dawnstone Crab"] = 31039,
	["Figurine - Living Ruby Serpent"] = 31040,
	["Figurine - Nightseye Panther"] = 31047,
	["Figurine - Talasite Owl"] = 31045,
	["Figurine of the Colossus"] = 33089,
	["Icon of Unyielding Courage"] = 34106,
	["Lower City Prayerbook"] = 37877,
	["Quagmirran's Eye"] = {33297,45},
	["Scarab of the Infinite Cycle"] = {60061,45},
	["Scryer's Bloodgem"] = 35337,
	["Shiffar's Nexus-Horn"] = 34320,
	["Warp-Scarab Brooch"] = 33400,
	["Xi'ri's Gift"] = 35337,
	["Starkiller's Bauble"] = 36432,
	["Adamantine Figurine"] = 33479,
	["Hourglass of the Unraveller"] = {60066,45},
	["Heavenly Inspiration"] = 36347,
	["Bloodlust Brooch"] = 35166,
	["Coren's Lucky Coin"] = 51952,
	["Dark Iron Smoking Pipe"] = 51953,
	["Direbrew Hops"] = 51954,
	["Empty Mug of Direbrew"] = 51955,
	["Essence of the Martyr"] = 35165,
	["Gnomeregan Auto-Blocker 600"] = 35169,
	["Icon of the Silver Crescent"] = 35163,
	["Dabiri's Enigma"] = 36372,
	["Skyguard Silver Cross"] = {41261,10},
	["Airman's Ribbon of Gallantry"] = {41263,10},
	["Core of Ar'kelos"] = 35733,
	["Oshu'gun Relic"] = 32367,
	["Ancient Draenei Arcane Relic"] = 33662,
	["Ancient Draenei War Talisman"] = 33667,
	["Ogre Mauler's Badge"] = 32362,
	["Uniting Charm"] = 32362,
	["Terokkar Tablet of Precision"] = 39200, -- Note: If you're alliance and get heroism with this one equipped... then I don't know what will happen.
	["Terokkar Tablet of Vim"] = 39201,
	["Ancient Crystal Talisman"] = 32355,
	["Glowing Crystal Insignia"] = 32355,
	["Charm of Alacrity"] = 32600,
	["Runed Fungalcap"] = 31771,
	["Eye of the Dead"] = 28780,
	["Glyph of Deflection"] = 28773,
	["Slayer's Crest"] = 28777,
	["The Restrained Essence of Sapphiron"] = 28779,
	["Auslese's Light Channeler"] = 31794,
	["Bladefist's Breadth"] = 33667,
	["Regal Protectorate"] = 33668,
	["Vengeance of the Illidari"] = 33662,
	["Eye of Diminution"] = 28862,
	["Kiss of the Spider"] = 28866,
	["Loatheb's Reflection"] = 28778,
	["Jom Gabbar"] = 29602,
	["The Burrower's Shell"] = 29506,
	["Scarab Brooch"] = 26467,
	["Aegis of Preservation"] = 23780,
	["Fetish of the Sand Reaver"] = 26400,
	["Badge of the Swarmguard"] = 26480,
	["Lifegiving Gem"] = 23725,
	["Mind Quickening Gem"] = 23723,
	["Natural Alignment Crystal"] = 23734,
	["Petrified Scarab"] = 26463,
	["Rune of Metamorphosis"] = 23724,
	["Scrolls of Blinding Light"] = 23733,
	["Venomous Totem"] = 23726,
	["Eye of Moam"] = 26166,
	["Fetish of Chitinous Spikes"] = 26168,
	["Hibernation Crystal"] = 24998,
	["Signet of the Dark Brotherhood"] = 52423, -- If you somehow have this on your warrior... I not only envy you, but hitting Retaliation will prolly produce interesting results.
	["Soul Harvester's Charm"] = {52419,30},
	["Mar'li's Eye"] = 24268,
	["Nat Pagle's Broken Reel"] = 24610,
	["Darkmoon Card: Blue Dragon"] = 23684,
	["Earthstrike"] = 25891,
	["Talisman of Ephemeral Power"] = 23271,
	["Defiler's Talisman"] = 23991,
	["Talisman of Ascendance"] = 28200,
	["Prismcharm"] = 19638,
	["Second Wind"] = 15604,
	["Burst of Knowledge"] = 15646,
	["Devilsaur Eye"] = 24352,
	["Blessed Prayer Beads"] = 24354,
	["Sanctified Orb"] = 24865,
	["Figurine - Ruby Serpent"] = 26599,
	["Guardian Talisman"] = 4070,
	-- fingers hurt... stopping...
}

EventHorizon.trinkets.blacklist = {
	["Spark of Hope"] = true,
	["Argent Dawn Commission"] = true,
	["Seal of the Dawn"] = true,
	["Rune of the Dawn"] = true,
	["Mark of the Champion"] = true,
}