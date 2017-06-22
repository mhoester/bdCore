local bdCore, c, f = select(2, ...):unpack()
local interrupt = CreateFrame('frame')
local channel = 'SAY'


local gmotd = CreateFrame("frame", nil, UIParent)
gmotd:SetSize(350, 150)
gmotd:Hide()
gmotd:SetPoint("TOP", UIParent, "TOP", 0, -140)
bdCore:setBackdrop(gmotd)
gmotd.header = gmotd:CreateFontString(nil)
gmotd.header:SetFont(bdCore.media.font, 14)
gmotd.header:SetPoint("BOTTOM", gmotd, "TOP", 0, 4)

gmotd.text = gmotd:CreateFontString(nil)
gmotd.text:SetHeight(130)
gmotd.text:SetPoint("TOPLEFT", gmotd, "TOPLEFT", 10, -10)
gmotd.text:SetPoint("TOPRIGHT", gmotd, "TOPRIGHT", -10, -10)
gmotd.text:SetJustifyV("TOP")
gmotd.text:SetFont(bdCore.media.font, 13)
gmotd.text:SetTextColor(0, 1, 0)
gmotd.text:CanWordWrap(true)
gmotd.text:SetWordWrap(true)

gmotd.button = CreateFrame("Button", nil, gmotd)
gmotd.button:SetText("Got it");
bdCore:skinButton(gmotd.button,false)
gmotd.button:SetPoint("TOP", gmotd, "BOTTOM", 0, -4)
gmotd.button:SetScript("OnClick",function(self)
	c.sv.gmotd = {}
	c.sv.gmotd[gmotd.msg] = true
	gmotd:Hide()
end)

gmotd:RegisterEvent("GUILD_MOTD")
gmotd:RegisterEvent("GUILD_ROSTER_UPDATE")
gmotd:SetScript("OnEvent", function(self, event, message)
	
	local msg
	if (event == "GUILD_MOTD") then
		msg = message
	else
		msg = GetGuildRosterMOTD()
	end
	
	if (string.len(msg) > 0 and not c.sv.gmotd[msg]) then
		gmotd.msg = msg
		gmotd.text:SetText(msg)
		gmotd.header:SetText(select(1, GetGuildInfo("player")).." - Message of the Day")
		gmotd:Show()
		local numlines = gmotd.text:GetNumLines()
		gmotd:SetHeight(20+(12.2*numlines))
		
		
	end
end)


local bdGameMenu = CreateFrame("frame","bdGameMenu")
bdGameMenu:SetFrameStrata("TOOLTIP")
bdGameMenu:SetFrameLevel(25)
local r,g,b,a = unpack(bdCore.media.border)
bdGameMenu:ClearAllPoints()
bdGameMenu:SetPoint("TOPLEFT",UIParent,"TOPLEFT")
bdGameMenu:SetPoint("BOTTOMRIGHT",UIParent,"BOTTOMRIGHT")
bdGameMenu:Hide()
bdGameMenu:SetAlpha(0)
bdGameMenu:SetScale(.7)

bdGameMenu.caret = CreateFrame("frame",nil,bdGameMenu)
bdGameMenu.caret:SetBackdrop({bgFile=bdCore.media.flat})
bdGameMenu.caret:SetBackdropColor(1,1,1,.9)
bdGameMenu.caret:SetSize(4,16)
bdGameMenu.caret:Hide()

function bdGameMenu:makeFont(text,frame)
	local fontframe = CreateFrame("Button",nil,bdGameMenu)
	fontframe:SetFrameLevel(27)
	fontframe.text = fontframe:CreateFontString(nil)
	fontframe.text:SetFont(bdCore.media.font, 18)
	fontframe.text:SetAllPoints(fontframe)
	fontframe.text:SetJustifyH("LEFT")
	fontframe.text:SetAlpha(0.7)
	fontframe.text:SetText(text)
	fontframe:SetSize(200,20)
	
	fontframe.SetText = function(self,text) self.text:SetText(text); end
	fontframe.SetTextColor = function(self,...) self.text:SetTextColor(...) end
	
	fontframe:SetScript("OnEnter",function()
		fontframe.text:SetAlpha(1)
		bdGameMenu.caret:SetPoint("RIGHT",fontframe,"LEFT",-2,1)
		bdGameMenu.caret:Show()
	end)
	fontframe:SetScript("OnLeave",function()
		fontframe.text:SetAlpha(0.7)
		bdGameMenu.caret:Hide()
	end)
	
	if (frame) then
		fontframe:SetScript("OnClick",function()
			frame:Click()
		end)
	end
	fontframe:EnableMouse(false)
	
	hooksecurefunc(GameMenuFrame,"Show",function()
		fontframe:EnableMouse(true)
	end)

	hooksecurefunc(GameMenuFrame,"Hide",function()
		fontframe:EnableMouse(false)
	end)
	
	return fontframe
end

bdGameMenu.resume = bdGameMenu:makeFont("RETURN TO GAME",GameMenuButtonContinue)
bdGameMenu.resume:SetPoint("LEFT",bdGameMenu,"LEFT",350,200)

bdGameMenu.config = bdGameMenu:makeFont("CONFIG")
bdGameMenu.config:SetPoint("TOPLEFT",bdGameMenu.resume,"BOTTOMLEFT",0,-24)
bdGameMenu.config:SetTextColor(unpack(bdCore.media.blue))
bdGameMenu.config:SetScript("OnMouseDown",function()
	bdCore:toggleConfig()
	GameMenuButtonContinue:Click()
	UIFrameFadeOut(bdGameMenu,.3,1,0)
end)

bdGameMenu.system = bdGameMenu:makeFont("SYSTEM",GameMenuButtonOptions)
bdGameMenu.system:SetPoint("TOPLEFT",bdGameMenu.config,"BOTTOMLEFT",0,-2)

bdGameMenu.interface = bdGameMenu:makeFont("INTERFACE",GameMenuButtonUIOptions)
bdGameMenu.interface:SetPoint("TOPLEFT",bdGameMenu.system,"BOTTOMLEFT",0,-2)

bdGameMenu.kbs = bdGameMenu:makeFont("KEYBINDINGS",GameMenuButtonKeybindings)
bdGameMenu.kbs:SetPoint("TOPLEFT",bdGameMenu.interface,"BOTTOMLEFT",0,-2)

bdGameMenu.macros = bdGameMenu:makeFont("MACROS",GameMenuButtonMacros)
bdGameMenu.macros:SetPoint("TOPLEFT",bdGameMenu.kbs,"BOTTOMLEFT",0,-2)

bdGameMenu.addons = bdGameMenu:makeFont("ADDONS",GameMenuButtonAddons)
bdGameMenu.addons:SetPoint("TOPLEFT",bdGameMenu.macros,"BOTTOMLEFT",0,-2)

bdGameMenu.logout = bdGameMenu:makeFont("LOGOUT",GameMenuButtonLogout)
bdGameMenu.logout:SetPoint("TOPLEFT",bdGameMenu.addons,"BOTTOMLEFT",0,-24)

bdGameMenu.quit = bdGameMenu:makeFont("QUIT",GameMenuButtonQuit)
bdGameMenu.quit:SetPoint("TOPLEFT",bdGameMenu.logout,"BOTTOMLEFT",0,-2)

-- bottom
bdGameMenu.help = bdGameMenu:makeFont("HELP",GameMenuButtonHelp)
bdGameMenu.help:SetPoint("TOPLEFT",bdGameMenu.quit,"BOTTOMLEFT",0,-24)

bdGameMenu.shop = bdGameMenu:makeFont("SHOP",GameMenuButtonStore)
bdGameMenu.shop:SetPoint("TOPLEFT",bdGameMenu.help,"BOTTOMLEFT",0,-2)

bdGameMenu.new = bdGameMenu:makeFont("WHAT'S NEW",GameMenuButtonWhatsNew)
bdGameMenu.new:SetPoint("TOPLEFT",bdGameMenu.shop,"BOTTOMLEFT",0,-2)

--model
bdGameMenu.model = CreateFrame("PlayerModel",nil,bdGameMenu)
bdGameMenu:RegisterEvent("PLAYER_LOGIN")
bdGameMenu:RegisterEvent("PLAYER_FLAGS_CHANGED")
bdGameMenu:RegisterEvent("PLAYER_ENTERING_WORLD")
bdGameMenu.model:SetSize(bdGameMenu:GetHeight(),bdGameMenu:GetHeight()*1.5)
bdGameMenu.model:SetPoint("BOTTOMLEFT",bdGameMenu,"BOTTOMLEFT",-310,40)
bdGameMenu.model:SetScale(768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)"))
bdGameMenu:SetScript("OnEvent",function()
	bdGameMenu.model:SetUnit("player")
	bdGameMenu.model:SetRotation(math.rad(40))
end)
bdGameMenu.model:SetFrameLevel(24)


--[[
GameMenuFrame:SetAlpha(0)
GameMenuFrame:ClearAllPoints()
GameMenuFrame:SetScale(.001)
GameMenuFrame:SetPoint("BOTTOMLEFT")
--]]
--[[

hooksecurefunc(GameMenuFrame,"Show",function()
	if (bdCore.config.General.fancymenu) then
		UIFrameFadeIn(bdGameMenu,.3,0,1)
		UIFrameFadeIn(UIParent,.3,1,0)
		GameMenuFrame:SetAlpha(0)
		GameMenuFrame:ClearAllPoints()
		GameMenuFrame:SetScale(.001)
		GameMenuFrame:SetPoint("BOTTOMLEFT")

		bdGameMenu.model:SetUnit("player")
		bdGameMenu.model:SetRotation(math.rad(40))
	else
		GameMenuFrame:SetAlpha(1)
		GameMenuFrame:SetScale(1)
		
		GameMenuFrame:ClearAllPoints()
		GameMenuFrame:SetPoint("CENTER",UIParent,"CENTER",0,0)
	end
end)

hooksecurefunc(GameMenuFrame,"Hide",function()
	if (bdCore.config.General.fancymenu) then
		UIFrameFadeOut(bdGameMenu,.3,1,0)
		UIFrameFadeOut(UIParent,.3,0,1)
	end
end)

--]]