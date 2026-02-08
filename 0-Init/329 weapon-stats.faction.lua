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
		X = 15,
		T = 40,
	},
	rangeMult = {
		D = .6667,
		S = 1,
		M = 1.5,
		L = 2,
		X = 2.5,
		T = 3,
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
		M = 1.5, --.7
		L = 2.25, --1.35
		X = 3.375, --4.35
		T = 5.0625 --14.35
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
	baseRange	= 12,
	baseDMG		= 40,
	baseHeat	= 10,
	instances	= 2,
	baseCD		= 2.9,
	secondsPerShot=0,
	trackingMult = {
		D = .7,
		S = .4,
		M = .2,
		L = .05,
		X = .02,
		T = .01,
	},
	shotsPerBurst = {
		D = 1,
		S = 1,
		M = 2,
		L = 3,
		X = 4,
		T = 5,
	},
	velocity	= 15,
	accuracy	= .9,
	sfxID		= 20,
}

weaponStats.cannon = {
	baseRange	= 7.5,
	baseDMG		= 40,
	baseHeat	= 4,
	baseAOE		= .75,
	minAOEMult	= .2,
	instances	= 2,
	baseCD		= 2,
	secondsPerShot=1,
	trackingMult = {
		D = 1,
		S = .5,
		M = .3,
		L = .075,
		X = .03,
		T = .015,
	},
	shotsPerBurst = {
		D = 1,
		S = 1,
		M = 2,
		L = 3,
		X = 4,
		T = 5,
	},
	velocity	= 9,
	accuracy	= .9,
	impulse		= .005,
	sfxID		= 15,
}

weaponStats.laser = {
	baseRange	= 10,
	baseDMG		= 90, --0 makes weapons not hit anything
	baseHeat	= 9,
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
		T = .02
	},
	shotsPerBurst = {
		D = 1,
		S = 1,
		M = 2,
		L = 3,
		X = 4,
		T = 5
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
	baseDMG		= 60,
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
		X = .05,
		T = .02
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
	baseRange	= 13,
	baseRetargetRange = 11.5,
	baseCloakRange = 2,
	baseDMG		= 40,
	baseHeat	= 0,
	baseAOE		= 1,
	baseShred	= .5,
	baseHP		= 4,
	instances	= {
		S = 1,
		M = 2,
		L = 3,
		X = 4,
		T = 5,
	},
	baseCD		= 8.5,
	secondsPerShot=.1,
	trackingMult = {
		S = .25*40,
		M = .15*40,
		L = .05*40,
		X = .02*40,
		T = .01*40,
	},
	shotsPerBurst = {
		S = 1,
		M = 1,
		L = 1,
		X = 1,
		T = 1
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
	baseCD		= 30, --10
	CD = {
		ruby = 15,
		citrine = 25,
	},
	secondsPerShot= .5,
	trackingMult= 1,
	shotsPerBurst= 2, --how many drones launched at once
	velocity	= .7,
	accuracy	= 1,
}

healthStats = {
	regen = {
		D = 0,
		L = 1.5,
		LM = 2,
		M = 3,
		MH = 5,
		H = 7.5,
		HC = 10,
		C = 15,
		T = 150,
	},
	aegisRegen = {
		D = 3,
		L = 6,
		LM = 8,
		M = 12,
		MH = 20,
		H = 30,
		HC = 40,
		C = 60,
		T = 600,
	},
	structAegisRegenMult = 1,
	proportionRegenMax = .25,
	baseHealth = {
		D = 35,
		L = 150,
		LM = 300,
		M = 600,
		MH = 900,
		H = 2500,
		HC = 3100,
		C = 15000,
		T = 150000,
	},
	healthMult = {
		P = 1,
		B = 1.2,
		M = .9,
		G = 1,
		A = .8,
		C = .7,
		S = .7,
	},
	baseArmor = { -- Lights ~5, Mediums ~10, Heavies ~20, Capitals ~50
		D = 1,
		L = 5,
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
		B = 1.2,
		M = .6,
		G = 1.4,
		A = .4,
		C = .3,
		S = .4,
	},
	baseAccel = {
		L = .35,
		LM = .27,
		M = .22,
		MH = .18,
		H = .15,
		HC = .135,
		C = .075,
		T = .05,
	},
	accelMult = {
		P = 1,
		B = 1.1,
		M = .75,
		G = 1.1,
		A = .6,
		C = .6,
		S = .6,
	},
	retreatMult = {
		P = .6,
		B = .75,
		M = .5,
		G = .75,
		A = .4,
		C = .4,
		S = .4,
	},
}