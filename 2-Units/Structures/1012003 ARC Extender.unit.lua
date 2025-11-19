
return {

	-- 🟦 DEFINITIONS
	unitName                    = "arc_extender",
	unitDisplayName             = "Breach Node",
	unitTooltip                 = "",
	unitBlurb                   = "FTL Relay Node",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "x",
	picture                     = "arc_relay.png",

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = "",
		description                 =	"Containing a miniature rift, these extend the effective range of a platform by providing a 0 ping connection.",
		weaponInfo                  = {},
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = 1.8, -- 0.055556
	mainMesh                    = "Extender/Extender-2",
	materials                   = { "arc_hull", "arc_teamGlow", "arc_teamColour", "arc_hull_dark" },
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = .722,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 1012003,
		factionID    = 101,
		macroType    = "AUTO",
		cost_matter  = 40, -- Platforms are not buildable, so it does not require a cost.
		cost_energy  = 80,
		cost_supply  = 0,
		cost_time    = 25,
		techRequired = 0
	},

	-- 🟦 PARTS
	parts = {
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "MEDIUM",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = 1000,
		health_regen_per_second = 20,
		max_regen_frac = 1,

		armour = 10,
		vulnerability_max = 0.2,
		shredMultiplier = 1.0,

		explosionSFX = 0,
		explosionSFXIntensity = 10,		-- Platforms blowing up is very important.

		heatResistancePercentage = 0,
		shredResistancePercentage = 0,
		aegisMaximum = 0,
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
