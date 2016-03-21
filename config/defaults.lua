local bdCore, c, f = select(2, ...):unpack()

RAID_CLASS_COLORS = {
    ["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "ffabd473" },
    ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79, colorStr = "ff9482c9" },
    ["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0, colorStr = "ffffffff" },
    ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" },
    ["MAGE"] = { r = 0.41, g = 0.8, b = 0.94, colorStr = "ff69ccf0" },
    ["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41, colorStr = "fffff569" },
    ["DRUID"] = { r = 1.0, g = 0.49, b = 0.04, colorStr = "ffff7d0a" },
    ["SHAMAN"] = { r = 0.0, g = 0.44, b = 0.87, colorStr = "ff0070de" },
    ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "ffc79c6e" },
    ["DEATHKNIGHT"] = { r = 0.77, g = 0.12 , b = 0.23, colorStr = "ffc41f3b" },
    ["MONK"] = { r = 0.0, g = 1.00 , b = 0.59, colorStr = "ff00ff96" },
};

bdCore.media = {
	flat = "Interface\\Buttons\\WHITE8x8",
	font = "Interface\\Addons\\bdCore\\media\\font.ttf",
	arrow = "Interface\\Addons\\bdCore\\media\\arrow.blp",
	arrowup = "Interface\\Addons\\bdCore\\media\\arrowup.blp",
	arrowdown = "Interface\\Addons\\bdCore\\media\\arrowdown.blp",
	shadow = "Interface\\Addons\\bdCore\\media\\shadow.blp",
	border = {.06, .08, .09, 1},
	backdrop = {.11,.15,.18, 1},
	red = {.62,.17,.18,1},
	blue = {.2, .4, 0.8, 1},
}

bdCore.whitelistconfig = {
	[1] = {intro = {
		type = "text",
		value = "Add auras to the whitelist to have them tracked. i.e. Add a boss debuff to have it show on the raid frames.",
	}},
	[2] = {whitelist = {
		type = "list",
		value = bdCore.auras.whitelist,
		label = "Whitelisted Auras",
	}},
}

bdCore.blacklistconfig = {
	[1] = {intro = {
		type = "text",
		value = "Add auras to the blacklist to have them hidden whenever possible, such as buffs or debuffs that you don't need to track.",
	}},
	[2] = {blacklist = {
		type = "list",
		value = bdCore.auras.blacklist,
		label = "Blacklisted Auras",
	}},
}

bdCore.personalconfig = {
	[1] = {intro = {
		type = "text",
		value = "Personal auras will only show when they are cast by you, and class auras will only show when you're this class.",
	}},
	[2] = {mine = {
		type = "list",
		value = bdCore.auras.mine,
		label = "Auras Cast by Me",
	}},
	[3] = {[bdCore.class] = {
		type = "list",
		value = bdCore.auras.player_class[bdCore.class],
		label = 'All '..bdCore.class.." Auras",
	}},
}

-- modules defaults
