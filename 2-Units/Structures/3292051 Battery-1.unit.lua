
return {

	-- 🟦 DEFINITIONS
	unitName                    = "329-battery-1",
	unitDisplayName             = "Battery",
	unitTooltip                 = "",
	unitBlurb                   = "",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "",
	picture                     = "329-storage-e.png",

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
	scale                       = .91, -- 0.10989
	mainMesh                    = "329-Battery/Battery-1",
	materials                   = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull_dark" },
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = 1,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 3292051,
		factionID    = 329,
		macroType    = "AUTO",
		cost_matter  = 5, -- Platforms are not buildable, so it does not require a cost.
		cost_energy  = 5,
		cost_supply  = 0,
		cost_time    = 10,
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
					isNondamaging = true, instances = 1, damage = 0.00001, piercing = -9999999999,
					shred = 0, heat = 0, vulnerability = 0, decloak = 0,
					targetingPriorityMultiplier = 0, impulseForce = 0,
				},
			},
		},
		{
			name     = "Aegis",
			mesh    = "329-Battery/Battery-1",
			materials = { "329_MT_arc_0_aegis", "329_MT_arc_0_aegis", "329_MT_arc_0_aegis", "329_MT_arc_0_aegis" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			aegisVisual = true,
		},
		{
			name     = "Build",
			mesh    = "329-Battery/Battery-1",
			materials = { "329_MT_arc_0_build", "329_MT_arc_0_build", "329_MT_arc_0_build", "329_MT_arc_0_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
		{
			name     = "Build",
			mesh    = "329-Battery/Battery-1",
			materials = { "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
		{
			name     = "Build",
			mesh    = "329-Battery/Battery-1",
			materials = { "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "LIGHT",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = functions.floor((1 - healthStats.proportionRegenMax) * 600),
		health_regen_per_second = healthStats.regen.L,
		max_regen_frac = 0,
		aegis_regen_per_second = healthStats.aegisRegen.L * healthStats.structAegisRegenMult,
		aegisMaximum = functions.ceil(healthStats.proportionRegenMax * 600),

		armour = 5,
		vulnerability_max = 0,
		shredMultiplier = 0,

		explosionSFX = 0,
		explosionSFXIntensity = 1,		-- Platforms blowing up is very important.

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
