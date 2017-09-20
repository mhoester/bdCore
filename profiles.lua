local bdCore, c, f = select(2, ...):unpack()


bdCore:hookEvent('profile_config',function() 
	local defaults = {}
	defaults[#defaults+1] = {intro = {
		type = "text",
		value = "The profile section is new, let me know if you see things that need improvement."
	}}

	bdCore:addModule("Profiles", defaults)
	
	local panel = f.config.panels['Profiles']
	print("this is our panel", panel)

	local profiles = ""
	for k, v in pairs(c.profiles) do
		print(k, v)
		profiles = profiles..k..","
	end
	profiles = "{"..strsub(profiles, 0, -1).."}"

	print(profiles)

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

	create.button = CreateFrame("Button", nil, create)
	

	-- current profile form

	-- copy profile form

	-- delete profile form

	
	
end)