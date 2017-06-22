local bdCore, c, f = select(2, ...):unpack()
local interrupt = CreateFrame('frame')
local channel = 'SAY'

local function RGBPercToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r*255, g*255, b*255)
end

interrupt:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
local function OnEvent(self, event, ...)
	if (not bdCore.config.General.interrupt) then return end
	if (select(2,...) ~= 'SPELL_INTERRUPT') then return end
	if (select(5,...) ~= UnitName('player')) then return end
	local class, classFileName = UnitClass("player")
	local colors = RAID_CLASS_COLORS[classFileName]
	local hex = RGBPercToHex(colors.r,colors.g,colors.b)
	local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15 = ...
	
	SendChatMessage(UnitName("player")..' interrupted ' .. GetSpellLink(arg15), channel)
end

interrupt:SetScript('OnEvent', OnEvent)