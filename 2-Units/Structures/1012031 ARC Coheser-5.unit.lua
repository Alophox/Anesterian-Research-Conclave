
return {

	-- 🟦 DEFINITIONS
	unitName                    = "arc_coheser-5",
	unitDisplayName             = "BIG Coheser",
	unitTooltip                 = "",
	unitBlurb                   = "What an awful shape, who designed this?!",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "f",
	picture                     = "arc_coheser-5.png",

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = "",
		description                 =	"Four minuses don't make a plus, no matter what mathemagicians may say!",
		weaponInfo                  = {},
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = 4.8, -- 0.020833
	mainMesh                    = "Coheser/Coheser-5",
	materials                   = { "arc_hull", "arc_teamColour", "arc_teamGlow", "arc_hull_dark" },
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = .172,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 3292031,
		factionID    = 329,
		macroType    = "AUTO",
		cost_matter  = 200,
		cost_energy  = 50,
		cost_supply  = 5,
		cost_time    = 20,
		techRequired = 0
	},

	-- 🟦 PARTS
	parts = {
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "HEAVY",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = (1 - healthStats.proportionRegenMax) * 5000,
		health_regen_per_second = healthStats.regen.H,
		max_regen_frac = 0,
		aegis_regen_per_second = healthStats.aegisRegen.H * healthStats.structAegisRegenMult,
		aegisMaximum = healthStats.proportionRegenMax * 5000,

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
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		matrixDimensions = {5,5},
		matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
			0, 1, 0, 1, 0,
			1, 1, 1, 1, 1,
			0, 1, 1, 1, 0,
			1, 1, 1, 1, 1,
			0, 1, 0, 1, 0,
		 },
	},

	-- 🟨 RESOURCE GENERATOR AND STORAGE CONFIGURATION
	isGenerator        = true,
	resourceGeneration = {
		matter = 2.5, 	-- float: Matter generation per second
		energy = .5, 	-- float: Energy generation per second
		phase  = 0 	-- float: Phase generation per second
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
