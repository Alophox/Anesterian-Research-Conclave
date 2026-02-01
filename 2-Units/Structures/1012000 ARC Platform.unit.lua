scaleConst = 5.58239;
return {

	-- 🟦 DEFINITIONS
	unitName                    = "arc_platform",
	unitDisplayName             = "Starbase",
	unitTooltip                 = "",
	unitBlurb                   = "Medium Command Platform",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "",
	picture                     = "arc_platform-m.png",

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = "<color=yellow>Tactical:</color>\n"..
										" - Poor defense against Missiles / Drones / Lights\n"..
										" - Produces Matter, Energy, and Logistics\n"..
										" - Breach Communications Suite\n"..
										" - Breach Core\n",
		description                 =	"Powered by a Breach Core, these multipurpose structures are utilized in standard Research and Reconnaissance missions.\n"..
										"\n"..
										"The Starbase was born when it was realized that the Starpost could not hope to power all the equipment necessary to study local systems.\n"..
										"\n"..
										"It was fortunate timing- these were tougher, and early renditions included lasers for asteroid defense; enough so that when a fleet of treasure seekers arrived, chasing rumors of a convoy, they were more than capable of defending against them- at least after it was clear they were not going to take no for an answer.\n"..
										"\n"..
										"Here in the Spance, the Starbases have their Warp Drive replaced with a SAIL drive to accompany their Breach Interdiction and Breach Communications Suite. Breach Interdiction destabalized space around it, preventing anything nearby from safely exiting the zone- and tripping failsafes of those passing by. Unfortunately the shear amount of matter in the Spance has reduced its effectiveness to below what other Interdictors are capable of, in its already fairly short range. The Breach Communication Suite, however, enabled 0 lag communication between other BCSs, by 'entangling' Breaches to send data.\n"..
										"\n"..
										"The Breach Nodes surrounding the Starbase enable it to punch through the strange distortions present within the Spance, providing auxiliary power in addition to strengthened communications.\n"..
										"\n",
		weaponInfo                  = functions.combineWeaponInfo({
			{prefab.weapon_info.hangar.quartz(4),},
		}),
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = scaleConst,
	mainMesh                    = "Core/Core",
	materials                   = { "arc_hull", "arc_teamGlow", "arc_teamColour", "arc_hull_dark" },
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = .365,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 3292000,
		factionID    = 329,
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
			mesh    = "Core/Core",
			materials = { "0_arc_aegis", "0_arc_aegis", "0_arc_aegis", "0_arc_aegis" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			aegisVisual = true,
		},
		{
			name      = "Drone Bay N",
			position  = { 0, 8*.1/scaleConst, .75*.1/scaleConst },
			rotation  = { -90, 00, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 3295600, --int: The weaponData id to be used for this weapon.
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
				weaponID = 3295600, --int: The weaponData id to be used for this weapon.
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
				weaponID = 3295600, --int: The weaponData id to be used for this weapon.
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
				weaponID = 3295600, --int: The weaponData id to be used for this weapon.
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
		health = (1 - healthStats.proportionRegenMax) * 20000,
		health_regen_per_second = 50,
		max_regen_frac = 0,
		aegis_regen_per_second = 100 * healthStats.structAegisRegenMult,
		aegisMaximum = healthStats.proportionRegenMax * 20000,

		armour = 20,
		vulnerability_max = 0,
		shredMultiplier = 0,

		explosionSFX = 0,
		explosionSFXIntensity = 5,		-- Platforms blowing up is very important.

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
		explosionSizeOveride = 10,			-- Give it a hearty platform saildrive critical BOOM!!!
		flashSizeOverride = 0,
		forceShockwave = false,
		preventShockwave = false,
		randomiseInAllDirections = false,
		deathUnitSpawnDoNotRandomiseRotation = false,
		deathExplosionFriendlyFire = true,
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
	commandType = "CENTRAL",

	-- 🟦 STRUCTURE
	isStructure = true,
	structure = {
		type = "NONE", --NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		matrixDimensions = {6,6},
		matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
			0, 1, 1, 1, 1, 0,
			1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1,
			0, 1, 1, 1, 1, 0,
		 },
	},

	isInfluencer = true,
	influence = {
		strength = {20, 1},
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		ring = {0,11},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
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
		logistics = 80, 	-- int: Logistics
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
