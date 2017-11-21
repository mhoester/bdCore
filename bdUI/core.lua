local update = 0
local numkids = 0
local bubbles = {}
local bubbleskin = CreateFrame("frame", nil, UIParent)

--local rawtextbox = CreateFrame("EditBox",nil,UIParent)
-- --rawtextbox:SetAutoFocus(false)
-- local function rawText(text)
	-- -- starting from the beginning, replace item and spell links with just their names
	-- text = gsub(text, "|r|h:(.+)|cff(.+)|H(.+)|h%[(.+)%]|h|r", "|r|h:%1%4");
	-- text = strtrim(text)
	-- --text = gsub(text, "\124", "\124\124"); -- if we ever need to see the raw itemlinks
	-- return text
-- end

-- local function skinbubble(frame)
	-- for i=1, frame:GetNumRegions() do
		-- local region = select(i, frame:GetRegions())
		-- if region:GetObjectType() == "Texture" then
			-- region:SetTexture(nil)
		-- elseif region:GetObjectType() == "FontString" then
			-- frame.text = region
		-- end
	-- end
	-- local scale = UIParent:GetEffectiveScale()*2
	
	-- frame.text:SetFont(bdCore.media.font, 13, "OUTLINE")
	
	-- frame:SetScript("OnUpdate",function()
		-- for k, v in pairs(bdCore.chatstrings) do
			-- --local hay = v:gsub('%W','')
			-- local hay = rawText(v)
			-- local needle = rawText(frame.text:GetText())
			
			-- --print(hay)
			-- --print(needle)
			
			-- local s, e = string.find(hay, needle)

			-- if (s ~= nil) then
				-- local size = string.len(hay) - string.len(needle)
				-- frame.text:SetText(v)
				-- frame.text:SetWidth(frame.text:GetWidth() + (size*.85))
				-- bdCore.chatstrings[k] = nil
			-- end
		-- end
	-- end)
	
	-- --[[frame:SetBackdrop({
		-- bgFile = bdCore.media.flat,
		-- edgeFile = bdCore.media.flat,
		-- edgeSize = scale,
		-- insets = {left = scale, right = scale, top = scale, bottom = scale}
	-- })
	-- frame:SetBackdropColor(0,0,0, .8)--]]
	
	-- tinsert(bubbles, frame)
-- end

-- local function ischatbubble(frame)
	-- if frame:GetName() then return end
	-- if not frame:GetRegions() then return end
	-- return frame:GetRegions():GetTexture() == [[Interface\Tooltips\ChatBubble-Background]]
-- end

-- bubbleskin:SetScript("OnUpdate", function(bubbleskin, elapsed)
	-- update = update + elapsed
	-- if update > .05 then
		-- update = 0
		-- local newnumkids = WorldFrame:GetNumChildren()
		-- if newnumkids ~= numkids then
			-- for i=numkids + 1, newnumkids do
				-- local frame = select(i, WorldFrame:GetChildren())

				-- if ischatbubble(frame) then
					-- skinbubble(frame)
				-- end
			-- end
			-- numkids = newnumkids
		-- end
		-- --[[for i, frame in next, bubbles do
			-- local r, g, b = frame.text:GetTextColor()
			-- if ((r+b+g) > 2.9) then
				-- frame:SetBackdropBorderColor(0,0,0,1)
			-- else
				-- frame:SetBackdropBorderColor(r, g, b, .8)
			-- end
		-- end--]]
	-- end
-- end)
--ObjectiveTrackerFrame:ClearAllPoints()
--ObjectiveTrackerFrame:SetHeight(600)
ObjectiveTrackerFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20,-100)
hooksecurefunc(ObjectiveTrackerFrame, "SetPoint",function(self) 
	if (not self.ignore) then
		self.ignore = true
		ObjectiveTrackerFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20,-100)
		self.ignore = false
	end
end)
--[[
ObjectiveTrackerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
ObjectiveTrackerFrame:HookScript("OnEvent",function(self,event) 
	if (event == "PLAYER_ENTERING_WORLD") then
		ObjectiveTrackerFrame:ClearAllPoints()
		ObjectiveTrackerFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20,-100)
		--ObjectiveTrackerFrame.SetPoint = function() return end
	end
end)--]]
