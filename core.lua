local addon, engine = ...

engine[1] = CreateFrame("Frame", nil, UIParent)
engine[2] = {}
engine[3] = {}

engine[1]:RegisterEvent("ADDON_LOADED")
engine[1].class = select(2, UnitClass("player")) 

function engine:unpack()
	return self[1], self[2], self[3]
end

bdCore = engine[1]
bdCore.colorString = '|cffA02C2Fbd|r'
bdCore.config = engine[2]
bdCore.frames = engine[3]
