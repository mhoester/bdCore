local bdCore, c, f = select(2, ...):unpack()
local interrupt = CreateFrame('frame')
local channel = 'SAY'

local f = CreateFrame("Frame")

local function DBM_Style()
	
end

local function BW_Style()
	if not BigWigs then return end
	local bars = BigWigs:GetPlugin("Bars", true)
	if not bars then return end
	
	bars:RegisterBarStyle("Big Dumb", {
		apiVersion = 1,
		version = 1,
		GetSpacing = function(bar) return 10 end,
		ApplyStyle = function(bar) 
			bar:SetHeight(16)
			bar:SetScale(1)
			bar.SetScale = function() return end
			
			bar.bg = CreateFrame('frame', nil, bar)
			bar.bg:SetFrameStrata("BACKGROUND")
			bar.bg:SetAllPoints(bar.candyBarBar)
			bdCore:setBackdrop(bar.bg)
			
			bar.ibg = CreateFrame('frame', nil, bar)
			bar.ibg:SetFrameStrata("BACKGROUND")
			bar.ibg:SetAllPoints(bar.candyBarIconFrame)
			bdCore:setBackdrop(bar.ibg)
			
			bar.candyBarDuration:SetFont(bdCore.media.font, 14, "OUTLINE")
			bar.candyBarDuration:SetShadowOffset(0,0)
			bar.candyBarDuration:SetJustifyH("RIGHT")
			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:SetPoint("RIGHT", bar, "RIGHT", 2, 4)
			
			bar.candyBarLabel:SetFont(bdCore.media.font, 13, "OUTLINE")
			bar.candyBarLabel:SetShadowOffset(0,0)
			bar.candyBarLabel:SetJustifyH("LEFT")
			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:SetPoint("LEFT", bar, "LEFT", -2, 4)
					
			bar.candyBarBar:SetStatusBarTexture(bdCore.media.flat)
			bar.candyBarBackground:SetTexture(bdCore.media.flat)
			bar.candyBarBackground:SetVertexColor(.1,.1,.1,.4)
			bar.candyBarBackground.SetVertexColor = function() return end
			
			bar.candyBarBar:ClearAllPoints()
			bar.candyBarBar:SetPoint("TOPLEFT", bar, "BOTTOMLEFT", 0, 6)
			bar.candyBarBar:SetPoint("BOTTOMRIGHT", bar, "BOTTOMRIGHT", 0, 0)
			bar.candyBarBar.OldSetPoint = bar.candyBarBar.SetPoint
			bar.candyBarBar.SetPoint = function() return end
			
			--[[bar.candyBarBar:SetStatusBarColor(.2, .4, 0.8, 0.8)
			bar.candyBarBar.SetStatusBarColor = function(r, g, b, a)
				return
			end	--]]
			
			bar.candyBarIconFrame:ClearAllPoints()
			bar.candyBarIconFrame:SetPoint("BOTTOMLEFT", bar, "BOTTOMLEFT", -26, 0)
			bar.candyBarIconFrame:SetSize(20, 20)
			bar.candyBarIconFrame.SetWidth = function() return end
			bar.candyBarIconFrame:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end,
		BarStopped = function(bar) 
			bar.candyBarBar.SetPoint = bar.candyBarBar.OldSetPoint
		end,
		GetStyleName = function() return "BigDumb" end,
	})
end
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

local reason = nil
f:SetScript("OnEvent", function(self, event, msg)
	if event == "ADDON_LOADED" then
		if not reason then reason = (select(6, GetAddOnInfo("BigWigs_Plugins"))) end
		if (reason == "MISSING" and msg == "BigWigs") or msg == "BigWigs_Plugins" then
			BW_Style()
		end
	elseif event == "PLAYER_LOGIN" then
		--[[if IsAddOnLoaded("BigWigs") then
            BW_Style()
        elseif IsAddOnLoaded("DBM-Core") then
            DBM_Style()
        end--]]
	end
end)


local wa_skin = CreateFrame("Frame")
wa_skin:RegisterEvent("ADDON_LOADED")
wa_skin:SetScript("OnEvent", function(self, event,addon)
    if (event == "ADDON_LOADED" and not addon == "WeakAuras") then return end
	
	local flat = "Interface\\Buttons\\WHITE8x8"
	local font = bdCore.media.font --"fonts\\ARIALN.ttf"

	local function Skin_WeakAuras(frame)
		if (frame.SetBackdropColor) then
			frame:SetBackdrop({bgFile = flat, edgeFile = flat, edgeSize = 2})
			frame:SetBackdropColor(0,0,0,0.1)
			frame:SetBackdropBorderColor(0,0,0,1)
		end

		if frame.icon then
			frame.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			frame.icon.SetTexCoord = function() return end
			if frame.border and not frame.bar then
				frame.border:Hide()
			end
		end

		if frame.bar then
			if (frame.bar.fg:GetTexture()) then
				frame.bar.fg:SetTexture(flat)

				frame.bar.fg.SetColor = frame.bar.fg.SetVertexColor
				frame.bar.fg.SetVertexColor = function(self, r, g, b)
					frame.bar.fg:SetColor(r/2, g/2, b/2)
				end

				local r, g, b = frame.bar.fg:GetVertexColor()
				frame.bar.fg:SetVertexColor(r, g, b)

				frame.bar.fg.OffsetPoint = frame.bar.fg.SetPoint
				frame.bar.fg.SetPoint = function(self, point)
					frame.bar.fg:ClearAllPoints()
					if (point == "TOPLEFT") then
						frame.bar.fg:OffsetPoint("TOPLEFT", frame.bar, "TOPLEFT", 2, -2)
						frame.bar.fg:OffsetPoint("BOTTOMLEFT", frame.bar, "BOTTOMLEFT", 2, 2)
					end
					if (point == "TOPRIGHT") then
						frame.bar.fg:OffsetPoint("TOPRIGHT", frame.bar, "TOPRIGHT", -2, -2)
						frame.bar.fg:OffsetPoint("BOTTOMRIGHT", frame.bar, "BOTTOMRIGHT", -2, 2)
					end
					if (point == "BOTTOMLEFT") then
						frame.bar.fg:OffsetPoint("TOPLEFT", frame.bar, "TOPLEFT", 2, -2)
						frame.bar.fg:OffsetPoint("BOTTOMLEFT", frame.bar, "BOTTOMLEFT", 2, 2)
					end
					if (point == "BOTTOMRIGHT") then
						frame.bar.fg:OffsetPoint("TOPRIGHT", frame.bar, "TOPRIGHT", -2, -2)
						frame.bar.fg:OffsetPoint("BOTTOMRIGHT", frame.bar, "BOTTOMRIGHT", -2, 2)
					end
				end
				

				--[[frame.bar.background = frame.bar:CreateTexture(nil, "BACKGROUND", 1)
				frame.bar.background:SetTexture(bdCore.media.flat)
				frame.bar.background:SetVertexColor(0, 0, 0)
				frame.bar.background:SetPoint("TOPLEFT", frame.bar, "TOPLEFT", -2, 2)
				frame.bar.background:SetPoint("BOTTOMRIGHT", frame.bar, "BOTTOMRIGHT", 2, -2)--]]

				--frame.bar.backgroundcolor = frame.bar:CreateTexture(nil, "BACKGROUND", 2)
				--frame.bar.backgroundcolor:SetTexture(bdCore.media.flat)
				--frame.bar.backgroundcolor:SetVertexColor(unpack(bdCore.media.backdrop))
				--frame.bar.backgroundcolor:SetVertexColor(1,1,1)
				--frame.bar.backgroundcolor:SetAllPoints(frame.bar)
			end

			if (frame.bar.bg:GetTexture()) then
				--frame.bar.bg:SetTexture(bdCore.media.flat)
			--[[	frame.bar.bg.SetAllPoints = function()
					frame.bar.bg:ClearAllPoints()
					--frame.bar.bg:SetPoint()
					frame.bar.bg:SetPoint("TOPLEFT", frame.bar, "TOPLEFT", -2, 2)
					frame.bar.bg:SetPoint("BOTTOMRIGHT", frame.bar, "BOTTOMRIGHT", 2, -2)
				end--]]
			end
		end

		if frame.stacks then
			local fontHeight = select(3, frame.stacks:GetFont())
			if (not tonumber(fontHeight) or not fontHeight >0) then fontHeight = 14 end
			frame.stacks:SetFont(font, fontHeight, "OUTLINE")
		end

		if frame.timer then
			local fontHeight = select(3, frame.timer:GetFont())
			if (not tonumber(fontHeight) or not fontHeight >0) then fontHeight = 14 end
			frame.timer:SetFont(font, fontHeight, "OUTLINE")
		end

		if frame.text then
			local fontHeight = select(3, frame.text:GetFont())
			if (not tonumber(fontHeight) or not fontHeight >0) then fontHeight = 18 end
			frame.text:SetFont(font, fontHeight, "OUTLINE")
		end
		if frame.cooldown then
			local fontHeight = select(3, frame.cooldown:GetRegions():GetFont())
			if (not tonumber(fontHeight) or not fontHeight >0) then fontHeight = 14 end
			frame.cooldown:GetRegions():SetFont(font, fontHeight, "OUTLINE")
		end
	end

	if (WeakAuras) then
		for weakAura, v in pairs(WeakAuras.regions) do
			if (c.persistent.General.skinwas) then
				if (WeakAuras.regions[weakAura].regionType == "icon" or WeakAuras.regions[weakAura].regionType == "aurabar") then
					--print(WeakAuras.regions[weakAura].region)
					Skin_WeakAuras(WeakAuras.regions[weakAura].region)
				end
			end
		end
	end
	
end)











    local _, ns = ...

    local tooltip = CreateFrame('GameTooltip', 'iipArtifactScanner', UIParent, 'GameTooltipTemplate')
    tooltip:SetOwner(UIParent, 'ANCHOR_NONE')

    local bu = CreateFrame('Button', nil, UIParent, 'SecureActionButtonTemplate')
    bu:SetSize(21, 21)
    bu:SetFrameLevel(0)
    bu:SetAttribute('type', 'item')
	bu:SetPoint('CENTER', UIParent, 'CENTER', 0, 8)
    --bu:Hide()

    bu.t = bu:CreateTexture()
    bu.t:SetTexCoord(.1, .9, .1, .9)
    bu.t:SetAllPoints()

    bu.cd = CreateFrame('Cooldown', nil, bu, 'CooldownFrameTemplate')
    bu.cd:SetAllPoints()

    bu.text = bu:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmall')
    bu.text:SetPoint('RIGHT', bu, 'LEFT', -7, 1)

    local cooldown = function()
        if  bu.id then
            local start, cd = GetItemCooldown(bu.id)
            bu.cd:SetCooldown(start, cd)
        end
    end

    local hide = function()
        bu.id = nil
        bu:SetAttribute('item', nil)
        --bu:Hide()
        bu.t:SetTexture''
        bu.text:SetText''
    end

    local show = function(id, ap)
		print("show")
        bu.id = id
        bu:SetAttribute('item', 'item:'..id)
        bu:ClearAllPoints()
        bu:Show()
        bu.t:SetTexture(GetItemIcon(id))
        bu.text:SetText(string.format('%d %s'..' +', ap, 'Artifact Power'))

    end

    local scan = function()
        hide()
        for i = 0, 4 do
            for j = 1, GetContainerNumSlots(i) do
                local item = GetContainerItemLink(i, j)
                local id   = GetContainerItemID(i, j)
                if id then
                    tooltip:ClearLines()
                    tooltip:SetHyperlink(item)
                    local two = _G[tooltip:GetName()..'TextLeft2']
                    if two and two:GetText() then
                        if strmatch(two:GetText(), 'Artifact Power') then
                            local four = _G[tooltip:GetName()..'TextLeft4']:GetText()
                            four = gsub(four, ',', '')  --  strip BreakUpLargeNumbers
                            local ap = string.match(four, '%d+')
                            if ap then show(id, ap) break end
                        end
                    end
                end
            end
        end
    end

    bu:SetScript('OnEnter', function()
        GameTooltip:SetOwner(bu, 'ANCHOR_TOP')
        if bu.id then GameTooltip:SetItemByID(bu.id) end
    end)

    bu:SetScript('OnLeave', function() GameTooltip:Hide() end)

    local f = CreateFrame'Frame'
    f:RegisterEvent'BAG_UPDATE_COOLDOWN'
    f:RegisterEvent'SPELL_UPDATE_COOLDOWN'
    f:RegisterEvent'BAG_UPDATE_DELAYED'
    f:SetScript('OnEvent', function(self, event, ...) self[event](self, ...) end)

    function f:BAG_UPDATE_COOLDOWN()   cooldown() end
    function f:SPELL_UPDATE_COOLDOWN() cooldown() end
    function f:BAG_UPDATE_DELAYED()
        if InCombatLockdown() then
            f:RegisterEvent'PLAYER_REGEN_ENABLED'
        else
            scan()
        end
    end
    function f:PLAYER_REGEN_ENABLED()
        scan()
        f:UnregisterEvent'PLAYER_REGEN_ENABLED'
    end
