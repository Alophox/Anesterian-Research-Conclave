
return {

	-- 🟦 DEFINITIONS
	unitName                    = "arc_battery-1",
	unitDisplayName             = "Battery",
	unitTooltip                 = "",
	unitBlurb                   = "",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "",
	picture                     = "arc_battery-1.png",

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = "",
		description                 =	"",
		weaponInfo                  = {},
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = .909, -- 0.035714
	mainMesh                    = "Battery/Battery-1",
	materials                   = { "arc_hull", "arc_teamGlow", "arc_teamColour", "arc_hull_dark" },
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = 1,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 1012051,
		factionID    = 101,
		macroType    = "AUTO",
		cost_matter  = 5, -- Platforms are not buildable, so it does not require a cost.
		cost_energy  = 5,
		cost_supply  = 0,
		cost_time    = 10,
		techRequired = 0
	},

	-- 🟦 PARTS
	parts = {
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "LIGHT",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = 600,
		health_regen_per_second = healthStats.regen.S,
		max_regen_frac = healthStats.proportionRegenMax,

		armour = 5,
		vulnerability_max = 0,
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
		explosionSizeOveride = 0,			-- Give it a hearty platform saildrive critical BOOM!!!
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
	isCommand = false, -- Allows Platform AIs to be run on this structure.

	-- 🟦 STRUCTURE
	isStructure = true,
	structure = {
		type = "ECONOMY", --NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
		rectangle = {1,1}, 		-- optional, float2: xz dimensions of the influence, facing ^
		--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		-- matrixDimensions = {3,3},
		-- matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
		-- 	0, 1, 0,
		-- 	1, 1, 1,
		-- 	0, 1, 0,
		--  },
	},

	-- 🟨 RESOURCE GENERATOR AND STORAGE CONFIGURATION
	isGenerator        = false,
	resourceGeneration = {
		matter = 0, 	-- float: Matter generation per second
		energy = 0, 	-- float: Energy generation per second
		phase  = 0 	-- float: Phase generation per second
	},

	isCapacitor        = true,
	resourceCapacity           = {
		logistics = 0, 	-- int: Logistics
		matter    = 0, 	-- int: Max stored matter
		energy    = 50, 	-- int: Max stored energy
		phase     = 0 		-- int: Max stored phase energy
	},

	-- 🟪 STATUS EFFECT EMITTER (AEGIS SHIELD)
	isStatusEffecter = false,
	isAegisEmitter = false,
	-- aegisEmitter = {
	-- 	secondsPerPulse = 5, 	-- float: strength will be applied to allies in range as Aegis Shielding.
	-- 	radius          = 10, 	-- float: Area of effect. The center of a unit must be within this range to be affected.
	-- 	strength        = 500 	-- float: Aegis strength applied per pulse.
	-- }
}
