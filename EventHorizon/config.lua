local EHN,ns = ...

local config = EventHorizon.config
local c = EventHorizon.colors

local _,class = UnitClass('player')	-- These locals make in-line conditions a little easier. See the color section for a few examples.
local DK = class == "DEATHKNIGHT"
local Druid = class == "DRUID"
local Hunter = class == "HUNTER"
local Mage = class == "MAGE"
local Paladin = class == "PALADIN"
local Priest = class == "PRIEST"
local Rogue = class == "ROGUE"
local Shaman = class == "SHAMAN"
local Warlock = class == "WARLOCK"
local Warrior = class == "WARRIOR"

--[[ EDIT BELOW THIS LINE ]]--

config.showTrinketBars = false			-- Show bars for your equipped trinkets? Default = true
config.castLine = true					-- Show a full-frame line at the end of casts/channels? Default = true (show for all casts). Setting this to a number will set the lower limit accordingly. ie, config.castLine = 0.5 will show all casts over 0.5 seconds. Setting this to 0 will show the line for all casts no matter what.
config.gcdStyle = 'line'				-- 'line' = show a thin line for the GCD. 'bar' = show a full-frame shrinking bar for the gcd (looks good at a dark color and low opacity, set within the color table). false = disable GCD handling.

config.enableRedshift = false			-- Enable Redshift's show/hide functions? Default = false
config.Redshift.showCombat = true 		-- Always show EH in combat. Default = true
config.Redshift.showHarm = true			-- Show EH if targeting an attackable unit, in or out of combat. Default = true
config.Redshift.showHelp = false		-- Show EH if targeting a friendly (unattackable) unit, in or out of combat. Default = false
config.Redshift.showBoss = true			-- Always show EH when targeting a boss-level unit, regardless of its attackable state. Default = true
config.Redshift.showFocus = false		-- Always show EH while a focus unit exists, in or out of combat. Default = false
config.Redshift.hideVehicle = true		-- Hide EH if using a vehicle with an actionbar of its own. Does not affect vehicles that do not change the actionbar. If you use Vitals, you may want to set this to false. Default = true
config.Redshift.hideVitals = true		-- Hide EventHorizon_Vitals as well when the main frame is hidden. Default = true

config.Lines = nil						-- This draws extra marker lines on EventHorizon. Examples: config.Lines = 2 (add a line at 2 seconds in the future); config.Lines = {2, 4, 6} (add lines at 2, 4 and 6 seconds). Decimals and math are permitted, of course. Any amount of lines is allowed. Default: Disabled.
config.LinesColor = {1,1,1,0.5}			-- Standard color syntax {R,G,B,A} (see below). No classcolor allowed quite yet. Embed more tables for more colors. {{1,0,0,1},{0,1,0,1},{0,0.5,1}} will do one red line, one green line, and the rest kinda-teal lines. Yeah, it's a bit of an advanced thing.

config.anchor = {"TOPRIGHT", "EventHorizonHandle", "BOTTOMRIGHT"}	-- EventHorizon's position. Format: {'POINT', 'AnchorFrame', 'RELATIVE', Xoffset (optional), Yoffset (optional)}. Set the anchor to something other than EventHorizonHandle to root EH in place and remove the anchor. Default = {"TOPRIGHT", "EventHorizonHandle", "BOTTOMRIGHT"} (anchor the TOPRIGHT of EH to EventHorizonHandle's BOTTOMRIGHT with no offset)
config.width = 375						-- Width of a single bar, not counting its icon. The actual width of the frame is (width+height+[padding*2]).
config.height = 18						-- Height of a single bar. If you use config.staticHeight, this is used for the width of the bar icons.
config.spacing = 0						-- Vertical spacing between bars.
config.scale = 1						-- The overall scale of the main frame.
config.staticheight = 150				-- Changing this to a number will override config.height and tell EH to resize the bars instead of the frame. For example, 'config.staticheight = 150' will make EH 150 pixels tall. With 5 shown bars, each bar will be 30 pixels tall. Spacing is still used in this mode and will act the same as it does otherwise.
config.staticframes = 0					-- When used with config.staticheight, sets a minimum number of bars to use static height settings with. For example, with staticframes = 4 and 3 bars shown, EventHorizon will use normal variable height settings.
config.hideIcons = false				-- Hides the bar icons completely. This will make the frame a little more narrow, as config.height will no longer add to its width.

config.past = -1.5						-- Number of seconds to show in the past. Default = -3 (yes, it's a negative number)
config.future = 12						-- Number of seconds to show in the future. Recommended to keep this between 12-18 unless you've got some crazy configuration. Default = 12

config.texturedbars = true				-- You have the choice between textures and solid colors. Remove this or comment it out to see what the solids look like. Default = true
config.bartexture = "Interface\\Addons\\EventHorizon\\Smooth"	-- Full path, minus extension, of the bar texture to use. Default = "Interface\\Addons\\EventHorizon\\Smooth"
config.texturealphamultiplier = 2		-- Most textures appear darker than a solid color because of the alpha value. To counteract this, the opacity of the color is multiplied by this number before it's applied to a texture.
config.barbg = false					-- Shows a backdrop behind each individual bar. The color of the backdrop may be set within the color table below.

config.backdrop = true										-- Use the background and border frame? Default = true
config.padding = 3											-- Extra space between the bar edges and the backdrop/border.
config.bg = "Interface\\ChatFrame\\ChatFrameBackground"		-- Frame background texture. Full path, no extension. Default = "Interface\\ChatFrame\\ChatFrameBackground"
config.border = "Interface\\Tooltips\\UI-Tooltip-Border"	-- Border texture, same thing all over. Default = "Interface\\Tooltips\\UI-Tooltip-Border" 
config.edgesize = 8											-- Thickness of the frame's border. Default = 8
config.inset = {top = 2, bottom = 2, left = 2, right = 2}	-- Backdrop insets move the edges of the background, but leave the border untouched. Long story short, start at 1/4 your edgesize and adjust by 1 until it looks right. Default = {top = 2, bottom = 2, left = 2, right = 2}

config.stackFont = false				-- Changes the font of the stack indicators. Usage: config.stackFont = "Interface\\AddOns\\FontDirectory\\FontName.ttf"
config.stackFontSize = false			-- Changes the font size of the stack indicators. Only usable with config.stackFont. Usage: config.stackFontSize = <number> (start at 12 and adjust from there if you're not sure)
config.stackFontOutline = false			-- Adds an outline to the font. Only usable with config.stackFont. Valid flags: "OUTLINE", "THICKOUTLINE", "MONOCHROME". Usage: config.stackFontSize = "FLAG"
config.stackFontColor = false			-- Changes the color of the stack indicators. This option available even if config.stackFont is not being used. Usage: config.stackFontColor = {Red,Green,Blue,(Alpha)} (default = {1,1,1}, alpha is optional)
config.stackFontShadow = false			-- Adds a shadow effect to the stack indicators. Only usable with config.stackFont. Setting this to true defaults it to black at 50% opacity. Best used without an outline. Usage: config.stackFontShadow = {Red,Green,Blue,(Alpha)} -OR- true ( {0,0,0,0.5} )
config.stackFontShadowOffset = false	-- Changes the offset of the font shadow if config.stackFontShadow is set. Usage: config.stackFontShadowOffset = {x,y} (default = {1,-1})
config.stackOnRight = false				-- Changes the position of the stack indicators from the left of the frame to the right. Default = false. Usage: config.stackOnRight = true

-- The format for the color section is {Red, Green, Blue, Opacity/Alpha}. To color a bar or indicator by class, use {true, <burn>, <alpha>}.
-- <burn> means color intensity - 0.5 burn darkens a color by 50%. 1.2 lightens it by 20%. 1 is baseline.
local c = EventHorizon.colors
c.sent = {true,Priest and 0.7 or 1,0.5}			-- Marker line when a spellcast is sent to the server. Default = {true,Priest and 0.7 or 1,0.5} (class colored, dimmed a bit if you're a Priest, 50% opacity)
c.tick = {true,Priest and 0.7 or 1,1}			-- Tick markers. Default = {true,Priest and 0.7 or 1,1} (class colored, dimmed a bit if you're a Priest, opaque)
c.channeltick = {0,1,0.2,0.25}					-- Tick markers for channeled spells. Default is the same as casting.
c.casting = {0,1,0.2,0.25}							-- Casting bars. Default = {0,1,0,0.25} (green, 0.25 unmodified alpha)
c.castLine = {0,1,0,0.3}						-- The end-of-cast line, shown for casts and channels over 1.5 seconds. Default = {0,1,0,0.3} (green, 0.3 unmodified alpha)
c.cooldown = {0.6,0.8,1,0.3}						-- Cooldown bars. Default = {0.6,0.8,1,0.3} (mute teal, 0.3 unmodified alpha)
c.debuffmine = {true,Priest and 0.7 or 1,0.3}	-- YOUR debuff bars. Default = {true,Priest and 0.7 or 1,0.3} (class colored, dimmed a bit if you're a Priest, 0.3 unmodified alpha)
c.debuff = {true,0.5,0.3}						-- OTHER PLAYERS' debuff bars. Default = {true,0.5,0.3} (class colored, darkened by 50%, 0.3 unmodified alpha)
c.playerbuff = {true,Priest and 0.7 or 1,0.3}	-- Buff bars. Default = {true,Priest and 0.7 or 1,0.3} (class colored, dimmed a bit if you're a Priest, 0.3 unmodified alpha)
c.nowLine = {1,1,1,0.3}							-- The "Now" line.
c.bgcolor = {0,0,0,0.6}							-- Color of the frame's background. Default = {0,0,0,0.6} (black, 60% opacity)
c.bordercolor = {1,1,1,1}						-- Color of the frame's border. Default = {1,1,1,1} (white, fully opaque)
c.gcdColor = {1,1,1,0.5}						-- Color of the GCD indicator. Default = {1,1,1,0.5}
c.barbgcolor = {1,1,1,0.1}						-- Color of bar backgrounds. Default = {1,1,1,0.1} (barely visible)

--[[ This table adjusts blending modes for most portions of EventHorizon. These are not normally usable on Statusbar objects, which EventHorizon is fairly unique about not using.
From wowprogramming.com's descriptions (which are very apt):
	'ADD' - Adds texture color values to the underlying color values, using the alpha channel; light areas in the texture lighten the background while dark areas are more transparent
	'ALPHAKEY' - One-bit transparency; pixels with alpha values greater than ~0.8 are treated as fully opaque and all other pixels are treated as fully transparent
	'BLEND' - Normal color blending, using any alpha channel in the texture image
	'DISABLE' - Ignores any alpha channel, displaying the texture as fully opaque
	'MOD'	- Ignores any alpha channel in the texture and multiplies texture color values by background color values; dark areas in the texture darken the background while light areas are more transparent

Setting blend modes to 'ADD' or 'MOD' can have a very nice effect.
Default (nil/false) is 'BLEND'.
Most entries in the color table support this, as demonstrated below. The backdrop and bar backgrounds are incompatible.
 ]]--
config.blendModes = {
	sent = nil,
	tick = nil,
	channeltick = nil,
	casting = nil,
	castLine = nil,
	cooldown = nil,
	debuffmine = nil,
	debuff = nil,
	playerbuff = nil,
	nowLine = nil,
	gcdColor = nil,
}

-- This little table judges the thickness and positioning of each bar element.
-- It's all done by percentages, from the top of the bar. 0 is the absolute top, 0.35 is 35% down from there, 0.5 is halfway down the bar, etc. 1 is the bottom of the bar. Yes, you can use numbers greater than 1, but it will probably look odd.
EventHorizon.layouts = {		-- You can actually add anything from the table above here, segments just inherit off 'default' if they're not included. Just tinker with the numbers if you want to see how it works.
	tick = {					-- Tick markers.
		top = 0,
		bottom = 0.12,
	},
	channeltick = {
		top = 0,
		bottom = 0.12,
	},
	smalldebuff = {				-- The recast line for spells like Vampiric Touch and Immolate.
		top = 0,
		bottom = 0.25,
	},
	cantcast = {				-- The blank section below the recast line.
		top = 0.25,
		bottom = 1,
	},
	smallCooldown = {
		top = 0.5,
		bottom = 1,
	},
	default = {					-- Just about everything else.
		top = 0,
		bottom = 1,
	},
}
