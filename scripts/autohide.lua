local bdCore, c, f = select(2, ...):unpack()

local autohide = CreateFrame("frame",nil,UIParent)
autohide:RegisterEvent("ENCOUNTER_START")
autohide:RegisterEvent("ENCOUNTER_END")
autohide:RegisterEvent("LOADING_SCREEN_DISABLED")

--ObjectiveTracker_Collapse()

autohide:SetScript("OnEvent",function(self,event,arg1) 
	-- if (event == "ENCOUNTER_START" or event == "LOADING_SCREEN_DISABLED") then
	-- 	if (IsInRaid()) then
	-- 		ObjectiveTrackerFrame:Hide()
	-- 		ObjectiveTrackerFrame:SetAlpha(0)
	-- 	end
	-- elseif (not IsInRaid()) then
	-- 	ObjectiveTrackerFrame:Show()
	-- 	ObjectiveTrackerFrame:SetAlpha(1)
	-- end
end)