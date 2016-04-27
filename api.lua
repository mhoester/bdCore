local name, engine = ...
local bdCore, c, f = select(2, ...):unpack()
bdCore.oUF = engine.oUF or oUF

local waiting = CreateFrame("frame",nil,bdCore)
waiting.frames = {}
waiting:RegisterEvent("PLAYER_LEAVE_COMBAT")
waiting:SetScript("OnEvent", function() 
	for key, pack in pairs(waiting.frames) do
		local func, params = unpack(pack)
		func(params)
		waiting.frames[key] = nil
	end
end)

local function Size(frame, ...)
	frame:SetSize(...)
end

local function Width(frame, ...)
	frame:SetWidth(...)
end

local function Height(frame, ...)
	frame:SetHeight(...)
end

local function Kill(object)
	if object.UnregisterAllEvents then
		object:UnregisterAllEvents()
	end
	object.Show = function() return end
	object:Hide()
end

local function FrameStrata(frame, arg1)
	frame:SetFrameStrata(arg1)
end

local function FrameLevel(frame, arg1)
	frame:SetFrameLevel(arg1)
end

local function ClearPoints(frame)
	frame:ClearAllPoints()
end

local function Point(frame, ...)
	frame:SetPoint(...)
end

local function AllPoints(frame, ...)
	frame:ClearAllPoints()
	frame:SetAllPoints(...)
end

local function StripTextures(Object, Kill, Text)
	for i=1, Object:GetNumRegions() do
		local Region = select(i, Object:GetRegions())
		if Region:GetObjectType() == "Texture" then
			if Kill then
				Region:Kill()
			else
				Region:SetTexture(nil)
			end
		end
	end		
end

local function SkinButton(Frame, Strip)
	if Frame:GetName() then
		local Left = _G[Frame:GetName().."Left"]
		local Middle = _G[Frame:GetName().."Middle"]
		local Right = _G[Frame:GetName().."Right"]


		if Left then Left:SetAlpha(0) end
		if Middle then Middle:SetAlpha(0) end
		if Right then Right:SetAlpha(0) end
	end

	if Frame.Left then Frame.Left:SetAlpha(0) end
	if Frame.Right then Frame.Right:SetAlpha(0) end	
	if Frame.Middle then Frame.Middle:SetAlpha(0) end
	if Frame.SetNormalTexture then Frame:SetNormalTexture("") end	
	if Frame.SetHighlightTexture then Frame:SetHighlightTexture("") end
	if Frame.SetPushedTexture then Frame:SetPushedTexture("") end	
	if Frame.SetDisabledTexture then Frame:SetDisabledTexture("") end
	
	if Strip then StripTextures(Frame) end
	
	--Frame:SetTemplate()
	
	Frame:HookScript("OnEnter", function(self)
		local Color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
		
		self:SetBackdropColor(Color.r * .15, Color.g * .15, Color.b * .15)
		self:SetBackdropBorderColor(Color.r, Color.g, Color.b)	
	end)
	
	Frame:HookScript("OnLeave", function(self)
		local Color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
		
		self:SetBackdropColor(unpack(bdCore.media.backdrop))
		self:SetBackdropBorderColor(unpack(bdCore.media.border))	
	end)
end

---------------------------------------------------
-- Full credits to TukUI - merge functions into wow api
---------------------------------------------------
local function AddAPI(object)
	local mt = getmetatable(object).__index
	
	if not object.Size then mt.Size = Size end
	if not object.Width then mt.Width = Width end
	if not object.Height then mt.Height = Height end
	if not object.Kill then mt.Kill = Kill end
	if not object.FrameStrata then mt.FrameStrata = FrameStrata end
	if not object.FrameLevel then mt.FrameLevel = FrameLevel end
	if not object.StripTextures then mt.StripTextures = StripTextures end
	if not object.StyleButton then mt.StyleButton = StyleButton end
	if not object.Point then mt.Point = Point end
	if not object.AllPoints then mt.AllPoints = AllPoints end
	if not object.ClearPoints then mt.ClearPoints = ClearPoints end
	
	--[[
	if not object.SetOutside then mt.SetOutside = SetOutside end
	if not object.SetInside then mt.SetInside = SetInside end
	if not object.SetTemplate then mt.SetTemplate = SetTemplate end
	if not object.CreateBackdrop then mt.CreateBackdrop = CreateBackdrop end
	if not object.CreateShadow then mt.CreateShadow = CreateShadow end
	
	if not object.FontString then mt.FontString = FontString end
	if not object.HighlightUnit then mt.HighlightUnit = HighlightUnit end
	if not object.HideInsets then mt.HideInsets = HideInsets end
	if not object.SkinEditBox then mt.SkinEditBox = SkinEditBox end
	if not object.SkinButton then mt.SkinButton = SkinButton end
	if not object.SkinCloseButton then mt.SkinCloseButton = SkinCloseButton end
	if not object.SkinArrowButton then mt.SkinArrowButton = SkinArrowButton end
	if not object.SkinDropDown then mt.SkinDropDown = SkinDropDown end
	if not object.SkinCheckBox then mt.SkinCheckBox = SkinCheckBox end
	if not object.SkinTab then mt.SkinTab = SkinTab end
	if not object.SkinScrollBar then mt.SkinScrollBar = SkinScrollBar end--]]
end

local Handled = {["Frame"] = true}

local Object = CreateFrame("Frame")
AddAPI(Object)
AddAPI(Object:CreateTexture())
AddAPI(Object:CreateFontString())

Object = EnumerateFrames()

while Object do
	if not Object:IsForbidden() and not Handled[Object:GetObjectType()] then	
		AddAPI(Object)
		Handled[Object:GetObjectType()] = true
	end

	Object = EnumerateFrames(Object)
end