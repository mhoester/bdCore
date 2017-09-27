local bdCore, c, s = select(2, ...):unpack()

bdCore:RegisterEvent("ADDON_LOADED")
bdCore:RegisterEvent("PLAYER_REGEN_ENABLED")
bdCore:RegisterEvent("PLAYER_REGEN_DISABLED")
bdCore:RegisterEvent("LOADING_SCREEN_DISABLED")
--bdCore:RegisterEvent("PLAYER_ENTERING_WORLD")
bdCore:SetScript("OnEvent", function(self, event, arg1, arg2, ...)
	-- set UIScale manually, since the CVAR won't let you go beneath 0.64 (why blizz??)
	if (not InCombatLockdown()) then
		--SetCVar("uiScale", bdCore.scale)
		--SetCVar("useUIScale", 0)
		--SetCVar("uiScaleMultiplier", -1)
		UIParent:SetScale(bdCore.scale)
	end

	if (event == "ADDON_LOADED" and (arg1 == "bdCore" or arg1 == "bdcore")) then

		local first = false
		-- create default profile
		if (not BD_profiles['default'] ) then
			BD_profiles['default'] = c

			c.profiles = BD_profiles

			print("current profile", c.profiles)
		end

		-- create this characters configuration
		if (not BD_users[bdCore.name] ) then
			BD_users[bdCore.name] = {}

			c.user = BD_users[bdCore.name]

			c.user.profile = "default"
			c.user.profile_spec = false
			c.user.profile_spec[1] = false
			c.user.profile_spec[2] = false
			c.user.profile_spec[3] = false
			c.user.profile_spec[4] = false

			first = true; -- trigger first time run screen

			print("current user profile", c.user)
		end

		-- things that are not profile specific
		if (not BD_persistent ) then
			BD_persistent = {}
			c.persistent = BD_persistent
			c.persistent.auras = {}
			c.persistent.auras.raid = {}
			c.persistent.auras.whitelist = {}
			c.persistent.auras.blacklist = {}
			c.persistent.auras.mine = {}
			c.persistent.auras.class[bdCore.class] = {}
			c.persistent.gmotd = {}
			c.persistent.goldtrack = {}

			print("current persistent", c.persistent)
		end

		-- reference SavedVariables in the c namespace
		c.persistent = BD_persistent
		c.user = BD_users[bdCore.name]
		c.profiles = BD_profiles

		-- Scope current profile
		c.profile = c.profiles[c.user.profile]
		c.profile.positions = c.profile.positions or {}
	
		-- we shouldn't need this since lua references automatically the same table?
		-- when we update the default configuration, those new configurations should be copied over
		--[[ for group, options in pairs(c) do
			if (bdCoreDataPerChar[group] == nil) then
				bdCoreDataPerChar[group] = c[group]
			end
			for option, value in pairs(options) do
				if (bdCoreDataPerChar[group][option] == nil) then
					bdCoreDataPerChar[group][option] = value
				end
			end
			
		end--]]
		
		--[[
		for group, options in pairs(c.sv) do
			for option, value in pairs(options) do
				if (not c[group]) then c[group] = {} end
				if (c[group][option] ~= value) then
					c[group][option] = value
				end
			end
		end--]]

		bdCore:triggerEvent('profile_config')

		if (first) then
			bdCore:triggerEvent('bd_first_run')
		end
		
		bdCore:addModule("General", bdCore.general)
		
		bdCore:triggerEvent('loaded_bdcore')
		
	elseif (event == "LOADING_SCREEN_DISABLED") then
		--bdCore:triggerEvent("bdcore_redraw")
		
	elseif (event == "PLAYER_REGEN_DISABLED") then
		bdCore:triggerEvent('combat_enter')
	elseif (event == "PLAYER_REGEN_ENABLED") then
		bdCore:triggerEvent('combat_exit')
	end
	
	return true
end)