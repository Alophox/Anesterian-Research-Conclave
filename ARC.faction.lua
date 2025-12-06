-- muhahaahaha, these are like global variables >:D

--highest range common weapons(heavy railguns) are around 30 range, and longest PD are 10

--baseRange is multiplied by an additional 50% for medium and 100% for large for actual range
--firing range will be 1/4 of that
--base CD is the average seconds/shot- heavier weaponry will usually fire in bursts, so their cycle time will be correspondingly longer
--base heat and damage are the totals; burst weapons will add up to these values(multi-shot lasers, multi-instance plasma)
weaponStats = {
	damageMult = {
		D = .5,
		S = 1,
		M = 2.5,
		L = 6,
		X = 17,
		T = 93,
	},
	rangeMult = {
		D = .5,
		S = 1,
		M = 1.5,
		L = 2,
		X = 3,
		T = 5,
	},
	CDMod = {
		D = 0, -- -.7
		S = 0,
		M = 0, --.7
		L = 0, --1.35
		X = 0, --4.35
		T = 0 --14.35
	},
	CDMult = {
		D = .85,
		S = 1,
		M = 1.15, --.7
		L = 1.3, --1.35
		X = 2, --4.35
		T = 3.35 --14.35
	},
	baseTracking = 360, --governs turn rate (degrees/second)
	fireRangeMult=1,
	overShootMult=1.1,
	accuracySpread=45, --0% accuracy would be this; 100% is 0
	SFXIntensity={
		D=.1,
		S=.2,
		M=.4,
		L=.8,
		X=1.6,
		T=3.2,
	},
}

weaponStats.railgun = {
	baseRange	= 11,
	baseDMG		= 25,
	baseHeat	= 12.5,
	instances	= 1,
	baseCD		= 2.9,
	secondsPerShot=.02,
	trackingMult = {
		D = .7,
		S = .5,
		M = .3,
		L = .05
	},
	shotsPerBurst = {
		D = 1,
		S = 1,
		M = 2,
		L = 3
	},
	velocity	= 15,
	accuracy	= .9,
	sfxID		= 20,
}

weaponStats.cannon = {
	baseRange	= 7.5,
	baseDMG		= 50,
	baseHeat	= 5,
	baseAOE		= .5,
	instances	= 1,
	baseCD		= 2,
	secondsPerShot=.02,
	trackingMult = {
		S = .4,
		M = .2,
		L = .05
	},
	shotsPerBurst = {
		S = 1,
		M = 2,
		L = 3
	},
	velocity	= 9,
	accuracy	= .9,
	impulse		= .01,
	sfxID		= 15,
}

weaponStats.laser = {
	baseRange	= 10,
	baseDMG		= 40, --0 makes weapons not hit anything
	baseHeat	= 4,
	piercing 	= 2,
	instances	= 1,
	baseCD		= 4.25,
	baseDuration= 3,
	secondsPerShot=.1, --unlike the other weapons, this is the internal burst per laser- each barrel won't have any delay in firing
	trackingMult = {
		D = 1,
		S = .8,
		M = .4,
		L = .15,
		X = .05,
		T = 0
	},
	shotsPerBurst = {
		D = 1,
		S = 1,
		M = 2,
		L = 3,
		X = 1,
		T = 1
	},
	accuracy	= 1,
	sfxID		= 14,
}

weaponStats.disruptor = {
	baseRange	= 7.5,
	baseDMG		= 20,
	baseHeat	= 0,
	instances	= 1,
	baseCD		= 2.3,
	secondsPerShot=.02,
	trackingMult = {
		S = .6,
		M = .35,
		L = .05
	},
	shotsPerBurst = {
		S = 1,
		M = 2,
		L = 3
	},
	velocity	= 15,
	accuracy	= 1,
	sfxID		= 24,
}

weaponStats.lightning = {
	baseRange	= 7.5,
	baseDMG		= 45,
	baseHeat	= 0,
	baseShred	= 0,
	instances	= 1,
	baseCD		= 5.75,
	secondsPerShot=.1,
	trackingMult = {
		D = 1,
		S = .8,
		M = .35,
		L = .1,
		X = 0,
		T = 0
	},
	simultaniousShots = {
		D = 1,
		S = 1,
		M = 3,
		L = 5,
		X = 7,
		T = 9
	},
	shotsPerBurst = {
		D = 3,
		S = 5,
		M = 15,
		L = 25,
		X = 35,
		T = 45
	},
	accuracy	= 1,
	sfxID		= 16,
}

-- missiles have two turrets per 'slot', so damage is half
weaponStats.missile = {
	baseRange	= 11,
	baseRetargetRange = 11.5,
	baseCloakRange = 2,
	baseDMG		= 20,
	baseHeat	= 0,
	baseAOE		= .75,
	baseShred	= .5,
	instances	= {
		S = 1,
		M = 2,
		L = 3,
	},
	baseCD		= 8.5,
	secondsPerShot=.1,
	trackingMult = {
		S = .25*40,
		M = .15*40,
		L = .05*40
	},
	shotsPerBurst = {
		S = 1,
		M = 1,
		L = 1
	},
	velocity	= 4,
	accuracy	= 1,
	impulse		=-.1,
	sfxID		= 17,
}

--1 hangar, for vaalk, is approximately one L turret worth of points, and comes with a capacity of 6 units every 30s
--hangars have two hangars per 'slot'(aka one per M turret), so capacity is half, and respawn doubled
weaponStats.hangar = {
	baseRange	= 20,
	instances	= 2, --4; drone capacity
	baseCD		= 10, --10
	secondsPerShot= .5,
	trackingMult= 1,
	shotsPerBurst= 2, --how many drones launched at once
	velocity	= .7,
	accuracy	= 1,
}

healthStats = {
	regen = {
		L = 1.5,
		LM = 2,
		M = 3,
		MH = 5,
		H = 7.5,
		HC = 10,
		C = 15,
		T = 150,
	},
	proportionRegenMax = .25,
	baseHealth = {
		L = 100,
		LM = 200,
		M = 500,
		MH = 700,
		H = 2100,
		HC = 3000,
		C = 15000,
		T = 150000,
	},
	healthMult = {
		P = 1,
		B = 1.5,
		M = .9,
		G = 1,
		A = .8,
		C = .7,
		S = .8,
	},
	baseArmor = { -- Lights ~5, Mediums ~10, Heavies ~20, Capitals ~50
		L = 4,
		LM = 7,
		M = 10,
		MH = 15,
		H = 20,
		HC = 35,
		C = 50,
		T = 100,
	},
	armorMult = {
		P = 1,
		B = 2,
		M = .6,
		G = 1.2,
		A = .4,
		C = .2,
		S = .4,
	},
}

return {
	factionName = "Anesterian Research Conclave",   -- Display name
	factionNameShorthand = "ARC",
	description = "Prioritizing modularity and efficiency, both things not useful within the Spance.",
	emblem = "ARC Icon",        -- PNG image used to represent the faction.
	id = 101,                     -- Unique integer faction ID, has to be greater than 99 (ATS reserve)

	-- Skirmish setup
	skirmish = true,                     -- Should appear in skirmish mode
	skirmish_loadout = { 
		1011000, --dronn (size 0)
		1011100, 1011101, 1011102, --light size 1
		1011200, 1011201, 1011202, --light size 2
		1011300, 1011301, 1011302, --medium size 3
		1011400, 1011401, 1011402, --medium size 4
		1011500, 1011501, 1011502, --heavy size 5
		1011600, 1011601, 1011602, --heavy size 6
		1011700, --capital size 7
		------------
		1012003, -- utility
		1012011, 1012012, 1012013, --yards
		1012020, 1012021, 1012022, 1012029, --turrets
		1017001, 1017003, 1017004, 1017005, --turrets
		1017011, 1017013, 1017014, 1017015, --turrets
		1017021, 1017023, 1017024, 1017025, --turrets
		1012050, --logistics
		1012051,
		1012030, 1012031, 1012040, --economy
	}, -- int array: A list of unit TypeIDs that the player is allowed to build, both structures and ships.
	skirmish_platforms = { 1012000 },      -- Initial platforms/stationary structures
	skirmish_ais = { 1009000 },             --This doesn't work yet, please wait. Luke 2025/04/18
	
	-- Content catalog (for editor and databank)
	ships = { 
		1011000, --dronn (size 0)
		1011100, 1011101, 1011102, --light size 1
		1011200, 1011201, 1011202, --light size 2
		1011300, 1011301, 1011302, --medium size 3
		1011400, 1011401, 1011402, --medium size 4
		1011500, 1011501, 1011502, --heavy size 5
		1011600, 1011601, 1011602, --heavy size 6
		1011700, --capital size 7
		--1017000, --experimental
	},               -- Ships
	structures = { 
		1012000, 1012001, 1012002, --platforms
		1012003, -- utility
		1012011, 1012012, 1012013, --yards
		-- 1012020, 1012021, 1012022, 1012029, --turrets
		1017001, 1017003, 1017004, 1017005, --turrets
		1017011, 1017013, 1017014, 1017015, --turrets
		1017021, 1017023, 1017024, 1017025, --turrets
		1012050, --logistics
		1012051,
		1012030, 1012031, 1012040, --economy
		1013000, 1013001, --environmental

	}, -- Structures
	--munitions = {},                    -- (optional) Bullets, missiles, etc . If you for some reason have munitions that you want to spawn / work when spawned normally.
	environmental = {},                -- Matter asteroids, etc
}
