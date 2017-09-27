local bdCore, c, f = select(2, ...):unpack()


bdCore.auras = {}
--[[
bdCore.auras.watch = {}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Stats'] = {
	1126, 
	20217, 
	115921, 
	116781, 
	90363, 
	159988, 
	160017, 
	160077, 
	160206,
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Mastery'] = {
	19740, -- Blessing of Might
	116956, -- Grace of Air
	155522, -- Power of the Grave
	24907,  -- Moonkin Aura
	93435,  -- Roar of Courage
	128997,  -- Spirit Beast Blessing
	160039, -- Keeen Senses
	160073,  -- Plainswalking
	160198, -- Lone Wolf: Grace of the Cat
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Crit'] = {
	17007, -- Leader of the Pack
	1459,  -- Arcane Brilliance
	61316, -- Dalaran Brilliance
	116781, -- Legacy of the White Tiger
	126309, -- Still Water
	24604, -- Furious Howl
	90309, -- Terrifying Roar
	126373, -- Fearless Roar
	160052, -- Strength of the Pack
	90363, -- Embrace of the Shale Spider
	160200, -- Lone Wolf: Ferocity of the Raptor
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Haste'] = {
	113742, 
	55610, 
	49868, 
	116956, 
	160003, 
	135678, 
	160074, 
	160203,
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Multistrike'] = {
	166916, -- Windflurry
	49868,  -- Mind Quickening
	113742,  -- Swiftblade's Cunning
	109773,  -- Dark Intent
	159733, -- Baleful Gaze
	54644,  -- Frost Breath
	58604, -- Double Bite
	34889, -- Spry Attacks
	160011, -- Agile Reflexes
	57386,  -- Wild Strength
	24844, -- Breath of the Winds
	172968, -- Lone Wolf: Quickness of the Dragonhawk
	50519, -- Sonic Focus
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Versatility'] = {
	55610, -- Unholy Aura
	1126,  -- Mark of the Wild
	167187,  -- Sanctity Aura
	167188, -- Inspiring Presence
	159735, -- Tenacity
	35290,  -- Indomitable
	160045,  -- Defensive Quills
	50518, -- Chitinous Armor
	57386, -- Wild Strength
	160077,  -- Strength of the Earth
	172967, -- Long World: Versatility of the Ravager
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Spell Power'] = {
	109773, -- Dark Intent
	1459,  -- Arcane Brilliance
	61316,  -- Dalarn Brilliance
	126309, -- Still Water
	90364, -- Qiraji Fortitiude
	160205, -- Lone Wolf: Wisdom of the Serpent
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Attack Power'] = {
	6673, 
	57330, 
	19506,
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Stamina'] = {
	469, --Commanding Shout
	21562, -- Power Word: Fortitude
	90364, -- Qiraji Fortitude
	166928, -- Blood Pact
	160014,  -- Sturdiness
	160003, -- Savage Vigor
	160199, -- Lone Wolf: Fortitude of the Bear
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Food TIME'] = {
	160883, 
	160889, 
	160894, 
	160898, 
	160901, 
	160903, 
	160846, 
	160506, 
	160869, 
	174303, 
	160872, 
	174304, 
	160879, 
	174305, 
	160880, 
	174306, 
	160881,
	174307,
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Flask TIME'] = {
	156064, -- Greater Draenic Agility Flask
	156079, -- Greater Draenic Intellect Flask
	156084, -- Greater Draenic Stamina Flask
	156080, -- Greater Draenic Strength Flask
	156073, -- Draenic Agility Flask
	156070, -- Draenic Intellect Flask
	156077, -- Draenic Stamina Flask
	156071, -- Draenic Strength Flask
}}
bdCore.auras.watch[#bdCore.auras.watch+1] = {['Rune TIME'] = {
	175457, -- Focus Augment Rune
	175439, -- Stout Augment Rune
	175456, -- Hyper Augment Rune
}}

bdCore.auras.watched = {}
for k, v in pairs(bdCore.auras.watch) do
	table.insert(bdCore.auras.watched, v)
end

--]]

bdCore.auras.raid = {
	----------------------------------------------------
	-- Highmaul
	----------------------------------------------------
	-- Kargath
	["Vile Breath"] = true,
	["Impale"] = true,
	["Berserker Rush"] = true,
	["On the Hunt"] = true,
	["Chain Hurl"] = true,
	["Iron Bomb"] = true,
	
	-- Butcher
	["The Tenderizer"] = true,
	["Gushing Wounds"] = true,
	
	-- Tectus
	["Crystalline Barrage"] = true,
	["Gift of Earth"] = true,
	
	-- Brackspore
	["Necrotic Breath"] = true,
	["Decay"] = true,
	["Infesting Spores"] = true,
	
	-- Twins
	["Blaze"] = true,
	["Enfeebling Roar"] = true,
	["Injured"] = true,
	
	-- Koragh
	["Caustic Energy"] = true,
	["Suppression Field"] = true,
	["Expel Magic: Arcane"] = true,
	["Expel Magic: Shadow"] = true,
	["Expel Magic: Fire"] = true,
	["Expel Magic: Frost"] = true,
	
	-- Margok
	["Mark of Chaos"] = true,
	["Crush Armor"] = true,
	["Fixate"] = true,
	["Infinite Darkness"] = true,
	["Gaze of the Abyss"] = true,
	["Destructive Resonance"] = true,
	["Force Nova: Displacement"] = true,
	["Force Nova: Fortification"] = true,
	["Force Nova: Replication"] = true,
	["Branded: Displacement"] = true,
	["Branded: Fortification"] = true,
	["Branded: Replication"] = true,
	
	----------------------------------------------------
	-- Blackrock Foundry
	----------------------------------------------------
	
	-- Gruul
	["Inferno Slice"] = true,
	["Overwhelming Blows"] = true,
	["Petrify"] = true,
	["Cave In"] = true,
	
	-- Oregorger
	["Acid Maw"] = true,
	["Acid Torrent"] = true,
	["Retched Blackrock"] = true,
	
	-- Beastlord
	["Pinned Down"] = true,
	["Rend and Tear"] = true,
	["Seared Flesh"] = true,
	["Crush Armor"] = true,
	["Conflagration"] = true,

	-- Flamebender
	["Charring Breath"] = true,
	["Fixate"] = true,
	["Molten Torrent"] = true,
	["Rising Flames"] = true,
	["Singe"] = true,
	["Lava Slash"] = true,
	["Blazing Radiance"] = true,

	-- Hanz/Franz
	["Shattered Vertebrae"] = true,
	["Disrupting Roar"] = true,
	["Aftershock"] = true,
	
	-- Operator Thogar
	["Enkindle"] = true,
	["Prototype Pulse Grenade"] = true,
	["Serrated Slash"] = true,
	["Delayed Siege Bomb"] = true,
	["Burning"] = true,
	
	-- Blast Furance
	["Fixate"] = true,
	["Bomb"] = true,
	["Tempered"] = true,
	["Heat"] = true,
	["Rupture"] = true,
	["Slag Pool"] = true,
	["Melt"] = true,
	["Rupture"] = true,
	
	-- Kromog
	["Warped Armor"] = true,
	["Thundering Blows"] = true,
	
	-- Iron Maidens
	["Blood Ritual"] = true,
	["Dominator Blast"] = true,
	["Penetrating Shot"] = true,
	--["Fixate"] = true,
	["Dark Hunt"] = true,
	["Convulsive Shadows"] = true,
	["Bloodsoaked Heartseeker"] = true,
	
	-- Blackhand
	["Burned"] = true,
	["Slagged"] = true,
	["Marked for Death"] = true,
	["Impaled"] = true,
	["Fixate"] = true,
	["Slag Bombs"] = true,
	["Incendiary Shot"] = true,
	["Broken Bones"] = true,
	
	
	["Rending Cleave"] = true,
	
	----------------------------------------------------
	-- Hellfire Citadel
	----------------------------------------------------
	-- Assault
	['Slam'] = true,
	['Howling Axe'] = true,
	['Conducted Shock Pulse'] = true,
	
	-- Iron Reaver
	["Unstable Orb"] = true,
	["Immolation"] = true,
	["Artillery"] = true,
	
	-- Killrog deadeye
	['Heart Seeker'] = true,
	['Shredded Armor'] = true,
	
	-- Gorefiend
	['Doom Well'] = true,
	['Hunger for Life'] = true,
	['Shadow of Death'] = true,
	['Pool of Souls'] = true,
	["Gorefiend's Corruption"] = true,
	
	
	--Council
	['Mark of the Necromancer'] = true,
	['Bloodboil'] = true,
	['Fel Rage'] = true,
	
	-- Kormrok
	["Fiery Burst"] = true,
	["Crush"] = true,
	["Foul Pool"] = true,
	
	-- Fel Lord Zakuun
	['Latent Energy'] = true,
	['Seed of Destruction'] = true,
	['Befouled'] = true,
	
	-- Xhul'horac
	['Chains of Fel'] = true,
	['Void Strike'] = true,
	['Fel Strike'] = true,
	['Feltouched'] = true,
	['Voidtouched'] = true,
	['Ablaze'] = true,
	['Fel Surge'] = true,
	['Void Surge'] = true,
	['Empowered Chains of Fel'] = true,
	
	-- Socrethar
	['Shattered Defenses'] = true,
	['Shadow Word: Agony'] = true,
	["Gift of the Man'ari"] = true,
	
	-- Iskar
	['Phantasmal Corruption'] = true,
	['Phantasmal Wounds'] = true,
	['Phantasmal Winds'] = true,
	['Fel Bomb'] = true,
	['Radiance of Anzu'] = true,
	['Fel Beam Fixate'] = true,
	['Eye of Anzu'] = true,
	['Fel Fire'] = true,
	
	
	-- Tyrant Tumblr
	['Touch of Harm'] = true,
	['Edict of Condemnation'] = true,
	['Seal of Decay'] = true,
	['Font of Corruption'] = true,
	
	-- Mannoroth
	['Mark of Doom'] = true,
	['Shadowforce'] = true,
	["Wrath of Gul'dan"] = true,
	["Mannoroth's Gaze"] = true,
	["Empowered Mannoroth's Gaze"] = true,
	["Empowered Massive Blast"] = true,
	["Blood of Mannoroth"] = true,
	["Curse of the Legion"] = true,
	["Gripping Shadows"] = true,
	["Doom Spike"] = true,
	
	-- Archimonde
	['Doomfire'] = true, -- Heal
	['Doomfire Fixate'] = true, -- Run
	['Shackled Torment'] = true, -- p2 shackles, keep them up
	['Shadow Blast'] = true, -- Tanks
	['Devour Life'] = true,  -- Healing debuff in heroic
	['Source of Chaos'] = true, -- Tanks in p3
	['Void Star Fixate'] = true, -- void star in p3
	['Shadowfel Burst'] = true, -- p1 knock in the air
	['Touch of the Legion'] = true, -- p3 knockback thing
	
	
	-- Trash
	['Cheap Shot'] = true,
	['Ambush'] = true,
	['Fel Blaze'] = true,
	['Fel Fury'] = true,
	['Devouring Spirit'] = true,
	
	
	----------------------------------------------------
	-- Emerald Nightmare
	----------------------------------------------------
	-- Nythendra
	['Infested Ground'] = true,
	['Volatile Rot'] = true,
	['Rot'] = true,
	['Burst of Corruption'] = true,
	['Infested Breath'] = true,
	
	-- Illgynoth
	['Spew Corruption'] = true,
	['Eye of Fate'] = true,
	['Cursed Blood'] = true,
	['Death Blossom'] = true,
	['Dispersed Spores'] = true,
	['Touch of Corruption'] = true,
	
	-- Renferal
	['Web of Pain'] = true,
	['Necrotic Venom'] = true,
	['Dripping Fangs'] = true,
	['Raking Talons'] = true,
	['Twisting Shadows'] = true,
	['Web of Pain'] = true,
	['Tangled Webs'] = true,
	
	-- Ursoc
	['Focused Gaze'] = true,
	['Overwhelm'] = true,
	['Rend Flesh'] = true,
	
	-- Dragons
	['Nightmare Bloom'] = true,
	['Slumbering Nightmare'] = true,
	['Defiled Vines'] = true,
	['Sleeping Fog'] = true,
	['Shadow Burst'] = true,
	
	-- Cenarius
	['Nightmare Javelin'] = true,
	['Scorned Touch'] = true,
	['Spear of Nightmares'] = true,
	['Nightmare Brambles'] = true,
	
	-- Xavius
	['Dream Simulacrum'] = true,
	['Blackening Soul'] = true,	
	['Darkening Soul'] = true,	
	['Tainted Discharge'] = true,	
	['Corruption: Decent into Madness'] = true,	
	['Bonds of Terror'] = true,	
	['Tormenting Fixation'] = true,	
	
	-- trash
	['Befoulment'] = true,
	
	----------------------------------------------------
	-- Trial of Valor
	----------------------------------------------------
	-- Odyn
	['Shield of Light'] = true,
	['Arcing Storm'] = true,
	['Expel Light'] = true,
	
	-- Guarm
	['Frost Lick'] = true,
	['Flame Lick'] = true,
	['Shadow Lick'] = true,
	
	['Flaming Volatile Foam'] = true,
	['Briney Volatile Foam'] = true,
	['Shadowy Volatile Foam'] = true,
	
	-- Helya
	['Orb of Corruption'] = true,
	['Orb of Corrosion'] = true,
	['Taint of the Sea'] = true,
	['Fetid Rot'] = true,
	['Corrupted Axiom'] = true,
	
	-- trash
	['Unholy Reckoning'] = true,
	
	----------------------------------------------------
	-- Nighthold
	----------------------------------------------------
	-- Skorpyron
	['Energy Surge'] = true,
	['Broken Shard'] = true,
	['Focused Blast'] = true,
	
	-- Chromatic Anomaly
	['Time Bomb'] = true,
	['Temporal Charge'] = true,
	['Time Release'] = true,
	
	-- Trilliax
	['Arcing Bonds'] = true,
	['Sterilize'] = true,
	['Annihilation'] = true,
	
	-- Aluriel
	["Frostbitten"] = true,
	["Annihilated"] = true,
	["Searing Brand"] = true,
	["Entombed in Ice"] = true,
	["Mark of Frost"] = true,
	
	-- Tichondrius
	['Carrion Plague'] = true,
	['Feast of Blood'] = true,
	['Essence of Night'] = true,
	
	-- Krosus
	['Orb of Destruction'] = true,
	['Searing Brand'] = true,
	
	-- Botanist
	['Parasitic Fixate'] = true,
	['Parasitic Fetter'] = true,
	['Toxic Spores'] = true,
	['Call of Night'] = true,
	
	-- Augor
	['Icy Ejection'] = true,
	['Chilled'] = true,
	['Voidburst'] = true,
	['Gravitational Pull'] = true,
	['Witness the Void'] = true,
	['Absolute Zero'] = true,
	['Felflame'] = true,
	
	-- Elisande
	['Ablation'] = true,
	['Arcanetic Ring'] = true,
	['Spanning Singularity'] = true,
	['Delphuric Beam'] = true,
	['Permeliative Torment'] = true,
	
	-- Gul'dan
	['Drain'] = true,
	['Fel Efflux'] = true,
	['Soul Sever'] = true,
	['Chaos Seed'] = true,
	['Bonds of Fel'] = true,
	['Soul Siphon'] = true,
	['Flames of Sargeras'] = true,
	['Soul Corrosion'] = true,
	["Eye of Gul'dan"] = true,
	["Empowered Eye of Gul'dan"] = true,
	["Empowered Bonds of Fel"] = true,
	["Bonds of Fel"] = true,
	["Parasitic Wound"] = true,
	["Chaos Seed"] = true,
	["Severed Soul"] = true,
	["Severed"] = true,
	["Time Stop"] = true,
	["Scattering Field"] = true,
	["Shadowy Gaze"] = true,
	
	-- Trash
	['Arcanic Release'] = true,
	['Necrotic Strike'] = true,
	['Surpress'] = true,
	['Sanguine Ichor'] = true,
	['Thunderstrike'] = true,
	['Will of the Legion'] = true,
	
	
	----------------------------------------------------
	-- Tomb of Sargeras
	----------------------------------------------------
	-- Gorth
	['Melted Armor'] = true,
	['Burning Armor'] = true,
	['Crashing Comet'] = true,
	['Fel Pool'] = true,
	['Shattering Star'] = true,
	
	-- Demonic Inquisition
	['Suffocating Dark'] = true,
	['Calcified Quills'] = true,
	['Unbearable Torment'] = true,
	
	-- Harjatan
	['Jagged Abrasion'] = true,
	['Aqueous Burst'] = true,
	['Drenching Waters'] = true,
	['Driven Assault'] = true,
	
	-- Sisters of the Moon
	['Moon Burn'] = true,
	['Twilight Volley'] = true,
	['Twilight Glaive'] = true,
	['Incorporeal Shot'] = true,
	
	-- Mistress Sassz'ine
	['Consuming Hunger'] = true,
	['Delicious Bufferfish'] = true,
	['Slicing Tornado'] = true,
	['Hydra Shot'] = true,
	['Slippery'] = true,
	
	-- Desolate Host
	["Soul Bind"] = true,
	["Spirit Chains"] = true,
	["Soul Rot"] = true,
	["Spear of Anguish"] = true,
	["Shattering Scream"] = true,
	
	-- Maiden of Vigilance
	['Unstable Soul'] = true,
	
	-- Fallen Avatar
	['Tainted Essence'] = true,
	['Black Winds'] = true,
	['Dark Mark'] = true,
	
	-- Kil'jaedan
	['Felclaws'] = true,
	['Shadow Reflection: Erupting'] = true,
	['Shadow Reflection: Wailing'] = true,
	['Shadow Reflection: Hopeless'] = true,
	['Armageddon Rain'] = true,
	['Lingering Eruption'] = true,
	['Lingering Wail'] = true,
	['Soul Anguish'] = true,
}

bdCore.auras.whitelist = {
	-- Warriors
	["Die by the Sword"] = true,
	["Shield Wall"] = true,
	["Demoralizing Shout"] = true,
	--["Enraged Regeneration"] = true,
	--["Last Stand"] = true,
	["Safeguard"] = true,
	["Vigilance"] = true,
	["Shockwave"] = true,
	
	-- Druids
	["Barkskin"] = true,
	["Survival Instincts"] = true,
	["Ironbark"] = true,
	["Bristling Fur"] = true,
	["Cyclone"] = true,
	["Entangling Roots"] = true,
	["Rapid Innervation"] = true,
	["Mark of Ursol"] = true,
	["Ironfur"] = true,
	["Frenzied Regeneration"] = true,
	["Rage of the Sleeper"] = true,
	
	-- Shamans
	["Shamanistic Rage"] = true,
	["Astral Shift"] = true,
	["Stone Bulwark Totem"] = true,
	["Hex"] = true,
	["Reincarnation"] = true,
	
	-- Death Knights
	["Icebound Fortitude"] = true,
	["Anti-Magic Shell"] = true,
	["Anti-Magic Zone"] = true,
	["Vampiric Blood"] = true,
	["Rune Tap"] = true,
	["Strangulate"] = true,
	
	-- Rogues
	["Feint"] = true,
	["Cloak of Shadows"] = true,
	["Riposte"] = true,
	["Smoke Bomb"] = true,
	["Between the Eyes"] = true,
	["Sap"] = true,
	["Evasion"] = true,
	["Crimson Vial"] = true,
	
	-- Mages
	["Ice Block"] = true,
	["Temporal Shield"] = true,
	["Cauterize"] = true,
	["Greater Invisibility"] = true,
	["Amplify Magic"] = true,
	["Evanesce"] = true,
	["Polymorph"] = true,
	["Polymorph: Fish"] = true,
	
	-- Warlocks
	["Dark Bargain"] = true,
	["Unending Resolve"] = true,
	
	-- Paladins
	["Divine Shield"] = true,
	["Divine Protection"] = true,
	["Blessing of Freedom"] = true,
	["Blessing of Sacrifice"] = true,
	["Ardent Defender"] = true,
	["Guardian of Ancient Kings"] = true,
	["Forbearance"] = true,
	["Hammer of Justice"] = true,
	
	
	-- Monks
	["Fortifying Brew"] = true,
	["Zen Meditation"] = true,
	["Diffuse Magic"] = true,
	["Dampen Harm"] = true,
	["Touch of Karma"] = true,
	["Paralyze"] = true,
	
	-- Hunters
	["Aspect of the Turtle"] = true,
	["Roar of Sacrifice"] = true,
	
	-- Priests
	["Dispersion"] = true,
	["Spectral Guise"] = true,
	["Pain Suppression"] = true,
	["Fear"] = true,
	["Mind Bomb"] = true,
	["Surrender Soul"] = true,
	["Guardian Spirit"] = true,
	
	-- Demon hunters
	['Blur'] = true,
	['Demon Spikes'] = true,
	['Metamorphosis'] = true,
	['Empower Wards'] = true,
	
	-- all palyers
	['Draenic Channeled Mana Potion'] = true,
	['Leytorrent Potion'] = true,
	['Sanguine Ichor'] = true,
}
bdCore.auras.blacklist = {
	-- paladins
	["Unyielding Faith"] = true,
	["Glyph of Templar's Verdict"] = true,
	["Beacon's Tribute"] = true,
	
	-- warlocks
	["Soul Leech"] = true,
	["Empowered Grasp"] = true,
	["Twilight Ward"] = true,
	["Shadow Trance"] = true,
	["Dark Refund"] = true,
	
	-- warriors
	["Bloody Healing"] = true,
	["Flurry"] = true,
	["Victorious"] = true,
	["Deep Wounds"] = true,
	["Mortal Wounds"] = true,
	["Enrage"] = true,
	["Blood Craze"] = true,
	["Ultimatum"] = true,
	["Sword and Board"] = true,
	
	-- Death Knights
	["Purgatory"] = true,
	
	-- misc
	["Honorless Target"] = true,
	["Spirit Heal"] = true,
	["Capacitance"] = true,
	
	["Sated"] = true,
	["Exhaustion"] = true,
	["Insanity"] = true,
	["Temporal Displacement"] = true,
	["Void-Touched"] = true,
	["Awesome!"] = true,
	["Griefer"] = true,
	["Vivianne Defeated"] = true,
	["Recently Mass Resurrected"] = true,
	
	
	-- Priests
	["Weakened Soul"] = true,
	
	-- Paladins
	["Beacon's Tribute"] = true
}

bdCore.auras['Personal Auras'] = {
	preist = {
		["Weakened Soul"] = true,
	},
	paladin = {
		["Blessing of Sacrifice"] = true,		
		["Blessing of Protection"] = true,		
	},
	deathknight = {
		
	},
	rogue = {
		
	},
	shaman = {
		
	},
	warlock = {
		
	},
	mage = {
		
	},
	monk = {
		
	},
	hunter = {
		
	},
	druid = {
		
	},
	warrior = {
		
	},
	demonhunter = {
		
	},
}

bdCore.auras.mine = {
	["Lifebloom"] = true,
	["Rejuvenation"] = true,
	["Regrowth"] = true,
	["Rejuvenation (Germination)"] = true,
	
	["Eternal Flame"] = true,
	["Sacred Shield"] = true,
	["Beacon of Light"] = true,
	["Beacon of Faith"] = true,
	["Weakened Soul"] = true,
	
	-- Paladin
	["Beacon of Virtue"] = true,
	
	-- Priest
	["Renew"] = true,
	["Prayer of Mending"] = true,
}