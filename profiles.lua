local bdCore, c, f = select(2, ...):unpack()


bdCore:hookEvent('profile_config',function() 
	local defaults = {}
	defaults[#defaults+1] = {intro = {
		type = "text",
		value = "The profile section is new, so let me know if you see things that need improvement."
	}}
	
	local profiles = ""
	for k, v in pairs(c.sv.profiles_data.profiles) do
		print(k, v)
		profiles = profiles..k..","
	end
	profiles = "{"..strsub(profiles, 0, -1).."}"
	print(profiles)
	
	-- defaults[#defaults+1] = {current_profile = {
		-- type="dropdown",
		-- value="Left",
		-- options={"Left","Right"},
		-- label="Buff Horizontal Growth",
		-- callback = function() addon:config_changed() end
	-- }}

end)