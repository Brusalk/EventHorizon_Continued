--[[
LegionArtifacts, LibStub library to cache artifact trait information. Updates is handled by the library and data can safely be accessed after the PLAYER_ENETERING_WORLD event occurs.

** Public functions **
GetArtifacts()                      Returns array of collected artifact itemID, including bags (not those in the bank)
GetPowerPurchased(artifactID)       Returns number of powers purchased for specified ID (or equipped if not specified)
GetPowers(artifactID)               Returns array listing of powers for specified ID (or equipped if not specified)
GetPowerInfo(powerID,artifactID)    Returns cached details of specified poewer for the specified ID (or equipped if not specified)
                                    Return format: spellID, upgradeCost, curRank, maxRank, bonusRank, xpos, ypos, prereqsMet, isStart, isGoldMedal, isFinal

In all cases, return false on errors.

** Usage **
local LA = LibStub:GetLibrary("LegionArtifacts-1.0")

** Example code **
--for all artifacts and artifact powers, print the power ranks.
for i,artifact in pairs(LA:GetArtifacts()) do
   local _,link = GetItemInfo(artifact)
   local numRank = LA:GetPowerPurchased(artifact)
   print(link, 'Powers purchased: ' .. numRank)
   for j,power in pairs(LA:GetPowers(artifact)) do
      local x = LA:GetPowerInfo(power,artifact)
      local id,_,curRank = unpack(x)
      print(GetSpellLink(id),'Rank: ' .. curRank)
   end
end

Credits: Rainrider's macro code as a starting base.
    
--]]

local major = "LegionArtifacts-1.1"
local minor = tonumber(string.match("$Revision: 1000 $", "(%d+)") or 1)

assert(LibStub, string.format("%s requires LibStub.", major))

local LA = LibStub:NewLibrary(major, minor)
if( not LA ) then return end

-- internal artifact cache
local artifact = {}
local count = {}

-- refresh artifact power information
local function RefreshPowers()
   if C_ArtifactUI.GetPowers() then
      local itemID, altID, name,_,_,numPowers = C_ArtifactUI:GetArtifactInfo()
      if not artifact[itemID] then artifact[itemID] = {} end
      count[itemID] = numPowers
      
      for i,p in ipairs(C_ArtifactUI.GetPowers()) do
         local spellID, upgradeCost, curRank, maxRank, bonusRank, xpos, ypos, prereqsMet, isStart, isGoldMedal, isFinal = C_ArtifactUI.GetPowerInfo(p)
         artifact[itemID][spellID] = {spellID, upgradeCost, curRank, maxRank, bonusRank, xpos, ypos, prereqsMet, isStart, isGoldMedal, isFinal}
      end
   else
      --do nothing
   end
end

local function RefreshEquipped()
   if not (ArtifactFrame and ArtifactFrame:IsShown()) then
      UIParent:UnregisterEvent("ARTIFACT_UPDATE")
      SocketInventoryItem(16)
   end

   RefreshPowers()
   
   if not (ArtifactFrame and ArtifactFrame:IsShown()) then
      C_ArtifactUI.Clear();
      UIParent:RegisterEvent("ARTIFACT_UPDATE")
   end
end

local function RefreshBags()
   if not (ArtifactFrame and ArtifactFrame:IsShown()) then
      UIParent:UnregisterEvent("ARTIFACT_UPDATE")
   end

   for bag=0,4,1 do 
      for slot=1,GetContainerNumSlots(bag),1 do 
         local texture, count, locked, quality, readable, lootable, link, isFiltered = GetContainerItemInfo(bag, slot)
         if quality == 6 then
            -- quality 6 = artifacts
            SocketContainerItem(bag,slot)
            RefreshPowers()
            C_ArtifactUI.Clear();
         end
      end
   end
   
   if not (ArtifactFrame and ArtifactFrame:IsShown()) then
      UIParent:RegisterEvent("ARTIFACT_UPDATE")
   end
end

-- public functions
function LA:GetArtifacts()
   local set
   for i,v in pairs(artifact) do
      if not set then set = {} end
      tinsert(set,i)
   end
   
   return set or false
end

function LA:GetPowerPurchased(artifactID)
   local powers
   if not artifactID then
      if HasArtifactEquipped() then
         local itemID = GetInventoryItemID("player", 16)
         powers = count[itemID]
      end
   elseif artifact[artifactID] and count[artifactID] then
      powers = count[artifactID]
   end
   
   return powers or false
end

function LA:GetPowers(artifactID)
   local powers
   if not artifactID then
      if HasArtifactEquipped() then
         local itemID = GetInventoryItemID("player", 16)
         powers = artifact[itemID]
      end
   elseif artifact[artifactID] then
      powers = artifact[artifactID]
   end
   
   local set
   if powers then
      if not set then set = {} end
      for i,v in pairs(powers) do
         tinsert(set,i)
      end
   end
   
   return set or false
end

function LA:GetPowerInfo(powerID,artifactID)
   if not powerID then return false end
   local powerInfo
   
   if not artifactID then
      if HasArtifactEquipped() then
         local itemID = GetInventoryItemID("player", 16)
         if artifact[itemID][powerID] then
            powerInfo = artifact[itemID][powerID]
         end
      end
   elseif artifact[artifactID] then
      if artifact[artifactID][powerID] then
         powerInfo = artifact[artifactID][powerID]
      end
   end
   
   -- return format:
   -- spellID, upgradeCost, curRank, maxRank, bonusRank, xpos, ypos, prereqsMet, isStart, isGoldMedal, isFinal = powerInfo
   return powerInfo or false
end

-- data updates
local f = CreateFrame('frame')
f:SetScript('OnEvent', function(self, event, ...)
   if event == 'PLAYER_ENTERING_WORLD' then
      RefreshEquipped()
      RefreshBags()
      
      -- subsequent updates uses ARTIFACT_UPDATE event
      f:RegisterEvent('ARTIFACT_UPDATE')
      -- no need for this event past the initial cache
      f:UnregisterEvent('PLAYER_ENTERING_WORLD')
   elseif event == 'ARTIFACT_UPDATE' then
      -- event fires when opening artifact window or purchasing a new trait
      RefreshPowers()
   end
end)
f:RegisterEvent('PLAYER_ENTERING_WORLD')