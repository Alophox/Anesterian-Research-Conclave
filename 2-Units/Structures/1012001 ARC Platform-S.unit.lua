scaleConst = 3.8;
return {

	-- 🟦 DEFINITIONS
	unitName                    = "arc_platform_s",
	unitDisplayName             = "Core-Mini",
	unitTooltip                 = "",
	unitBlurb                   = "Base command center.",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "",
	picture                     = "arc_platform_s.png",

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = "",
		description                 =	"I feel like I've seen those structures surrounding the hub before...",
		weaponInfo                  = {},
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = scaleConst,
	mainMesh                    = "Core/Core-mini",
	materials                   = { "arc_hull", "arc_teamGlow", "arc_teamColour", "arc_hull_dark" },
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = .536,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 1012001,
		factionID    = 101,
		macroType    = "AUTO",
		cost_matter  = 0, -- Platforms are not buildable, so it does not require a cost.
		cost_energy  = 0,
		cost_supply  = 0,
		cost_time    = 0,
		techRequired = 0
	},

	-- 🟦 PARTS
	parts = {
		{
			name      = "Drone Bay N",
			position  = { 0, 8*.1/scaleConst, .75*.1/scaleConst },
			rotation  = { -90, 00, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 1015600, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180,
					right = 180,
					up = 90,
					down = 90
				},
			},
		},
		{
			name      = "Drone Bay E",
			position  = { .75*.1/scaleConst, 8*.1/scaleConst, 0 },
			rotation  = { -90, 90, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 1015600, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180,
					right = 180,
					up = 90,
					down = 90
				},
			},
		},
		{
			name      = "Drone Bay S",
			position  = { 0, 8*.1/scaleConst, -.75*.1/scaleConst },
			rotation  = { -90, 180, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 1015600, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180,
					right = 180,
					up = 90,
					down = 90
				},
			},
		},
		{
			name      = "Drone Bay W",
			position  = { -.75*.1/scaleConst, 8*.1/scaleConst, 0 },
			rotation  = { -90, 270, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 1015600, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180,
					right = 180,
					up = 90,
					down = 90
				},
			},
		},
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "CAPITAL",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = 10000,
		health_regen_per_second = 10,
		max_regen_frac = 1,

		armour = 20,
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
		explosionSizeOveride = 10,			-- Give it a hearty platform saildrive critical BOOM!!!
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
		type = "NONE", --NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		matrixDimensions = {4,4},
		matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
			0, 1, 1, 0,
			1, 1, 1, 1,
			1, 1, 1, 1,
			0, 1, 1, 0,
		 },
	},

	isInfluencer = true,
	influence = {
		strength = {20, 1},
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		ring = {0,9},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		--matrixDimensions = {5,5},
		--matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
		--	0, 1, 1, 1, 0,
		--	1, 1, 1, 1, 1,
		--	1, 1, 1, 1, 1,
		--	1, 1, 1, 1, 1,
		--	0, 1, 1, 1, 0,
		-- },
	},

	-- 🟨 RESOURCE GENERATOR AND STORAGE CONFIGURATION
	isGenerator        = true,
	resourceGeneration = {
		matter = 1.5, 	-- float: Matter generation per second
		energy = 2, 	-- float: Energy generation per second
		phase  = 0 	-- float: Phase generation per second
	},

	isCapacitor        = true,
	resourceCapacity           = {
		logistics = 40, 	-- int: Logistics
		matter    = 300, 	-- int: Max stored matter
		energy    = 150, 	-- int: Max stored energy
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
