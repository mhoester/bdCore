local bdCore, c, f = select(2, ...):unpack()
local media = bdCore.media

local configdims = {
	width = 400,
	left_col = 140,
	height = 430,
	rightwidth = 210
}

local cfg = CreateFrame( "Frame", "bdCore config", UIParent)
cfg:SetPoint("RIGHT", UIParent, "RIGHT", -20, 0)
cfg:SetSize(configdims.width, configdims.height)
bdCore:setBackdrop(cfg)
cfg:SetMovable(true)
cfg:SetUserPlaced(true)
cfg:SetFrameStrata("DIALOG")
cfg:SetClampedToScreen(true)
bdCore:createShadow(cfg,10)
cfg:Hide()
cfg.header = CreateFrame("frame",nil,cfg)
cfg.header:SetPoint("TOPLEFT",cfg,"TOPLEFT",0,0)
cfg.header:SetSize(configdims.width,30)
cfg.header:RegisterForDrag("LeftButton","RightButton")
cfg.header:EnableMouse(true)
cfg.header:SetScript("OnDragStart", function(self) cfg:StartMoving() end)
cfg.header:SetScript("OnDragStop", function(self) cfg:StopMovingOrSizing() end)

cfg.header.title = CreateFrame( "Frame", nil, cfg.header)
cfg.header.title:SetSize(configdims.left_col,30)
cfg.header.title:SetBackdrop({bgFile = media.flat})
cfg.header.title:SetBackdropColor(1,1,1,.05)
cfg.header.title:SetPoint("LEFT", cfg.header, "LEFT")

cfg.header.title.t = cfg.header.title:CreateFontString(nil, "OVERLAY")
cfg.header.title.t:SetFont(media.font, 16)
cfg.header.title.t:SetTextColor(1, 1, 1, 1)
cfg.header.title.t:SetText("bdCore Config")
cfg.header.title.t:SetAllPoints(cfg.header.title)
cfg.header.title.t:SetJustifyH("CENTER")

-- exit button
cfg.header.close = CreateFrame("Button", nil, cfg.header)
cfg.header.close:SetPoint("TOPRIGHT", cfg.header, "TOPRIGHT", 0 ,0)
cfg.header.close:SetSize(30, 28)
cfg.header.close:SetBackdrop({bgFile = media.flat})
cfg.header.close:SetBackdropColor(unpack(media.red))
cfg.header.close:SetAlpha(0.6)
cfg.header.close:EnableMouse(true)
cfg.header.close:SetScript("OnEnter", function()
	cfg.header.close:SetAlpha(1)
end)
cfg.header.close:SetScript("OnLeave", function()
	cfg.header.close:SetAlpha(0.6)
end)
cfg.header.close:SetScript("OnClick", function()
	cfg:Hide()
end)
cfg.header.close.x = cfg.header.close:CreateFontString(nil)
cfg.header.close.x:SetFont(media.font, 12)
cfg.header.close.x:SetText("x")
cfg.header.close.x:SetPoint("CENTER", cfg.header.close, "CENTER", .5, 0)


-- reload button
cfg.header.reload = CreateFrame("Button", nil, cfg.header)
cfg.header.reload:SetPoint("RIGHT", cfg.header.close, "LEFT", -2 ,0)
cfg.header.reload:SetSize(70, 28)
cfg.header.reload:SetBackdrop({bgFile = media.flat})
cfg.header.reload:SetBackdropColor(unpack(media.blue))
cfg.header.reload:SetAlpha(0.6)
cfg.header.reload:EnableMouse(true)
cfg.header.reload:SetScript("OnEnter", function()
	cfg.header.reload:SetAlpha(1)
end)
cfg.header.reload:SetScript("OnLeave", function()
	cfg.header.reload:SetAlpha(0.6)
end)
cfg.header.reload:SetScript("OnClick", function()
	ReloadUI()
end)

cfg.header.reload.x = cfg.header.reload:CreateFontString(nil)
cfg.header.reload.x:SetFont(media.font, 12)
cfg.header.reload.x:SetText("Reload UI")
cfg.header.reload.x:SetPoint("CENTER", cfg.header.reload, "CENTER", 1, 0)

-- lock/unlock button
cfg.header.lock = CreateFrame("Button", nil, cfg.header)
cfg.header.lock:SetPoint("RIGHT", cfg.header.reload, "LEFT", -2 ,0)
cfg.header.lock:SetSize(70, 28)
cfg.header.lock:SetBackdrop({bgFile = media.flat})
cfg.header.lock:SetBackdropColor(unpack(media.green))
cfg.header.lock:SetAlpha(0.6)
cfg.header.lock:EnableMouse(true)
cfg.header.lock:SetScript("OnEnter", function()
	cfg.header.lock:SetAlpha(1)
end)
cfg.header.lock:SetScript("OnLeave", function()
	cfg.header.lock:SetAlpha(0.6)
end)
cfg.header.lock:SetScript("OnClick", function(self)
	bdCore.toggleLock()
	if (self.x:GetText() == "Lock") then
		self.x:SetText("Unlock")
	else
		self.x:SetText("Lock")
	end
end)

cfg.header.lock.x = cfg.header.lock:CreateFontString(nil)
cfg.header.lock.x:SetFont(media.font, 12)
cfg.header.lock.x:SetText("Unlock")
cfg.header.lock.x:SetPoint("CENTER", cfg.header.lock, "CENTER", 1, 0)

-- main window
cfg.main = CreateFrame("frame",nil,cfg)
cfg.main:SetPoint("TOPLEFT",cfg.header,"BOTTOMLEFT")
cfg.main:SetPoint("BOTTOMRIGHT",cfg,"BOTTOMRIGHT", 0, 0)
bdCore:setBackdrop(cfg.main)

-- left
cfg.left = CreateFrame( "Frame", nil, cfg)
cfg.left:SetPoint("TOPLEFT", cfg.main, "TOPLEFT", 0, 0)
cfg.left:SetPoint("BOTTOMRIGHT", cfg.main, "BOTTOMLEFT", configdims.left_col, 0)
cfg.left:SetBackdrop({bgFile = media.flat})
cfg.left:SetBackdropColor(1,1,1,.05)


-- functions
cfg.options = {}
cfg.panels = {}
cfg.config = {}
cfg.lastitem = false

function bdCore:toggleConfig()
	cfg:Show()
	cfg.first.select()
	if (bdCore.moving) then
		cfg.header.lock.x:SetText("Lock")
	else
		cfg.header.lock.x:SetText("Unlock")
	end
end

--bdCore:hookEvent("bdcore_loaded",function() bdCore:toggleConfig() end)

function bdCore:addModule(name,configs)
	local smartconf = {}

	local frame = CreateFrame('frame', nil, cfg)
	frame.name = name
	frame:SetSize(configdims.left_col, 26)
	if (not cfg.lastitem) then
		frame:SetPoint("TOP", cfg.left, "TOP", 0, 0)
		cfg.first = frame
	else
		frame:SetPoint("TOP", cfg.lastitem, "BOTTOM", 0, 0)
	end
	cfg.lastitem = frame
	frame:SetBackdrop({bgFile = media.flat})
	frame:SetBackdropColor(0,0,0,0)
	frame:EnableMouse(true)
	
	frame:SetScript("OnEnter", function()
		if (not frame.active) then
			frame:SetBackdropColor(1,1,1,0.1)
		end
	end)
	frame:SetScript("OnLeave", function()
		if (not frame.active) then
			frame:SetBackdropColor(1,1,1,0)
		end
	end)
	
	frame.select = function()
		if (frame.active) then return end
		
		for k, v in pairs(cfg.options) do
			cfg.panels[k]:Hide()
			cfg.options[k].active = false
			cfg.options[k]:SetBackdropColor(0,0,0,0)
		end

		cfg.panels[frame.name]:Show()
		frame.active = true
		frame:SetBackdropColor(unpack(media.red))
		cfg.first = frame
	end
	
	frame:SetScript("OnMouseUp", function()
		frame.select()
	end)
	
	frame.text = frame:CreateFontString(nil, "OVERLAY")
	frame.text:SetPoint("LEFT", frame, "LEFT", 8, 0)
	frame.text:SetFont(media.font, 14)
	frame.text:SetText(name)
	
	--parent frame 
	local panel = CreateFrame('frame', nil, cfg)
	panel:SetPoint("TOPLEFT", cfg.left, "TOPRIGHT", 0, -2)
	panel:SetPoint("BOTTOMRIGHT", cfg.main, "BOTTOMRIGHT", -2, 2)
	panel.name = name
	panel:Hide()
	cfg.config[name] = panel

	--scrollframe 
	local scrollframe = CreateFrame("ScrollFrame", nil, panel) 
	scrollframe:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -30, -10) 
	scrollframe:SetSize(panel:GetWidth()-40, panel:GetHeight()-20) 
	panel.scrollframe = scrollframe 

	--scrollbar 
	local scrollbar = CreateFrame("Slider", nil, scrollframe, "UIPanelScrollBarTemplate") 
	scrollbar:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -2, -18) 
	scrollbar:SetPoint("BOTTOMLEFT", panel, "BOTTOMRIGHT", -18, 18) 
	scrollbar:SetMinMaxValues(1, math.ceil(panel:GetHeight()+1)) 
	scrollbar:SetValueStep(1) 
	scrollbar.scrollStep = 1
	scrollbar:SetValue(0) 
	scrollbar:SetWidth(16) 
	scrollbar:SetScript("OnValueChanged", function (self, value) self:GetParent():SetVerticalScroll(value) self:SetValue(value) end) 
	scrollbar:SetBackdrop({bgFile = media.flat})
	scrollbar:SetBackdropColor(0,0,0,.2)
	panel.scrollbar = scrollbar 

	--content frame 
	panel.content = CreateFrame("Frame", nil, scrollframe) 
	panel.content:SetSize(panel:GetWidth()-40, panel:GetHeight()-20) 
	scrollframe.content = panel.content 
	scrollframe:SetScrollChild(panel.content)
	
	--[[panel.text = panel:CreateFontString(nil)
	panel.text:SetFont(media.font, 14)
	panel.text:SetText(name)
	panel.text:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, 24)--]]
	
	panel:SetScript("OnMouseWheel", function(self, delta)
		self.scrollbar:SetValue(self.scrollbar:GetValue() - (delta*20))
	end)
	
	cfg.options[name] = frame
	cfg.panels[name] = panel
	
	if (configs) then
		local scrollheight = 0
		
		for i = 1, #configs do
			local conf = configs[i]
			
			c[name] = c[name] or {}
			c.sv[name] = c.sv[name] or {}
			
			for option, info in pairs(conf) do
				
				if (c.sv[name][option] == nil) then
					c[name] = c[name] or {}
					c.sv[name][option] = info['value']
				end
				
				if (info.type == "slider") then
					bdCore:createSlider(name, option, info)
					scrollheight = scrollheight + 54
				elseif (info.type == "checkbox") then
					bdCore:createCheckButton(name, option, info)
					scrollheight = scrollheight + 40
				elseif (info.type == "dropdown") then
					bdCore:createDropdown(name, option, info)
					scrollheight = scrollheight + 70
				elseif (info.type == "text") then
					bdCore:createText(name, info)
					scrollheight = scrollheight + 30 + ((strlen(info.value)/39)*12)
				elseif (info.type == "list") then
					bdCore:createList(name, option, info)
					scrollheight = scrollheight + 250
				end
				
				smartconf[option] = c[name][option]
			end

		end
		
		scrollheight = scrollheight - 320
		if (scrollheight < 1) then 
			scrollheight = 1
			panel.scrollbar:Hide()
		else
			panel.scrollbar:Show()
		end
		
		panel.scrollbar:SetMinMaxValues(1, scrollheight) 
		panel.content:SetHeight(scrollheight+320)
	end
	
	collectgarbage()
	
	return smartconf
end

--------------------------------------------------
-- functions here
--------------------------------------------------
function bdCore:createText(group, info)
	local panel = cfg.config[group].content
	local text = panel:CreateFontString(nil)
	text:SetFont(media.font, 14)
	text:SetText(info.value)
	text:SetTextColor(0.8,0.8,0.8)
	text:SetWidth(panel:GetWidth()-10)
	text:SetJustifyH("LEFT")
	
	if (not panel.lastFrame) then
		text:SetPoint("TOPLEFT", panel, "TOPLEFT", 6, 0)
	else
		text:SetPoint("TOP", panel.lastFrame, "BOTTOM", 0, -30)
	end
	panel.lastFrame = text
	panel.lastFrame.type = "text"
	
	return text
end
function bdCore:createList(group,option,info)
	local panel = cfg.config[group].content
	
	local container = CreateFrame("frame",nil,panel)
	container:SetSize(configdims.rightwidth,200)
	bdCore:setBackdrop(container)
	container.background:SetBackdropColor(.18,.22,.25,1)
	if (not panel.lastFrame) then
		container:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -30)
	else
		container:SetPoint("TOP", panel.lastFrame, "BOTTOM", 0, -70)
	end
	panel.lastFrame = container
	panel.lastFrame.type = "list"
	
	--scrollframe 
	local scrollframe = CreateFrame("ScrollFrame", nil, container) 
	scrollframe:SetPoint("TOPRIGHT", container, "TOPRIGHT", 0, -6) 
	scrollframe:SetSize(container:GetWidth(), container:GetHeight()-12) 
	container.scrollframe = scrollframe 

	--scrollbar 
	local scrollbar = CreateFrame("Slider", nil, scrollframe, "UIPanelScrollBarTemplate") 
	scrollbar:SetPoint("TOPRIGHT", container, "TOPRIGHT", -2, -18) 
	scrollbar:SetPoint("BOTTOMLEFT", container, "BOTTOMRIGHT", -18, 18) 
	scrollbar:SetMinMaxValues(1, 600) 
	scrollbar:SetValueStep(1) 
	scrollbar.scrollStep = 1
	scrollbar:SetValue(0) 
	scrollbar:SetWidth(16) 
	scrollbar:SetScript("OnValueChanged", function (self, value) self:GetParent():SetVerticalScroll(value) self:SetValue(value) end) 
	scrollbar:SetBackdrop({bgFile = media.flat})
	scrollbar:SetBackdropColor(0,0,0,.2)
	container.scrollbar = scrollbar 

	--content frame 
	container.content = CreateFrame("Frame", nil, scrollframe) 
	container.content:SetSize(container:GetWidth(), container:GetHeight()) 
	scrollframe.content = container.content 
	scrollframe:SetScrollChild(container.content)
	
	container.content.text = container.content:CreateFontString(nil)
	container.content.text:SetFont(media.font,12)
	container.content.text:SetPoint("TOPLEFT",container.content,"TOPLEFT",5,0)
	container.content.text:SetHeight(600)
	container.content.text:SetWidth(container:GetWidth()-10)
	container.content.text:SetJustifyH("LEFT")
	container.content.text:SetJustifyV("TOP")
	
	
	container.insert = CreateFrame("EditBox",nil,container)
	container.insert:SetPoint("BOTTOMLEFT", container, "TOPLEFT",0,2)
	container.insert:SetSize(144, 24)
	bdCore:setBackdrop(container.insert)
	container.insert.background:SetBackdropColor(.10,.14,.17,1)
	container.insert:SetFont(media.font,12)
	container.insert:SetTextInsets(6, 2, 2, 2)
	container.insert:SetMaxLetters(200)
	container.insert:SetHistoryLines(1000)
	container.insert:SetAutoFocus(false) 
	container.insert:SetScript("OnEnterPressed", function(self, key) container.button:Click() end)
	container.insert:SetScript("OnEscapePressed", function(self, key) self:ClearFocus() end)
	
	-- submit
	container.button = CreateFrame("Button", nil, container)
	container.button:SetPoint("TOPLEFT", container.insert, "TOPRIGHT", 0 ,2)
	container.button:SetSize(68, 28)
	container.button:SetBackdrop({
		bgFile = bdCore.media.flat, 
		edgeFile = bdCore.media.flat, edgeSize = 2,
		insets = { left = 2, right = 2, top = 2, bottom = 2 }
	})
	container.button:SetBackdropColor(unpack(media.blue))
	container.button:SetBackdropBorderColor(unpack(media.border))
	container.button:SetAlpha(0.8)
	container.button:EnableMouse(true)
	container.button:SetScript("OnEnter", function()
		container.button:SetAlpha(1)
	end)
	container.button:SetScript("OnLeave", function()
		container.button:SetAlpha(0.8)
	end)
	container.button:SetScript("OnClick", function()
		local value = container.insert:GetText()
		if (strlen(value) > 0) then
			container.addremove(container.insert:GetText())
		end
		container.insert:SetText("")
		container.insert:ClearFocus()
	end)

	container.button.x = container.button:CreateFontString(nil)
	container.button.x:SetFont(media.font, 12)
	container.button.x:SetText("Add/Remove")
	container.button.x:SetPoint("CENTER", container.button, "CENTER", 1, 0)
	
	container.label = container:CreateFontString(nil)
	container.label:SetFont(media.font, 14)
	container.label:SetPoint("BOTTOMLEFT", container.insert, "TOPLEFT", 0, 4)
	container.label:SetText(info.label)
	
	function container.populate()
		local string = "";
		local height = 0;
		for k, v in pairs(c.sv[group][option]) do
			string = string..k.."\n";
			height = height + 14
			container.insert:AddHistoryLine(k)
		end
		local scrollheight = height-200
		if (scrollheight < 1) then 
			scrollheight = 1 
			container.scrollbar:Hide()
		else
			container.scrollbar:Show()
			container:SetScript("OnMouseWheel", function(self, delta) self.scrollbar:SetValue(self.scrollbar:GetValue() - (delta*30)) end)
		end
		container.scrollbar:SetMinMaxValues(1,scrollheight)
		container.content.text:SetHeight(height)
		container.content.text:SetText(string)
	end
	function container.addremove(value)
		container.insert:AddHistoryLine(value)
		if(c.sv[group][option][value]) then
			c[group][option][value] = nil
			c.sv[group][option][value] = nil
		else
			c[group][option][value] = true
			c.sv[group][option][value] = true
		end
		container.populate()
	end
	
	container.populate()
	
	if (info.callback) then
		info:callback()
	end
end

function bdCore:createDropdown(group, option, info)
	local panel = cfg.config[group].content
	--local items = {strsplit(",",info.options)}
	local items = info.options
	local container = CreateFrame("Button", "bdCore_"..info.label, panel)
	local dropdown = CreateFrame("Frame", "bdCore_"..info.label, panel)
	container:SetWidth(configdims.rightwidth-10)
	container:SetHeight(20)
	bdCore:setBackdrop(container)
	if (not panel.lastFrame) then
		container:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -30)
	else
		container:SetPoint("TOP", panel.lastFrame, "BOTTOM", 0, -50)
	end
	panel.lastFrame = container
	panel.lastFrame.type = "dropdown"
	
	container.arrow = container:CreateTexture(nil,"OVERLAY")
	container.arrow:SetTexture(media.arrowdown)
	container.arrow:SetSize(8, 6)
	container.arrow:SetVertexColor(1,1,1,.4)
	container.arrow:SetPoint("RIGHT", container, "RIGHT", -6, 1)
	container.arrow:Show()
	
	container.label = container:CreateFontString(nil)
	container.label:SetFont(media.font, 14)
	container.label:SetPoint("BOTTOMLEFT", container, "TOPLEFT", 0, 4)
	container.label:SetText(info.label)
	
	container.selected = container:CreateFontString(nil)
	container.selected:SetFont(media.font, 13)
	container.selected:SetPoint("LEFT", container, "LEFT", 6, 0)
	container.selected:SetText(c.sv[group][option])
	
	function container:click()
		if (dropdown.dropped) then
			dropdown:Hide()
			dropdown.dropped = false
			container.background:SetBackdropColor(.11,.15,.18, 1)
			container.arrow:SetTexture(media.arrowdown)
		else
			dropdown:Show()
			dropdown.dropped = true
			container.background:SetBackdropColor(1,1,1,.05)
			container.arrow:SetTexture(media.arrowup)
		end
	end
	
	container:SetScript("OnClick", function() container:click()end)

	dropdown:Hide()
	dropdown:SetFrameLevel(10)
	dropdown:SetBackdrop({
		bgFile = bdCore.media.flat, 
		edgeFile = bdCore.media.flat, edgeSize = 2,
		insets = { left = 2, right = 2, top = 2, bottom = 2 }
	})
	dropdown:SetBackdropColor(.18,.22,.25,1)
	dropdown:SetBackdropBorderColor(.06, .08, .09, 1)
	dropdown.dropped = false
	dropdown.lastframe = false
	dropdown:SetSize(container:GetWidth()+4, 22*#items)


	for i = 1, #items do
		local item = CreateFrame("Button", nil, dropdown)
		item:SetSize(dropdown:GetWidth()-4, 20)
		item:SetBackdrop({bgFile = bdCore.media.flat, })
		item:SetBackdropColor(0,0,0,0)
		item:SetScript("OnEnter",function() item:SetBackdropColor(.21,.25,.29,1) end)
		item:SetScript("OnLeave",function() item:SetBackdropColor(0,0,0,0) end)
		item.label = item:CreateFontString(nil)
		item.label:SetFont(media.font, 13)
		item.label:SetPoint("LEFT", item, "LEFT", 6, 0)
		item.label:SetText(items[i])
		item.id = i
		if (not dropdown.lastFrame) then
			item:SetPoint("TOPLEFT", dropdown, "TOPLEFT", 2, -2)
		else
			item:SetPoint("TOPLEFT", dropdown.lastFrame, "BOTTOMLEFT", 0, 0)
		end
		
		item:SetScript("OnClick", function(self)
			c[group][option] = self.label:GetText()
			c.sv[group][option] = self.label:GetText()
			
			if (info.callback) then
				info:callback()
			end
		
			container.selected:SetText(c.sv[group][option])
			container:click()
		end)
		
		dropdown.lastFrame = item
	end

	dropdown:SetPoint("TOPLEFT", container, "BOTTOMLEFT", -2, 1)
	return dropdown
end

function bdCore:createSlider(group, option, info)
	local panel = cfg.config[group].content
	local container = CreateFrame("frame",nil,panel)
	local slider = CreateFrame("Slider", "bdCore_"..option, panel, "OptionsSliderTemplate")
	slider:SetWidth(configdims.rightwidth-20)
	slider:SetHeight(14)
	slider:SetPoint("CENTER",container,"CENTER")
	container:SetSize(configdims.rightwidth-20, 34)
	if (not panel.lastFrame) then
		container:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, -20)
	else
		container:SetPoint("TOP", panel.lastFrame, "BOTTOM", 0, -20)
	end
	panel.lastFrame = container
	panel.lastFrame.type = "slider"
	
	
	slider:SetOrientation('HORIZONTAL')
	slider:SetMinMaxValues(info.min,info.max)
	slider:SetValue(c.sv[group][option])
	slider:SetObeyStepOnDrag(true)
	slider:SetValueStep(info.step)
	slider.tooltipText = info.tooltip
	_G[slider:GetName() .. 'Low']:SetText(info.min);
	_G[slider:GetName() .. 'Low']:SetTextColor(1,1,1);
	_G[slider:GetName() .. 'Low']:SetFont(media.font, 12)
	_G[slider:GetName() .. 'Low']:ClearAllPoints()
	_G[slider:GetName() .. 'Low']:SetPoint("TOP",slider,"BOTTOMLEFT",0,-1)
	_G[slider:GetName() .. 'High']:SetText(info.max);
	_G[slider:GetName() .. 'High']:SetTextColor(1,1,1);
	_G[slider:GetName() .. 'High']:SetFont(media.font, 12)
	_G[slider:GetName() .. 'High']:ClearAllPoints()
	_G[slider:GetName() .. 'High']:SetPoint("TOP",slider,"BOTTOMRIGHT",0,-1)
	_G[slider:GetName() .. 'Text']:SetText(info.label);
	_G[slider:GetName() .. 'Text']:SetTextColor(1,1,1);
	_G[slider:GetName() .. 'Text']:SetFont(media.font, 14)
	slider.value = slider:CreateFontString(nil)
	slider.value:SetFont(media.font, 12)
	slider.value:SetText(c.sv[group][option])
	slider.value:SetTextColor(1,1,1)
	slider.value:SetPoint("TOP", slider,"BOTTOM", 0, -2)
	slider:Show()
	slider:SetScript("OnValueChanged", function(self)
		local newval = round(slider:GetValue(), 1)
		if (c.sv[group][option] == newval) then -- throttle it changing on every pixel
			return false
		end
		slider:SetValue(newval)
		slider.value:SetText(newval)
		
		c[group][option] = newval
		c.sv[group][option] = newval
		
		if (info.callback) then
			info:callback()
		end
	end)
	return slider
end

function bdCore:createCheckButton(group, option, info)
	local panel = cfg.config[group].content
	local check = CreateFrame("CheckButton", "bdCore_"..option, panel, "ChatConfigCheckButtonTemplate")
	local container = CreateFrame("frame",nil,panel)
	container:SetSize(configdims.rightwidth, 20)
	check:Point("LEFT", container, "LEFT", 0, 0)
	
	if (not panel.lastFrame) then
		container:SetPoint("TOPLEFT", panel, "TOPLEFT", 0, 0)
	else
		container:SetPoint("TOP", panel.lastFrame, "BOTTOM", 0, -20)
	end
	panel.lastFrame = container
	panel.lastFrame.type = "check"
	
	_G[check:GetName().."Text"]:SetText(info.label)
	_G[check:GetName().."Text"]:SetFont(bdCore.media.font, 14)
	_G[check:GetName().."Text"]:ClearAllPoints()
	_G[check:GetName().."Text"]:SetPoint("LEFT", check, "RIGHT", 2, 1)
	check.tooltip = info.tooltip;
	check:SetChecked(c.sv[group][option])
	check:SetScript("OnClick", function(self)
		c[group][option] = self:GetChecked()
		c.sv[group][option] = self:GetChecked()
		
		if (info.callback) then
			info:callback(check)
		end
	end)
	
	return check
end

f.config = cfg