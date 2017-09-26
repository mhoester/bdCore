local bdCore, c, f = select(2, ...):unpack()

local function profileCallback(...) 
	
end

bdCore:hookEvent('profile_config',function() 
	local profiles_string = ""
	local profile_table = {}
	for k, v in pairs(c.profiles) do
		table.insert(profiles_table, k)
		profiles_string = profiles_string..k..","
	end
	profiles_string = "{"..strsub(profiles, 0, -1).."}"

	print(profiles_string)
	
	local defaults = {}
	defaults[#defaults+1] = {intro = {
		type = "text",
		value = "The profile section is new, let me know if you see things that need improvement."
	}}
	defaults[#defaults+1] = {currentprofile = {
		type = "dropdown",
		value = c.user.profile,
		options = profile_table,
		tooltip = "Your currently selected profile.",
		callback = function(...) profileCallback(...) end
	}}

	bdCore:addModule("Profiles", defaults)
	
	local panel = f.config.panels['Profiles']
	print("this is our panel", panel)

	-- make new profile form
	local name, realm = UnitName("player")
	realm = GetRealmName()
	local placeholder = name.."-"..realm

	local create = CreateFrame("EditBox",nil,panel)
	create:SetPoint("TOPLEFT", panel, "TOPLEFT", 10, 100)
	create:SetSize(200,20)
	bdCore:setBackdrop(create)
	create.background:SetVertexColor(.10,.14,.17,1)
	create:SetFont(media.font,12)
	create:SetText(placeholder)
	create:SetTextInsets(6, 2, 2, 2)
	create:SetMaxLetters(200)
	create:SetHistoryLines(1000)
	create:SetAutoFocus(false) 
	create:SetScript("OnEnterPressed", function(self, key) create.button:Click() end)
	create:SetScript("OnEscapePressed", function(self, key) self:ClearFocus() end)

	create.label = create:CreateFontString(nil)
	create.label:SetFont(bdCore.media.font, 12)
	create.label:SetText("Create New Profile: ")
	create.label:SetPoint("BOTTOMLEFT", create, "TOPLEFT", 0, 4)

	create.button = CreateFrame("Button", nil, create, "UIPanelButtonTemplate")
	create.button:SetPoint("LEFT", create, "RIGHT", 4, 0)
	create.button:SetText("Create")
	

	-- current profile form
	

	-- copy profile form

	-- delete profile form

	
	
end)