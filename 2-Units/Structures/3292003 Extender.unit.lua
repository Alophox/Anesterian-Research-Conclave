shipConst = {
	class = "MH",
}
return {

	-- 🟦 DEFINITIONS
	unitName                    = "329-extender",
	unitDisplayName             = "Breach Node",
	unitTooltip                 = "",
	unitBlurb                   = "FTL Relay Node",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "x",
	picture                     = "329-extender.png",

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = ""..
										" - <color=#80ffff>"..(healthStats.aegisRegen[shipConst.class]*healthStats.structAegisRegenMult).." Aegis/s</color>\n"..
										"",
		description                 =	"Containing a miniature rift, these extend the effective range of a platform by providing a 0 ping connection.",
		weaponInfo                  = {},
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = 1.8, -- 0.055556
	mainMesh                    = "329-Extender/Extender-2",
	materials                   = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull_dark" },
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = .722,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 3292003,
		factionID    = 329,
		macroType    = "AUTO",
		cost_matter  = 40, -- Platforms are not buildable, so it does not require a cost.
		cost_energy  = 80,
		cost_supply  = 0,
		cost_time    = 25,
		techRequired = 0
	},

	-- 🟦 PARTS
	parts = {
		{
			name = "Aegis spawner",
			autoModule = {
				moduleTypeID = 3297100,
				reportKillsToParent = false,
				doDamageToEntityOnDeath = true,
				damageToEntityOnDeath = {
					isNondamaging = true, instances = 1, damage = 0, piercing = -9999999999,
					shred = 0, heat = 0, vulnerability = 0, decloak = 0,
					targetingPriorityMultiplier = 0, impulseForce = 0,
				},
			},
		},
		{
			name     = "Aegis",
			mesh    = "329-Extender/Extender-2",
			materials = { "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			aegisVisual = true,
		},
		{
			name     = "Build",
			mesh    = "329-Extender/Extender-2",
			materials = { "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
		{
			name     = "Build",
			mesh    = "329-Extender/Extender-2",
			materials = { "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "MEDIUM",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = functions.floor((1 - healthStats.proportionRegenMax) * 1000),
		health_regen_per_second = healthStats.regen[shipConst.class],
		max_regen_frac = 0,
		aegis_regen_per_second = healthStats.aegisRegen[shipConst.class] * healthStats.structAegisRegenMult,
		aegisMaximum = functions.ceil(healthStats.proportionRegenMax * 1000),

		armour = 10,
		vulnerability_max = 0,
		shredMultiplier = 0,

		explosionSFX = 0,
		explosionSFXIntensity = 10,		-- Platforms blowing up is very important.

		heatResistancePercentage = healthStats.proportionRegenMax,
		shredResistancePercentage = 0,
		isResourceMatter = false,
		isResourceEnergy = false,
		isUncapturable = false,
		ignoreImpulse = false,

		targetingPriorityMultiplier = 1.0,
		untargetableTime = 0,

		doesCloaking = false,
		isCloaked = false,
		cloakFrac = 0,
		cloakTime = 1.0,
		decloakDistance = 0,

		phaseBlockFraction = 0,
		
		lifetime = 0,
		explodeOnTimeout = false,

		explosionType = "EXPLOSION",          	-- EXPLOSION \ EXPLOSION_LOWPOLY \ SHOCKWAVE \ FLASH \ FLAK \ SPARKS (railgun bullet) \ FISHEXPLOSION \ WARP \ NONE \ VOLTJUMP
		explosionVolatility = 1.0,
		explosionSizeOveride = 4,			-- Give it a hearty platform saildrive critical BOOM!!!
		flashSizeOverride = 0,
		forceShockwave = false,
		preventShockwave = false,
		randomiseInAllDirections = false,
		deathUnitSpawnDoNotRandomiseRotation = false,
		deathUnitSpawnTypeID = -1,
		invulnerable = false,
		unkillable = false,
		death_countdown = 0,
		mass = 0,
		densityMult = 1.0,
		tonnage = 0,
		ignoreInstaDeath = false,
		alertPlayerOnDeath = false,
	},

	

	-- 🟦 COMMAND / Platform
	isCommand = true, -- Allows Platform AIs to be run on this structure.

	-- 🟦 STRUCTURE
	isStructure = true,
	structure = {
		type = "EXTENDER", --NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
		rectangle = {2,2}, 		-- optional, float2: xz dimensions of the influence, facing ^
		--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		-- matrixDimensions = {6,6},
		-- matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
		-- 	0, 1, 1, 1, 1, 0,
		-- 	1, 1, 1, 1, 1, 1,
		-- 	1, 1, 1, 1, 1, 1,
		-- 	1, 1, 1, 1, 1, 1,
		-- 	1, 1, 1, 1, 1, 1,
		-- 	0, 1, 1, 1, 1, 0,
		--  },
	},

	isInfluencer = true,
	influence = {
		strength = {20, 1},
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		ring = {0,7},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		--matrixDimensions = {5,5},
		--matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
		--	0, 1, 1, 1, 0,
		--	1, 1, 1, 1, 1,
		--	1, 1, 1, 1, 1,
		--	1, 1, 1, 1, 1,
		--	0, 1, 1, 1, 0,
		-- },
	},
}
