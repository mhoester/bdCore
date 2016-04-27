local bdCore, c, f = select(2, ...):unpack()

bdCore:RegisterEvent("ADDON_LOADED")
bdCore:RegisterEvent("PLAYER_REGEN_ENABLED")
bdCore:RegisterEvent("PLAYER_REGEN_DISABLED")
bdCore:RegisterEvent("LOADING_SCREEN_DISABLED")
bdCore:SetScript("OnEvent", function(self, event, arg1, arg2, ...)
	if (event == "ADDON_LOADED" and arg1 == "bdCore") then
		bdCore:triggerEvent('loaded_bdcore')

		if (not bdCoreDataPerChar) then
			bdCoreDataPerChar = c
		end
		c.sv = bdCoreDataPerChar
		c.sv.positions = c.sv.positions or {}
		c.sv.auras = c.sv.auras or {}
		c.sv.auras.raid = c.sv.auras.raid or {}
		c.sv.auras.whitelist = c.sv.auras.whitelist or {}
		c.sv.auras.blacklist = c.sv.auras.blacklist or {}
		c.sv.auras.mine = c.sv.auras.mine or {}
		c.sv.auras.player_class = c.sv.auras.mine.player_class or {}
		c.sv.goldtrack = c.sv.goldtrack or {}
		
		-- if something is nil, it needs to get set
		for group, options in pairs(c) do
			if (bdCoreDataPerChar[group] == nil) then
				bdCoreDataPerChar[group] = c[group]
			end
			for option, value in pairs(options) do
				if (bdCoreDataPerChar[group][option] == nil) then
					bdCoreDataPerChar[group][option] = value
				end
			end
			
		end
		
		for group, options in pairs(c.sv) do
			for option, value in pairs(options) do
				if (not c[group]) then c[group] = {} end
				if (c[group][option] ~= value) then
					c[group][option] = value
				end
			end
		end
		
		bdCore:addModule("General", bdCore.general)
		bdCore:addModule("Aura Whitelist", bdCore.whitelistconfig)
		bdCore:addModule("Aura Blacklist", bdCore.blacklistconfig)
		bdCore:addModule("Personal Auras", bdCore.personalconfig)
		
		bdCore:triggerEvent('bdcore_loaded')
		
	elseif (event == "LOADING_SCREEN_DISABLED") then
		bdCore:triggerEvent("bdcore_redraw")
	elseif (event == "PLAYER_REGEN_DISABLED") then
		bdCore:triggerEvent('combat_enter')
	elseif (event == "PLAYER_REGEN_ENABLED") then
		bdCore:triggerEvent('combat_exit')
	end
	
	return true
end)