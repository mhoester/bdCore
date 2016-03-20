local bdCore, c, f = select(2, ...):unpack()
bdCore.auras = {}
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
	
	-- Players
	['Draenic Channeled Mana Potion'] = true,
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
	
	-- Druids
	["Barkskin"] = true,
	["Survival Instincts"] = true,
	["Ironbark"] = true,
	["Bristling Fur"] = true,
	
	
	-- Shamans
	["Shamanistic Rage"] = true,
	["Astral Shift"] = true,
	["Stone Bulwark Totem"] = true,
	
	-- Death Knights
	["Icebound Fortitude"] = true,
	--["Anti-Magic Shell"] = true,
	["Anti-Magic Zone"] = true,
	["Vampiric Blood"] = true,
	["Rune Tap"] = true,
	
	-- Rogues
	["Feint"] = true,
	["Cloak of Shadows"] = true,
	["Evasion"] = true,
	["Smoke Bomb"] = true,
	
	-- Mages
	["Ice Block"] = true,
	["Temporal Shield"] = true,
	["Cauterize"] = true,
	["Greater Invisibility"] = true,
	["Amplify Magic"] = true,
	["Evanesce"] = true,
	
	-- Warlocks
	["Dark Bargain"] = true,
	["Unending Resolve"] = true,
	
	-- Paladins
	["Divine Shield"] = true,
	["Divine Protection"] = true,
	["Hand of Protection"] = true,
	["Hand of Sacrifice"] = true,
	["Hand of Purity"] = true,
	["Ardent Defender"] = true,
	["Guardian of Ancient Kings"] = true,
	["Forbearance"] = true,
	
	
	-- Monks
	["Fortifying Brew"] = true,
	["Zen Meditation"] = true,
	["Diffuse Magic"] = true,
	["Dampen Harm"] = true,
	["Touch of Karma"] = true,
	
	-- Hunters
	["Deterrence"] = true,
	["Roar of Sacrifice"] = true,
	
	-- Priests
	["Dispersion"] = true,
	["Spectral Guise"] = true,
	["Pain Suppression"] = true,
}
bdCore.auras.blacklist = {
	-- paladins
	["Illuminated Healing"] = true,
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

bdCore.auras.player_class = {
	preist = {
		["Weakened Soul"] = true,
	},
	paladin = {

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

	}
}

bdCore.auras.mine = {
	["Lifebloom"] = true,
	["Rejuvenation"] = true,
	["Regrowth"] = true,
	["Rejuvenation (Germination)"] = true,
	["Prayer of Mending"] = true,
	
	["Eternal Flame"] = true,
	["Sacred Shield"] = true,
	["Beacon of Light"] = true,
	["Beacon of Faith"] = true,
	["Weakened Soul"] = true,
}